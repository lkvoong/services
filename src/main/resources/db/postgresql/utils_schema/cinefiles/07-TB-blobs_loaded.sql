-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: blobs_loaded; Type: TABLE; Schema: utils; Owner: nuxeo_cinefiles
--

CREATE TABLE utils.blobs_loaded (
    doc_id integer,
    pagenum integer,
    docpage text,
    filename text
);


ALTER TABLE utils.blobs_loaded OWNER TO nuxeo_cinefiles;

