-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: blobcsids_view; Type: VIEW; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE VIEW utils.blobcsids_view AS
 SELECT b.id,
    h.name AS blobcsid,
    b.name AS filename
   FROM (public.hierarchy h
     JOIN public.blobs_common b ON ((((h.id)::text = (b.id)::text) AND ((h.primarytype)::text = 'Blob'::text))));


ALTER TABLE utils.blobcsids_view OWNER TO nuxeo_ucjeps;

