-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: refresh_log; Type: TABLE; Schema: utils; Owner: nuxeo_pahma
--

CREATE TABLE utils.refresh_log (
    msg character varying(50),
    msgdate timestamp without time zone DEFAULT now()
);


ALTER TABLE utils.refresh_log OWNER TO nuxeo_pahma;

