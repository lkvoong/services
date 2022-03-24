-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: placename_hierarchy; Type: TABLE; Schema: utils; Owner: nuxeo_pahma
--

CREATE TABLE utils.placename_hierarchy (
    placecsid text,
    placename text,
    parentid text,
    nextcsid text,
    place_hierarchy text,
    csid_hierarchy text
);


ALTER TABLE utils.placename_hierarchy OWNER TO nuxeo_pahma;

