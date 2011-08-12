package org.collectionspace.services.client;

import org.jboss.resteasy.client.ClientResponse;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import org.collectionspace.services.client.workflow.WorkflowClient;
import org.collectionspace.services.jaxb.AbstractCommonList;

/**
 * @version $Revision: 4554 $
 */
@Path("/nagpraclaims/")
@Produces({"application/xml;charset=UTF-8"})
@Consumes({"application/xml"})
public interface NagpraClaimProxy extends CollectionSpacePoxProxy<AbstractCommonList> {   
    
    // FIXME: The methods below can be removed as of v1.9 - Aron
    
    // List
    @GET
    ClientResponse<AbstractCommonList> readList();
    
    @Override
	@GET
    @Produces({"application/xml"})
    ClientResponse<AbstractCommonList> readIncludeDeleted(
            @QueryParam(WorkflowClient.WORKFLOW_QUERY_NONDELETED) String includeDeleted);
            
    @Override
    @GET
    @Produces({"application/xml"})
    ClientResponse<AbstractCommonList> keywordSearchIncludeDeleted(
    		@QueryParam(IQueryManager.SEARCH_TYPE_KEYWORDS_KW) String keywords,
            @QueryParam(WorkflowClient.WORKFLOW_QUERY_NONDELETED) String includeDeleted);
}
