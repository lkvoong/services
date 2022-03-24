-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: culture_hierarchy; Type: TABLE; Schema: utils; Owner: nuxeo_pahma
--

CREATE TABLE utils.culture_hierarchy (
    culturecsid text,
    culture text,
    parentid text,
    nextcsid text,
    culture_hierarchy text,
    csid_hierarchy text
);


ALTER TABLE utils.culture_hierarchy OWNER TO nuxeo_pahma;

