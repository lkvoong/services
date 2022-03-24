-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: taxon_genus; Type: TABLE; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE TABLE utils.taxon_genus (
    id character varying(36),
    genus character varying(100),
    taxonrank character varying,
    taxonfullname character varying,
    displayname character varying
);


ALTER TABLE utils.taxon_genus OWNER TO nuxeo_ucjeps;

