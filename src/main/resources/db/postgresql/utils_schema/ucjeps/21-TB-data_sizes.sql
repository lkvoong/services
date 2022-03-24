-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: data_sizes; Type: TABLE; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE TABLE utils.data_sizes (
    data character varying(40),
    w integer,
    h integer,
    finished boolean,
    date timestamp without time zone DEFAULT now()
);


ALTER TABLE utils.data_sizes OWNER TO nuxeo_ucjeps;

