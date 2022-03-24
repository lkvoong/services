-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: content_to_rotate; Type: VIEW; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE VIEW utils.content_to_rotate AS
 SELECT content.id,
    content.name,
    content.data
   FROM public.content
  WHERE ((content.data IS NOT NULL) AND (((content.name)::text ~~* 'OriginalJpeg_%.jpg'::text) OR ((content.name)::text ~~* 'Medium_%.jpg'::text) OR ((content.name)::text ~~* 'Thumbnail_%.jpg'::text)));


ALTER TABLE utils.content_to_rotate OWNER TO nuxeo_ucjeps;

