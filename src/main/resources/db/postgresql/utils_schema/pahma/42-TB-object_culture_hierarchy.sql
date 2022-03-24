-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: object_culture_hierarchy; Type: TABLE; Schema: utils; Owner: nuxeo_pahma
--

CREATE TABLE utils.object_culture_hierarchy (
    id character varying(36),
    collectionobjectcsid character varying(36),
    culture text,
    culturecsid text,
    culture_csid_hierarchy text
);


ALTER TABLE utils.object_culture_hierarchy OWNER TO nuxeo_pahma;

