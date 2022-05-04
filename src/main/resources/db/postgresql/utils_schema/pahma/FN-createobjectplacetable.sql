-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: createobjectplacetable(); Type: FUNCTION; Schema: utils; Owner: nuxeo_pahma
-- Maintained by PAHMA Hierarchies scripts: 
-- https://github.com/cspace-deployment/Tools/tree/master/scripts/pahma/hierarchies
-- 


CREATE FUNCTION utils.createobjectplacetable() RETURNS void
    LANGUAGE sql
    AS $$
  DROP TABLE IF EXISTS utils.object_place_temp;
  SELECT DISTINCT *  INTO utils.object_place_temp FROM (
        SELECT c.id, h1.name collectionobjectcsid, c.numberofobjects numberofobjects, c.objectnumber objectnumber, pn.placecsid placecsid
        FROM collectionobjects_common c
        JOIN misc m ON (m.id=c.id AND m.lifecyclestate<>'deleted')
        JOIN hierarchy h1 ON (c.id=h1.id)
        LEFT OUTER JOIN collectionobjects_pahma_pahmafieldcollectionplacelist pl ON (pl.pos=0 AND c.id=pl.id)
        LEFT OUTER JOIN places_common pc ON (pc.refname = pl.item)
        LEFT OUTER JOIN hierarchy h2 ON (h2.id=pc.id)
        LEFT OUTER JOIN utils.placename_hierarchy pn ON (h2.primarytype='PlaceitemTenant15' AND pn.placecsid=h2.name)
  ) AS object_place_subquery;
  CREATE INDEX opt_placecsid_ndx ON utils.object_place_temp(placecsid);
$$;


ALTER FUNCTION utils.createobjectplacetable() OWNER TO nuxeo_pahma;

