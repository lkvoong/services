-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: media_blob_titles; Type: VIEW; Schema: utils; Owner: nuxeo_cinefiles
--

CREATE VIEW utils.media_blob_titles AS
 SELECT m.title,
    m.blobcsid,
    b.name AS filename
   FROM ((public.hierarchy h
     JOIN public.media_common m ON (((length((m.blobcsid)::text) > 0) AND ((m.blobcsid)::text = (h.name)::text))))
     JOIN public.blobs_common b ON (((h.id)::text = (b.id)::text)));


ALTER TABLE utils.media_blob_titles OWNER TO nuxeo_cinefiles;

