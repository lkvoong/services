-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: object_place_location; Type: TABLE; Schema: utils; Owner: nuxeo_pahma
--

CREATE TABLE utils.object_place_location (
    id character varying(36),
    collectionobjectcsid character varying(36),
    objectnumber text,
    numberofobjects bigint,
    placecsid text,
    placename text,
    place_csid_hierarchy text,
    storagelocation text,
    crate text
);


ALTER TABLE utils.object_place_location OWNER TO nuxeo_pahma;

