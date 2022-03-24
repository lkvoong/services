-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: material_hierarchy; Type: TABLE; Schema: utils; Owner: nuxeo_pahma
--

CREATE TABLE utils.material_hierarchy (
    materialcsid text,
    material text,
    parentid text,
    nextcsid text,
    material_hierarchy text,
    csid_hierarchy text
);


ALTER TABLE utils.material_hierarchy OWNER TO nuxeo_pahma;

