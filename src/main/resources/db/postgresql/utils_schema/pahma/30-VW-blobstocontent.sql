-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: blobstocontent; Type: VIEW; Schema: utils; Owner: nuxeo_pahma
--

CREATE VIEW utils.blobstocontent AS
 SELECT bc.id AS blobid,
    bc.repositoryid,
    p.id AS pictureid,
    v.id AS viewid,
    c.id AS contentid,
    c.data AS contentdata,
    c.name AS filename
   FROM public.blobs_common bc,
    public.picture p,
    public.hierarchy h2,
    public.view v,
    public.hierarchy h3,
    public.content c
  WHERE (((bc.repositoryid)::text = (p.id)::text) AND ((h2.parentid)::text = (p.id)::text) AND ((v.id)::text = (h2.id)::text) AND ((v.id)::text = (h3.parentid)::text) AND ((c.id)::text = (h3.id)::text));


ALTER TABLE utils.blobstocontent OWNER TO nuxeo_pahma;

