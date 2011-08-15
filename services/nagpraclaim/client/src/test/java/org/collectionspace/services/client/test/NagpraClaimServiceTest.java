/**
 * This document is a part of the source code and related artifacts
 * for CollectionSpace, an open source collections management system
 * for museums and related institutions:
 *
 * http://www.collectionspace.org
 * http://wiki.collectionspace.org
 *
 * Copyright © 2009 Regents of the University of California
 *
 * Licensed under the Educational Community License (ECL), Version 2.0.
 * You may not use this file except in compliance with this License.
 *
 * You may obtain a copy of the ECL 2.0 License at
 * https://source.collectionspace.org/collection-space/LICENSE.txt
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.collectionspace.services.client.test;

//import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.collectionspace.services.client.CollectionSpaceClient;
import org.collectionspace.services.client.NagpraClaimClient;
import org.collectionspace.services.client.NagpraClaimProxy;
import org.collectionspace.services.client.PayloadInputPart;
import org.collectionspace.services.client.PayloadOutputPart;
import org.collectionspace.services.client.PoxPayloadIn;
import org.collectionspace.services.client.PoxPayloadOut;
import org.collectionspace.services.jaxb.AbstractCommonList;
import org.collectionspace.services.nagpraclaim.NagpraclaimsCommon;

import org.jboss.resteasy.client.ClientResponse;
import org.testng.Assert;
import org.testng.annotations.Test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * NagpraClaimServiceTest, carries out tests against a
 * deployed and running NAGPRA Claim Service.
 *
 * $LastChangedRevision: $
 * $LastChangedDate: $
 */
public class NagpraClaimServiceTest extends AbstractServiceTestImpl {

   /** The logger. */
    private final String CLASS_NAME = NagpraClaimServiceTest.class.getName();
    private final Logger logger = LoggerFactory.getLogger(CLASS_NAME);
    
    /** The known resource id. */
    private String knownResourceId = null;
    
    @Override
	public String getServicePathComponent() {
		return NagpraClaimClient.SERVICE_PATH_COMPONENT;
	}

	@Override
	protected String getServiceName() {
		return NagpraClaimClient.SERVICE_NAME;
	}
    
    @Override
    protected CollectionSpaceClient<AbstractCommonList, NagpraClaimProxy> getClientInstance() {
        return new NagpraClaimClient();
    }
    
    @Override
	protected AbstractCommonList getAbstractCommonList(
			ClientResponse<AbstractCommonList> response) {
        return response.getEntity(AbstractCommonList.class);
    }

    @Override
    @Test(dataProvider = "testName", dataProviderClass = AbstractServiceTestImpl.class)
    public void create(String testName) throws Exception {
        logger.debug(testBanner(testName, CLASS_NAME));
        setupCreate();
        NagpraClaimClient client = new NagpraClaimClient();
        PoxPayloadOut multipart = createNagpraClaimInstance(createIdentifier());
        ClientResponse<Response> res = client.create(multipart);
        assertStatusCode(res, testName);
        if (knownResourceId == null) {
            // Store the ID returned from the first resource created for additional tests below.
            knownResourceId = extractId(res);
            logger.debug(testName + ": knownResourceId=" + knownResourceId);
        }
        // Store the IDs from every resource created by tests so they can be deleted after tests have been run.
        allResourceIdsCreated.add(extractId(res));
    }

    @Override
    @Test(dataProvider = "testName", dataProviderClass = AbstractServiceTestImpl.class, dependsOnMethods = {"create"})
    public void createList(String testName) throws Exception {
        logger.debug(testBanner(testName, CLASS_NAME));
        for (int i = 0; i < 3; i++) {
            create(testName);
        }
    }

    @Override
    @Test(dataProvider = "testName", dataProviderClass = AbstractServiceTestImpl.class, dependsOnMethods = {"create"})
    public void read(String testName) throws Exception {
        logger.debug(testBanner(testName, CLASS_NAME));
        setupRead();
        NagpraClaimClient client = new NagpraClaimClient();
        ClientResponse<String> res = client.read(knownResourceId);
        assertStatusCode(res, testName);
        PoxPayloadIn input = new PoxPayloadIn(res.getEntity());
        NagpraclaimsCommon nagpraClaim = (NagpraclaimsCommon) extractPart(input, client.getCommonPartName(), NagpraclaimsCommon.class);
        Assert.assertNotNull(nagpraClaim);
    }

    @Override
    @Test(dataProvider = "testName", dataProviderClass = AbstractServiceTestImpl.class, dependsOnMethods = {"createList", "read"})
    public void readList(String testName) throws Exception {
        logger.debug(testBanner(testName, CLASS_NAME));
        setupReadList();
        NagpraClaimClient client = new NagpraClaimClient();
        ClientResponse<AbstractCommonList> res = client.readList();
        AbstractCommonList list = res.getEntity();
        assertStatusCode(res, testName);
        if (logger.isDebugEnabled()) {
            List<AbstractCommonList.ListItem> items =
                list.getListItem();
            int i = 0;
            for(AbstractCommonList.ListItem item : items){
                logger.debug(testName + ": list-item[" + i + "] " +
                        item.toString());
                i++;
            }
        }
    }

    @Override
    @Test(dataProvider = "testName", dataProviderClass = AbstractServiceTestImpl.class, dependsOnMethods = {"read"})
    public void update(String testName) throws Exception {
        logger.debug(testBanner(testName, CLASS_NAME));
        setupUpdate();
        NagpraClaimClient client = new NagpraClaimClient();
        ClientResponse<String> res = client.read(knownResourceId);
        assertStatusCode(res, testName);
        logger.debug("got object to update with ID: " + knownResourceId);
        PoxPayloadIn input = new PoxPayloadIn(res.getEntity());
        NagpraclaimsCommon nagpraClaim = (NagpraclaimsCommon) extractPart(input, client.getCommonPartName(), NagpraclaimsCommon.class);
        Assert.assertNotNull(nagpraClaim);
        String updatedClaimName = "updated-" + nagpraClaim.getNagpraClaimName();
        nagpraClaim.setNagpraClaimName(updatedClaimName);
        logger.debug("Object to be updated:"+objectAsXmlString(nagpraClaim, NagpraclaimsCommon.class));
        PoxPayloadOut output = new PoxPayloadOut(NagpraClaimClient.SERVICE_PAYLOAD_NAME);
        PayloadOutputPart commonPart = output.addPart(nagpraClaim, MediaType.APPLICATION_XML_TYPE);
        commonPart.setLabel(client.getCommonPartName());
        res = client.update(knownResourceId, output);
        assertStatusCode(res, testName);
        input = new PoxPayloadIn(res.getEntity());
        NagpraclaimsCommon updatedNagpraClaim =
            (NagpraclaimsCommon) extractPart(input, client.getCommonPartName(), NagpraclaimsCommon.class);
        Assert.assertNotNull(updatedNagpraClaim);
        Assert.assertEquals(updatedNagpraClaim.getNagpraClaimName(), updatedClaimName);
    }

    @Override
    @Test(dataProvider = "testName", dataProviderClass = AbstractServiceTestImpl.class,
        dependsOnMethods = {"update", "testSubmitRequest"})
    public void updateNonExistent(String testName) throws Exception {
        logger.debug(testBanner(testName, CLASS_NAME));
        setupUpdateNonExistent();
        // Submit the request to the service and store the response.
        // Note: The ID used in this 'create' call may be arbitrary.
        // The only relevant ID may be the one used in update(), below.
        NagpraClaimClient client = new NagpraClaimClient();
        PoxPayloadOut multipart = createNagpraClaimInstance(NON_EXISTENT_ID);
        ClientResponse<String> res = client.update(NON_EXISTENT_ID, multipart);
        assertStatusCode(res, testName);
    }

    @Override
    @Test(dataProvider = "testName", dataProviderClass = AbstractServiceTestImpl.class,
        dependsOnMethods = {"create", "readList", "testSubmitRequest", "update"})
    public void delete(String testName) throws Exception {
        logger.debug(testBanner(testName, CLASS_NAME));
        setupDelete();
        NagpraClaimClient client = new NagpraClaimClient();
        ClientResponse<Response> res = client.delete(knownResourceId);
        assertStatusCode(res, testName);
    }

    // ---------------------------------------------------------------
    // Failure outcome tests : means we expect response to fail, but test to succeed
    // ---------------------------------------------------------------

    // Failure outcome
    @Override
    @Test(dataProvider = "testName", dataProviderClass = AbstractServiceTestImpl.class, dependsOnMethods = {"read"})
    public void readNonExistent(String testName) throws Exception {
        logger.debug(testBanner(testName, CLASS_NAME));
        setupReadNonExistent();
        NagpraClaimClient client = new NagpraClaimClient();
        ClientResponse<String> res = client.read(NON_EXISTENT_ID);
        assertStatusCode(res, testName);
    }

    // Failure outcome
    @Override
    @Test(dataProvider = "testName", dataProviderClass = AbstractServiceTestImpl.class, dependsOnMethods = {"delete"})
    public void deleteNonExistent(String testName) throws Exception {
        logger.debug(testBanner(testName, CLASS_NAME));
        setupDeleteNonExistent();
        NagpraClaimClient client = new NagpraClaimClient();
        ClientResponse<Response> res = client.delete(NON_EXISTENT_ID);
        assertStatusCode(res, testName);
    }

    // Failure outcomes
    // Placeholders until the tests below can be implemented. See Issue CSPACE-401.

    @Override
    public void createWithEmptyEntityBody(String testName) throws Exception {
    }

    @Override
    public void createWithMalformedXml(String testName) throws Exception {
    }

    @Override
    public void createWithWrongXmlSchema(String testName) throws Exception {
    }

    @Override
    public void updateWithEmptyEntityBody(String testName) throws Exception {
    }

    @Override
    public void updateWithMalformedXml(String testName) throws Exception {
    }

    @Override
    public void updateWithWrongXmlSchema(String testName) throws Exception {
    }

    // ---------------------------------------------------------------
    // Utility tests : tests of code used in tests above
    // ---------------------------------------------------------------

    @Test(dependsOnMethods = {"create", "read"})
    public void testSubmitRequest() {
        final int EXPECTED_STATUS = Response.Status.OK.getStatusCode(); // Expected status code: 200 OK
        String method = ServiceRequestType.READ.httpMethodName();
        String url = getResourceURL(knownResourceId);
        int statusCode = submitRequest(method, url);
        logger.debug("testSubmitRequest: url=" + url + " status=" + statusCode);
        Assert.assertEquals(statusCode, EXPECTED_STATUS);
    }
    
    // ---------------------------------------------------------------
    // Utility methods used by tests above
    // ---------------------------------------------------------------


    @Override
    protected PoxPayloadOut createInstance(String identifier) {
    	return createNagpraClaimInstance(identifier);
    }
    
    /**
     * Creates a sample NAGPRA Claim instance.
     *
     * @param identifier the identifier
     * @return the multipart output
     */
    private PoxPayloadOut createNagpraClaimInstance(String identifier) {
        return createNagpraClaimInstance(
                "nagpraClaimName-" + identifier,
                "nagpraClaimNumber-" + identifier,
                "nagpraClaimType-" + identifier);
    }

    /**
     * Creates a sample NAGPRA Claim instance.
     *
     * @param nagpraClaimName the claim name
     * @param nagpraClaimNumber the claim number
     * @param nagpraClaimType the claim type
     * @return the multipart output
     */
    private PoxPayloadOut createNagpraClaimInstance(String nagpraClaimName,
    		String nagpraClaimNumber, String nagpraClaimType) {

        NagpraclaimsCommon nagpraClaimsCommon = new NagpraclaimsCommon();
        nagpraClaimsCommon.setNagpraClaimName(nagpraClaimName);
        nagpraClaimsCommon.setNagpraClaimNumber(nagpraClaimNumber);
        nagpraClaimsCommon.setNagpraClaimType(nagpraClaimType);

        PoxPayloadOut multipart = new PoxPayloadOut(this.getServicePathComponent());
        PayloadOutputPart commonPart =
            multipart.addPart(nagpraClaimsCommon, MediaType.APPLICATION_XML_TYPE);
        commonPart.setLabel(new NagpraClaimClient().getCommonPartName());

        if(logger.isDebugEnabled()){
            logger.debug("to be created, nagpraclaim common");
            logger.debug(objectAsXmlString(nagpraClaimsCommon, NagpraclaimsCommon.class));
        }

        return multipart;
    }
}
