-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: view_counts; Type: TABLE; Schema: utils; Owner: nuxeo_pahma
--

CREATE TABLE utils.view_counts (
    filename character varying,
    vcount bigint
);


ALTER TABLE utils.view_counts OWNER TO nuxeo_pahma;

