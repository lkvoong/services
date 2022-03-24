-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: webfarmimgs; Type: TABLE; Schema: utils; Owner: nuxeo_cinefiles
--

CREATE TABLE utils.webfarmimgs (
    doc_id integer,
    pagenum integer,
    docpage text,
    filename text,
    inarchive boolean DEFAULT false,
    incspace boolean DEFAULT false
);


ALTER TABLE utils.webfarmimgs OWNER TO nuxeo_cinefiles;

