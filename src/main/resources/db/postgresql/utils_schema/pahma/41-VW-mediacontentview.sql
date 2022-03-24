-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: mediacontentview; Type: VIEW; Schema: utils; Owner: nuxeo_pahma
--

CREATE VIEW utils.mediacontentview AS
 SELECT mc.id,
    mc.blobcsid,
    mc.identificationnumber,
    bc.name,
    v.title,
    v.filename,
    c.id AS contentid,
    c.name AS contentname,
    c.data
   FROM (((((((public.media_common mc
     JOIN public.hierarchy h1 ON (((mc.blobcsid)::text = (h1.name)::text)))
     JOIN public.blobs_common bc ON (((bc.id)::text = (h1.id)::text)))
     JOIN public.picture p ON (((bc.repositoryid)::text = (p.id)::text)))
     JOIN public.hierarchy h2 ON (((h2.parentid)::text = (p.id)::text)))
     JOIN public.view v ON (((v.id)::text = (h2.id)::text)))
     JOIN public.hierarchy h3 ON (((h3.parentid)::text = (v.id)::text)))
     JOIN public.content c ON (((c.id)::text = (h3.id)::text)));


ALTER TABLE utils.mediacontentview OWNER TO nuxeo_pahma;

