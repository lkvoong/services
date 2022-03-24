-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: content_work_view; Type: VIEW; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE VIEW utils.content_work_view AS
 SELECT content.id,
    content.name,
    content.data,
    NULL::character varying(40) AS newdata,
    false AS rotated,
    (now())::timestamp without time zone AS date,
    0 AS w,
    0 AS h
   FROM public.content
  WHERE ((content.name IS NOT NULL) AND (length((content.name)::text) > 0) AND (content.data IS NOT NULL) AND (length((content.data)::text) > 0));


ALTER TABLE utils.content_work_view OWNER TO nuxeo_ucjeps;

