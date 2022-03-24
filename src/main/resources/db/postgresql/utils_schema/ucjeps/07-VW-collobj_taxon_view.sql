-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: collobj_taxon_view; Type: VIEW; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE VIEW utils.collobj_taxon_view AS
 SELECT o.id AS collobjid,
    h.name AS collobjcsid,
    o.objectnumber,
    t.id AS taxongroupid,
    t.taxon AS taxonrefname,
    regexp_replace((t.taxon)::text, '^.*\)''(.*)''$'::text, '\1'::text) AS taxon
   FROM (((public.collectionobjects_common o
     JOIN public.hierarchy h ON ((((o.id)::text = (h.id)::text) AND ((h.primarytype)::text = 'CollectionObjectTenant20'::text))))
     JOIN public.hierarchy h2 ON ((((h2.parentid)::text = (h.id)::text) AND (h2.pos = 0) AND ((h2.name)::text = 'collectionobjects_naturalhistory:taxonomicIdentGroupList'::text))))
     JOIN public.taxonomicidentgroup t ON (((h2.id)::text = (t.id)::text)));


ALTER TABLE utils.collobj_taxon_view OWNER TO nuxeo_ucjeps;

