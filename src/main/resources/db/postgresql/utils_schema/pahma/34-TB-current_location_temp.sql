-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: current_location_temp; Type: TABLE; Schema: utils; Owner: nuxeo_pahma
--

CREATE TABLE utils.current_location_temp (
    collectionobjectcsid character varying(36),
    storagelocation text,
    crate text
);


ALTER TABLE utils.current_location_temp OWNER TO nuxeo_pahma;

