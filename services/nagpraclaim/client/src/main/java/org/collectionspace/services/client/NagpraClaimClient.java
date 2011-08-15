/**	
 * This document is a part of the source code and related artifacts
 * for CollectionSpace, an open source collections management system
 * for museums and related institutions:
 *
 * http://www.collectionspace.org
 * http://wiki.collectionspace.org
 *
 * Copyright (c) 2009 Regents of the University of California
 *
 * Licensed under the Educational Community License (ECL), Version 2.0.
 * You may not use this file except in compliance with this License.
 *
 * You may obtain a copy of the ECL 2.0 License at
 * https://source.collectionspace.org/collection-space/LICENSE.txt
 */
package org.collectionspace.services.client;

import org.jboss.resteasy.client.ClientResponse;
import org.collectionspace.services.jaxb.AbstractCommonList;

/**
 * NagpraClaimClient.java
 *
 * $LastChangedRevision: $
 * $LastChangedDate: $
 */
public class NagpraClaimClient extends AbstractPoxServiceClientImpl<AbstractCommonList, NagpraClaimProxy> {
    public static final String SERVICE_NAME = "nagpraclaims";
    public static final String SERVICE_PATH_COMPONENT = SERVICE_NAME;
    public static final String SERVICE_PATH = "/" + SERVICE_PATH_COMPONENT;
    public static final String SERVICE_PAYLOAD_NAME = SERVICE_NAME;

    /* (non-Javadoc)
     * @see org.collectionspace.services.client.AbstractServiceClientImpl#getServicePathComponent()
     */
    @Override
    public String getServicePathComponent() {
        return SERVICE_PATH_COMPONENT;
    }

    @Override
    public String getServiceName() {
        return SERVICE_NAME;
    }

	@Override
	public Class<NagpraClaimProxy> getProxyClass() {
		return NagpraClaimProxy.class;
	}

    /*
     * Proxied service calls
     */

    /**
     * @return
     * @see org.collectionspace.services.client.NagpraClaimProxy#getNagpraClaim()
     */
    
    // FIXME: The method below can be removed as of v1.9 - Aron

    public ClientResponse<AbstractCommonList> readList() {
        return getProxy().readList();
    }
}
