-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: mediatosubjectcsid; Type: VIEW; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE VIEW utils.mediatosubjectcsid AS
 SELECT h.id,
    h.name,
    m.identificationnumber
   FROM ((public.hierarchy h
     JOIN public.media_common m ON (((h.id)::text = (m.id)::text)))
     JOIN public.relations_common r ON ((((r.subjectdocumenttype)::text = 'Media'::text) AND ((r.subjectcsid)::text = (h.name)::text))));


ALTER TABLE utils.mediatosubjectcsid OWNER TO nuxeo_ucjeps;

