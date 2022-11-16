-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: createobjectplacelocationtable(); Type: FUNCTION; Schema: utils; Owner: nuxeo_pahma
-- Maintained by PAHMA Hierarchies scripts: 
-- https://github.com/cspace-deployment/Tools/tree/master/scripts/pahma/hierarchies
-- 


CREATE FUNCTION utils.createobjectplacelocationtable() RETURNS void
    LANGUAGE sql
    AS $$
DROP TABLE IF EXISTS utils.object_place_location CASCADE;
CREATE TABLE utils.object_place_location AS
  SELECT
      o.id,
      l.collectionobjectcsid,
      o.objectnumber,
      o.numberofobjects,
      o.placecsid,
      p.placename,
      p.csid_hierarchy AS place_csid_hierarchy,
      l.storagelocation,
      l.crate
    FROM utils.object_place_temp o
      LEFT OUTER JOIN  utils.placename_hierarchy p
        ON (o.placecsid = p.placecsid)
      LEFT OUTER JOIN  utils.current_location_temp l
        ON (o.id = l.collectionobjectcsid);

  CREATE INDEX opn_id_ndx
  ON utils.object_place_location (id);
  CREATE INDEX opn_objnumber_ndx
  ON utils.object_place_location (objectnumber);
  CREATE INDEX opn_placename_ndx
  ON utils.object_place_location (placename);
  CREATE INDEX opn_csidhier_ndx
  ON utils.object_place_location (place_csid_hierarchy);
  CREATE INDEX opn_objcsid_ndx
  ON utils.object_place_location (collectionobjectcsid);
  CREATE INDEX opn_location_ndx
  ON utils.object_place_location (storagelocation);
$$;


ALTER FUNCTION utils.createobjectplacelocationtable() OWNER TO nuxeo_pahma;

