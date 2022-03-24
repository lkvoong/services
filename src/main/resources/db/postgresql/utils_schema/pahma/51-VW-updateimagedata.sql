-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: updateimagedata; Type: VIEW; Schema: utils; Owner: nuxeo_pahma
--

CREATE VIEW utils.updateimagedata AS
 SELECT c.data,
    mc.blobcsid,
    c.name
   FROM public.media_common mc,
    public.hierarchy h1,
    public.blobs_common bc,
    public.content c,
    public.hierarchy h2,
    public.hierarchy h3
  WHERE (((mc.blobcsid)::text = (h1.name)::text) AND ((h1.id)::text = (bc.id)::text) AND ((h3.parentid)::text = (bc.repositoryid)::text) AND ((h2.parentid)::text = (h3.id)::text) AND ((c.id)::text = (h2.id)::text) AND ((c.name)::text ~~ 'Original\_%'::text));


ALTER TABLE utils.updateimagedata OWNER TO nuxeo_pahma;

