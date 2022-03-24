-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: current_location_view; Type: VIEW; Schema: utils; Owner: nuxeo_pahma
--

CREATE VIEW utils.current_location_view AS
 SELECT cc.id AS collectionobjectcsid,
    regexp_replace((cc.computedcurrentlocation)::text, '^.*\)''(.*)''$'::text, '\1'::text) AS storagelocation,
        CASE
            WHEN (ca.computedcrate IS NULL) THEN NULL::text
            ELSE regexp_replace((ca.computedcrate)::text, '^.*\)''(.*)''$'::text, '\1'::text)
        END AS crate
   FROM ((public.collectionobjects_common cc
     LEFT JOIN public.collectionobjects_anthropology ca ON (((ca.id)::text = (cc.id)::text)))
     JOIN public.misc misc ON ((((cc.id)::text = (misc.id)::text) AND ((misc.lifecyclestate)::text <> 'deleted'::text))));


ALTER TABLE utils.current_location_view OWNER TO nuxeo_pahma;

