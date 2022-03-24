-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: taxon_hierarchy; Type: TABLE; Schema: utils; Owner: nuxeo_pahma
--

CREATE TABLE utils.taxon_hierarchy (
    taxoncsid text,
    taxon text,
    parentid text,
    nextcsid text,
    taxon_hierarchy text,
    csid_hierarchy text
);


ALTER TABLE utils.taxon_hierarchy OWNER TO nuxeo_pahma;

