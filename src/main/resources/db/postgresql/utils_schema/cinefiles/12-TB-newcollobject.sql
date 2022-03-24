-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: newcollobject; Type: TABLE; Schema: utils; Owner: nuxeo_cinefiles
--

CREATE TABLE utils.newcollobject (
    id character varying(36),
    hasbiblio boolean,
    doctype character varying,
    doctitle character varying,
    hasdistco boolean,
    doctitlearticle character varying,
    hasillust boolean,
    hasprodco boolean,
    hasfilmog boolean,
    source character varying,
    pageinfo character varying,
    hascastcr boolean,
    hascostinfo boolean,
    accesscode character varying,
    hastechcr boolean,
    docdisplayname character varying,
    hasboxinfo boolean
);


ALTER TABLE utils.newcollobject OWNER TO nuxeo_cinefiles;

