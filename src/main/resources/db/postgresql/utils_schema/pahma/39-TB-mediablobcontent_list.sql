-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: mediablobcontent_list; Type: TABLE; Schema: utils; Owner: nuxeo_pahma
--

CREATE TABLE utils.mediablobcontent_list (
    mid character varying(36),
    bcsid character varying,
    cid character varying(36),
    rcnt integer NOT NULL
);


ALTER TABLE utils.mediablobcontent_list OWNER TO nuxeo_pahma;

