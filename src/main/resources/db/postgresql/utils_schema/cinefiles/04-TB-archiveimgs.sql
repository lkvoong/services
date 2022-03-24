-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: archiveimgs; Type: TABLE; Schema: utils; Owner: nuxeo_cinefiles
--

CREATE TABLE utils.archiveimgs (
    doc_id integer,
    pagenum integer,
    docpage text,
    filename text,
    prefimg boolean DEFAULT false
);


ALTER TABLE utils.archiveimgs OWNER TO nuxeo_cinefiles;

