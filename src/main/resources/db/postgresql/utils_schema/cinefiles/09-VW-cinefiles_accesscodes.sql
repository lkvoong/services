-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: cinefiles_accesscodes; Type: VIEW; Schema: utils; Owner: nuxeo_cinefiles
--

CREATE VIEW utils.cinefiles_accesscodes AS
 SELECT cc.accesscode AS cccode,
    ocf.accesscode AS ocfcode,
    co.*::public.collectionobjects_common AS co,
    co.objectnumber
   FROM (((((public.hierarchy h1
     JOIN public.collectionobjects_common co ON ((((h1.id)::text = (co.id)::text) AND (co.recordstatus = 'approved'::text) AND ((h1.primarytype)::text = 'CollectionObjectTenant50'::text))))
     JOIN public.misc m ON ((((co.id)::text = (m.id)::text) AND ((m.lifecyclestate)::text <> 'deleted'::text))))
     JOIN public.collectionobjects_cinefiles cc ON (((co.id)::text = (cc.id)::text)))
     JOIN public.organizations_common oco ON (((cc.source)::text = (oco.refname)::text)))
     JOIN public.organizations_cinefiles ocf ON (((oco.id)::text = (ocf.id)::text)))
  WHERE (co.objectnumber ~ '^[0-9]+$'::text);


ALTER TABLE utils.cinefiles_accesscodes OWNER TO nuxeo_cinefiles;

