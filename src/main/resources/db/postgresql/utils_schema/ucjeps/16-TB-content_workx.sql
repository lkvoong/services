-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: content_workx; Type: TABLE; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE TABLE utils.content_workx (
    id character varying(36),
    name character varying,
    data character varying(40),
    newdata character varying(40),
    rotated boolean,
    date timestamp without time zone,
    w integer,
    h integer
);


ALTER TABLE utils.content_workx OWNER TO nuxeo_ucjeps;
