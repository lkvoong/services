-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: activecobs_dv; Type: VIEW; Schema: utils; Owner: nuxeo_cinefiles
--

CREATE VIEW utils.activecobs_dv AS
 SELECT cof.id,
    cof.source,
    cof.accesscode
   FROM (public.collectionobjects_cinefiles cof
     JOIN public.misc m ON ((((m.id)::text = (cof.id)::text) AND ((m.lifecyclestate)::text <> 'deleted'::text))));


ALTER TABLE utils.activecobs_dv OWNER TO nuxeo_cinefiles;

