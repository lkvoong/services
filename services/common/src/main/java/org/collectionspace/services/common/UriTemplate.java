/**
 * This document is a part of the source code and related artifacts for
 * CollectionSpace, an open source collections management system for museums and
 * related institutions:
 *
 * http://www.collectionspace.org http://wiki.collectionspace.org
 *
 * Copyright © 2009-2012 University of California, Berkeley
 *
 * Licensed under the Educational Community License (ECL), Version 2.0. You may
 * not use this file except in compliance with this License.
 *
 * You may obtain a copy of the ECL 2.0 License at
 *
 * https://source.collectionspace.org/collection-space/LICENSE.txt
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */
package org.collectionspace.services.common;

import java.net.URI;
import java.util.Map;
import javax.ws.rs.core.UriBuilder;
import javax.ws.rs.core.UriBuilderException;
import org.collectionspace.services.common.api.Tools;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * UriTemplate.java
 *
 * Generates URI strings by combining a URI template with provided values, which
 * replace variables within the template.
 */
public class UriTemplate {

    private static final Logger logger = LoggerFactory.getLogger(UriTemplate.class);
    private UriBuilder builder;
    private String uriPath;
    private final static String EMPTY_STRING = "";

    public UriTemplate(String path) {
        setUriPath(path);
        setBuilder();
    }

    private void setUriPath(String path) {
        if (Tools.notBlank(path)) {
            this.uriPath = path;
        }
    }

    private String getUriPath() {
        return uriPath;
    }

    private void setBuilder() {
        if (builder == null) {
            try {
                builder = UriBuilder.fromPath(getUriPath());
            } catch (IllegalArgumentException iae) {
                logger.warn("URI path was null when attempting to creating new UriTemplate.");
                // No other checking of path format, other than for null values,
                // is performed automatically by this Exception handling.
            }
        }
    }

    private UriBuilder getBuilder() {
        if (builder == null) {
            setBuilder();
        }
        return builder;
    }

    @Override
    public String toString() {
        return getUriPath();
    }

    public String buildUri(Map<String, String> valuesMap) {
        URI uri = null;
        try {
            uri = getBuilder().buildFromMap(valuesMap);
        } catch (IllegalArgumentException iae) {
            logger.warn("One or more required parameter values were missing "
                    + "when building URI value via URI Template: " + iae.getMessage());
        } catch (UriBuilderException ube) {
            logger.warn("URI value can't be constructed due to state of URIBuilder: " + ube.getMessage());
        } finally {
            if (uri != null) {
                return uri.toString();
            } else {
                return EMPTY_STRING;
            }
        }
    }
}