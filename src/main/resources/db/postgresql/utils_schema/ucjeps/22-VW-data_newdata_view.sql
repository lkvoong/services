-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: data_newdata_view; Type: VIEW; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE VIEW utils.data_newdata_view AS
 SELECT c.name,
    c.data,
    d.data AS olddata,
    d.newdata,
    d.date,
    d.rotated,
    s.w,
    s.h,
    s.date AS sizedate
   FROM utils.data_sizes s,
    public.content c,
    utils.content_work_done d
  WHERE (((c.id)::text = (d.id)::text) AND ((c.data)::text = (s.data)::text));


ALTER TABLE utils.data_newdata_view OWNER TO nuxeo_ucjeps;

