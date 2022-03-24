-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: blob_md5_dates_dv; Type: VIEW; Schema: utils; Owner: nuxeo_cinefiles
--

CREATE VIEW utils.blob_md5_dates_dv AS
 SELECT b.id AS blobid,
    c.id AS contentid,
    b.name AS filename,
    c.data AS md5,
    cc.createdat,
    cc.updatedat
   FROM ((((((public.blobs_common b
     JOIN public.picture p ON (((b.repositoryid)::text = (p.id)::text)))
     JOIN public.hierarchy h2 ON ((((p.id)::text = (h2.parentid)::text) AND ((h2.primarytype)::text = 'view'::text))))
     JOIN public.view v ON ((((h2.id)::text = (v.id)::text) AND ((v.tag)::text = 'original'::text))))
     JOIN public.hierarchy h1 ON ((((v.id)::text = (h1.parentid)::text) AND ((h1.primarytype)::text = 'content'::text))))
     JOIN public.content c ON (((h1.id)::text = (c.id)::text)))
     JOIN public.collectionspace_core cc ON (((cc.id)::text = (b.id)::text)));


ALTER TABLE utils.blob_md5_dates_dv OWNER TO nuxeo_cinefiles;

