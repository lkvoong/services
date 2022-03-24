-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: newcontent; Type: TABLE; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE TABLE utils.newcontent (
    data character varying(40),
    newdata character varying(40),
    name text,
    rotated boolean
);


ALTER TABLE utils.newcontent OWNER TO nuxeo_ucjeps;

