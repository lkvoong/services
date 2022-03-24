-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: org_urls_view; Type: VIEW; Schema: utils; Owner: nuxeo_cinefiles
--

CREATE VIEW utils.org_urls_view AS
 SELECT h1.id AS webaddressid,
    h1.name AS webaddresscsid,
    h2.id AS contactid,
    h2.name AS contactcsid,
    h3.id AS organizationid,
    h3.name AS organizationcsid,
    oc.shortidentifier,
    wag.id,
    wag.webaddress,
    wag.webaddresstype
   FROM (((((public.webaddressgroup wag
     JOIN public.hierarchy h1 ON ((((wag.id)::text = (h1.id)::text) AND (length((wag.webaddress)::text) > 5))))
     JOIN public.hierarchy h2 ON (((h1.parentid)::text = (h2.id)::text)))
     JOIN public.contacts_common cc ON (((h2.id)::text = (cc.id)::text)))
     JOIN public.hierarchy h3 ON (((cc.initem)::text = (h3.name)::text)))
     JOIN public.organizations_common oc ON (((h3.id)::text = (oc.id)::text)));


ALTER TABLE utils.org_urls_view OWNER TO nuxeo_cinefiles;

