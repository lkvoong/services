package org.collectionspace.services.structureddate;

import java.lang.reflect.Array;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Stack;

import org.apache.commons.beanutils.PropertyUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.testng.Assert;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;
import org.yaml.snakeyaml.Yaml;

public class StructuredDateEvaluatorTest {
	public static final String TEST_CASE_FILE = "/test-dates.yaml";
	public static final List<String> YAML_DATE_SPEC = Arrays.asList("year", "month", "day", "era", "certainty", "qualifierType", "qualifierValue", "qualifierUnit");

	final Logger logger = LoggerFactory.getLogger(StructuredDateEvaluatorTest.class);

	@BeforeClass
	public void setUp() {

	};

	@Test
	public void test() {
		Yaml yaml = new Yaml();
		Map<String, Object> testCases = (Map<String, Object>) yaml.load(getClass().getResourceAsStream(TEST_CASE_FILE));

		for (String displayDate : testCases.keySet()) {
			logger.debug("Testing input: " + displayDate);

			Map<String, Object> expectedStructuredDateFields = (Map<String, Object>) testCases.get(displayDate);

			StructuredDateInternal expectedStructuredDate = createStructuredDateFromYamlSpec(displayDate, expectedStructuredDateFields);
			StructuredDateInternal actualStructuredDate = null;
			
			try {
				actualStructuredDate = StructuredDateInternal.parse(displayDate);
			}
			catch(StructuredDateFormatException e) {
				logger.debug(e.getMessage());
			}

			Assert.assertEquals(actualStructuredDate, expectedStructuredDate);
		}
	}

	private StructuredDateInternal createStructuredDateFromYamlSpec(String displayDate, Map<String, Object> structuredDateFields) {
		StructuredDateInternal structuredDate = null;

		if (structuredDateFields != null && structuredDateFields.containsKey("latestDate")) {
			Object latestDate = structuredDateFields.get("latestDate");
			if (latestDate instanceof String) {
				Date currentDate = DateUtils.getCurrentDate();
				ArrayList latestDateItems = new ArrayList<>();
				if (latestDate.equals("current date")) {
					latestDateItems.add(currentDate.getYear());
					latestDateItems.add(currentDate.getMonth());
					latestDateItems.add(currentDate.getDay());
					latestDateItems.add(currentDate.getEra() == Era.BCE ? "BCE" : "CE");
					structuredDateFields.put("latestDate", latestDateItems);
				}
				if (latestDate.equals("uncalibrated latest date")) {
					Stack<ArrayList> results = calculateUncalibratedDate(displayDate, currentDate.getYear());
					structuredDateFields.put("latestDate", results.pop());
					structuredDateFields.put("earliestSingleDate", results.pop());
				}
			}
		}

		if (structuredDateFields != null) {
			structuredDate = new StructuredDateInternal();

			for (String propertyName : structuredDateFields.keySet()) {
				Object value = structuredDateFields.get(propertyName);

				try {
					Class propertyType = PropertyUtils.getPropertyType(structuredDate, propertyName);

					if (propertyType.equals(Date.class)) {
						value = createDateFromYamlSpec((List<Object>) value);
					}

					PropertyUtils.setProperty(structuredDate, propertyName, value);
				}
				catch(NoSuchMethodException e) {
					logger.warn(propertyName + " is not a property");
				}
				catch(InvocationTargetException e) {
					logger.error(propertyName + " accessor threw an exception");
				}
				catch(IllegalAccessException e) {
					logger.error("could not access property " + propertyName);
				}
			}
			
			if (structuredDate.getDisplayDate() == null) {
				structuredDate.setDisplayDate(displayDate);
			}
		}

		return structuredDate;
	}


	/** 
	 * Calculates the uncalibrated date, since the yalm expected dates need to be dynamic
	 * as they will change from year to year. 
	 * @param displayDate The current test's display date
	 * @param currentYear The current year
	 * 
	 * @return a stack consisting of two ArrayLists, each containing the expected dates
	*/
	public Stack<ArrayList> calculateUncalibratedDate(String displayDate, Integer currentYear) {
		Stack<ArrayList> stack = new Stack<ArrayList>();
		ArrayList latestDate = new ArrayList<>();
		ArrayList earliestDate = new ArrayList<>();


		String reg = "±|\\+/-";
		String[] splitDateTokens = displayDate.split(reg);
		String[] tokensPartTwo = splitDateTokens[1].split(" ");

		Integer mainYear = Integer.parseInt(splitDateTokens[0].replaceAll("\\s|,", ""));
		Integer offset;

		try {
			offset = Integer.parseInt(tokensPartTwo[0]);
		} catch (Exception e) {
			offset = Integer.parseInt(tokensPartTwo[1].replaceAll("\\s|,", ""));
		}

		Integer earliestYear = currentYear - (mainYear + offset);
		Integer latestYear   = currentYear - (mainYear - offset);
		
		String earliestEra = earliestYear < 0 ? "BCE" : "CE";
		String latestEra = latestYear < 0 ? "BCE" : "CE";
		
		earliestYear = Math.abs(earliestYear);
		latestYear = Math.abs(latestYear);

		latestDate.add(latestYear);
		latestDate.add(12);
		latestDate.add(DateUtils.getDaysInMonth(12, latestYear, null));
		latestDate.add(latestEra);

		earliestDate.add(earliestYear);
		earliestDate.add(1);
		earliestDate.add(1);
		earliestDate.add(earliestEra);

		stack.push(earliestDate);
		stack.push(latestDate);

		return stack;
	}

	private Date createDateFromYamlSpec(List<Object> dateFields) {
		Date date = new Date();
		Iterator<Object> fieldIterator = dateFields.iterator();

		for (String propertyName : YAML_DATE_SPEC) {
			Object value = fieldIterator.hasNext() ? fieldIterator.next() : null;

			try {
				Class propertyType = PropertyUtils.getPropertyType(date, propertyName);

				if (value != null && Enum.class.isAssignableFrom(propertyType)) {
					value = Enum.valueOf(propertyType, (String) value);
				}

				PropertyUtils.setProperty(date, propertyName, value);
			}
			catch(NoSuchMethodException e) {
				logger.warn(propertyName + " is not a property");
			}
			catch(InvocationTargetException e) {
				logger.error(propertyName + " accessor threw an exception");
			}
			catch(IllegalAccessException e) {
				logger.error("could not access property " + propertyName);
			}   		
		}

		return date;
	}
}
