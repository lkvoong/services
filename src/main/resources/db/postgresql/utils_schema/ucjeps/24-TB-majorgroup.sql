-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: majorgroup; Type: TABLE; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE TABLE utils.majorgroup (
    majorgroup character varying(15) NOT NULL,
    genus character varying(50) NOT NULL
);


ALTER TABLE utils.majorgroup OWNER TO nuxeo_ucjeps;

