-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: object_place_temp; Type: TABLE; Schema: utils; Owner: nuxeo_pahma
--

CREATE TABLE utils.object_place_temp (
    id character varying(36),
    collectionobjectcsid character varying,
    numberofobjects bigint,
    objectnumber text,
    placecsid text
);


ALTER TABLE utils.object_place_temp OWNER TO nuxeo_pahma;

