-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: object_place_view; Type: VIEW; Schema: utils; Owner: nuxeo_pahma
--

CREATE VIEW utils.object_place_view AS
 SELECT c.id,
    h1.name AS collectionobjectcsid,
    c.numberofobjects,
    c.objectnumber,
    pn.placecsid
   FROM (((public.collectionobjects_common c
     JOIN public.misc m ON ((((m.id)::text = (c.id)::text) AND ((m.lifecyclestate)::text <> 'deleted'::text))))
     JOIN public.hierarchy h1 ON (((c.id)::text = (h1.id)::text)))
     LEFT JOIN (((public.collectionobjects_pahma_pahmafieldcollectionplacelist pl
     JOIN public.places_common pc ON (((pc.refname)::text = (pl.item)::text)))
     JOIN public.hierarchy h2 ON (((h2.id)::text = (pc.id)::text)))
     JOIN utils.placename_hierarchy pn ON ((((h2.primarytype)::text = 'Placeitem'::text) AND (pn.placecsid = (h2.name)::text)))) ON (((pl.pos = 0) AND ((c.id)::text = (pl.id)::text))));


ALTER TABLE utils.object_place_view OWNER TO nuxeo_pahma;

