-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: derivative_data_newdata_view; Type: VIEW; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE VIEW utils.derivative_data_newdata_view AS
 SELECT data_newdata_view.name,
    data_newdata_view.data,
    data_newdata_view.olddata,
    data_newdata_view.newdata,
    data_newdata_view.date,
    data_newdata_view.rotated,
    data_newdata_view.w,
    data_newdata_view.h,
    data_newdata_view.sizedate
   FROM utils.data_newdata_view
  WHERE (((data_newdata_view.name)::text ~~* 'OriginalJpeg%'::text) OR ((data_newdata_view.name)::text ~~* 'Medium%'::text) OR ((data_newdata_view.name)::text ~~* 'Thumbnail%'::text));


ALTER TABLE utils.derivative_data_newdata_view OWNER TO nuxeo_ucjeps;

