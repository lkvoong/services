package org.collectionspace.services.batch.nuxeo;

import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.IllegalFormatException;

import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;

import org.nuxeo.ecm.core.api.DocumentModel;
import org.collectionspace.services.client.CollectionSpaceClient;
import org.collectionspace.services.client.CollectionObjectClient;
import org.collectionspace.services.collectionobject.CollectionObjectResource;

import org.collectionspace.services.client.PayloadOutputPart;
import org.collectionspace.services.client.PoxPayloadOut;
import org.collectionspace.services.client.RelationClient;
import org.collectionspace.services.client.workflow.WorkflowClient;
import org.collectionspace.services.collectionobject.nuxeo.CollectionObjectConstants;
import org.collectionspace.services.common.NuxeoBasedResource;
import org.collectionspace.services.common.api.RefNameUtils;
import org.collectionspace.services.common.api.RefNameUtils.AuthorityTermInfo;
import org.collectionspace.services.common.authorityref.AuthorityRefDocList;
import org.collectionspace.services.common.invocable.InvocationContext.Params.Param;
import org.collectionspace.services.common.invocable.InvocationResults;
import org.collectionspace.services.common.relation.RelationResource;
import org.collectionspace.services.common.vocabulary.AuthorityResource;
// import org.collectionspace.services.relation.RelationsCommonList;
import org.collectionspace.services.common.api.RefName;
import org.collectionspace.services.nuxeo.util.NuxeoUtils;
import org.collectionspace.services.jaxb.AbstractCommonList;
import org.collectionspace.services.relation.RelationsCommonList;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.Node;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.collectionspace.services.batch.AbstractBatchInvocable;
import org.collectionspace.services.common.invocable.InvocationContext;
import org.collectionspace.services.client.CollectionSpaceClientUtils;
import org.collectionspace.services.relation.RelationsCommonList.RelationListItem;

/**
  This batch job either creates a new group using the records passed in, or updates a group with those same records. Only list context is supported.

  If createNew is true, then a group with the name groupName will be created and the ListCSIDs will be related to it.
  If createNew is null/false, then the group with name name groupName will be updated to include the records in the ListCSIDs.

*/

public class GrouperBatchJob extends AbstractBatchJob {
  private final String GROUP_CLIENT = "groups"; // hardcoding here since import isn't working?
  private final String COLLECTIONOBJECT_DOCTYPE = "CollectionObject";
  private final String RELATION_TYPE = "affects"; 
  private final String RELATION_PREDICATE_DISP = "affects"; 
  private final String GROUP_DOCTYPE = "Group";
  final static String RELATION_DOCTYPE = "Relation";
  final static String RELATIONS_COMMON_SUBJECT_CSID_FIELD = "relations_common:subjectCsid";
  final static String RELATIONS_COMMON_OBJECT_CSID_FIELD = "relations_common:objectCsid";
  final Logger logger = LoggerFactory.getLogger(GrouperBatchJob.class);

  public GrouperBatchJob() {
    setSupportedInvocationModes(Arrays.asList(INVOCATION_MODE_GROUP));
  }


  @Override
  public void run() {
    setCompletionStatus(STATUS_MIN_PROGRESS);

    String mode = getInvocationContext().getMode();

    try { 
      // extract the params

      boolean createNew = false;
      boolean update = false;
      boolean remove = false;

      ArrayList<String> displayNames =  new ArrayList<String>();

      for (Param param : this.getParams()) {
        // if params is 1: Then either remove or update are moving
        String key = param.getKey();

        if (key.equals("groupItems")) {
          displayNames.addAll(Arrays.asList(param.getValue().split(",")));
        }
        if (key.equals("removeFromGroup")) {
          remove  = Boolean.parseBoolean(param.getValue());
        }
      }
      String groupCSID = invocationCtx.getGroupCSID(); // MUST use getGroupCSID otherwise nuh
      // createKeywordSearchUriInfo


      // use findAll() to find all matching each groupDisplayName
      ArrayList<String> listCsids = getObjectCSIDs(displayNames);
      logger.info("List of CSIDs: " + listCsids.toString());

      int numberCreated = 0;
      int numberDeleted = 0;
      for (String csid : listCsids) {
        if (!remove) {
          if (createRelation(groupCSID, GROUP_DOCTYPE, csid, COLLECTIONOBJECT_DOCTYPE, RELATION_TYPE) == null) {
            break;
          } else {
            numberCreated += 1;
          }
        } else {
          if (unrelateRecords(groupCSID, csid) == "") {
            break;
          } else {
            numberDeleted += 1;
          }
        }
      }

      if (completionStatus != STATUS_ERROR) {
        if (!remove) {
          results.setNumAffected(numberCreated);
          results.setUserNote("GrouperBatchJob created or updated group with csid " + groupCSID + " and linked " + numberCreated + " collection object records.");
        } else {
          results.setNumAffected(numberDeleted);
          results.setUserNote("GrouperBatchJob deleted relation between" + numberDeleted + " collection object records.");
        }

        setCompletionStatus(STATUS_COMPLETE);
      }

    } catch (Exception e) {
      completionStatus = STATUS_ERROR;
			errorInfo = new InvocationError(INT_ERROR_STATUS,
					"Grouper batch job had  a  problem creating relations: "+e.getLocalizedMessage());
			results.setUserNote(errorInfo.getMessage());
    }
  }

  public ArrayList<String> getObjectCSIDs(ArrayList<String> displayNames) throws URISyntaxException {
    ArrayList<String> csids = new ArrayList<String>();

    CollectionObjectResource collectionObjectResource = (CollectionObjectResource) getResourceMap().get(CollectionObjectClient.SERVICE_NAME);

    for (String displayName : displayNames) {
      UriInfo uriInfo = createKeywordSearchUriInfo("collectionobjects_common", "objectNumber", displayName.trim()); // trim it
      logger.warn("Searching for record: " + uriInfo.toString());

      AbstractCommonList objectList = collectionObjectResource.getList(getServiceContext(), uriInfo);

      for (AbstractCommonList.ListItem item : objectList.getListItem()) {
        for (org.w3c.dom.Element element : item.getAny()) {
          if (element.getTagName().equals("csid")) {
            String csid = element.getTextContent();

            if (!csids.contains(csid) && csid != null) {
              csids.add(csid);
            } else {
              logger.warn("The csid " + csid + " was skipped, as it was a duplicate.");
            }

            break;
          }
        }
      }
    }

    return csids;
  }

  public String unrelateRecords(String objCsid, String groupCsid) throws URISyntaxException, ResourceException {
    // Retreieve relation record
    NuxeoBasedResource resource = (NuxeoBasedResource) getResourceMap().get(RelationClient.SERVICE_NAME);
    

    String queryString = "";
    try { // subject  =   groupcsid,  object = objectcsid
      queryString = String.format("SELECT * FROM Relation WHERE ecm:isProxy = 0 AND (%1$s='%2$s' AND %3$s='%4$s')", RELATIONS_COMMON_SUBJECT_CSID_FIELD, groupCsid, RELATIONS_COMMON_OBJECT_CSID_FIELD, objCsid);
    } catch (IllegalFormatException e) {
      logger.warn("Construction of formatted query string failed: ", e); 
    }

    UriInfo uri = createUriInfo(queryString);
    // UriInfo relUri = createRelationSearchUriInfo(groupCsid, GROUP_DOCTYPE, "", objCsid, COLLECTIONOBJECT_DOCTYPE);


   RelationsCommonList relationList =  (RelationsCommonList) resource.getList(getServiceContext(), uri); // use this one
//    String
    // List<RelationListItem> rels = findRelated(groupCsid, GROUP_DOCTYPE, "affects", objCsid, COLLECTIONOBJECT_DOCTYPE);
    // There should only be ONE relation between these two objects... so get it
    // String relCsid = relationList.getRelationListItem().get(0).csid;
//    String relCsid = relationList.relationListItem.get(0).csid;

    String relCsid = null;
    relCsid = relationList.getRelationListItem().get(0).getCsid();
    if (relCsid == null) {
      logger.warn("The csid relation between Group " + groupCsid + " and Object " + objCsid);
    }

    // Delete relation recod
    Response response = resource.delete(relCsid);

    if (response.getStatus() != OK_STATUS) {
      throw new ResourceException(response, "Error deleting relation");
    }

    return relCsid;


  }
}