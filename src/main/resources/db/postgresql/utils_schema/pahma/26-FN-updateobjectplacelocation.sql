-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: updateobjectplacelocation(); Type: FUNCTION; Schema: utils; Owner: nuxeo_pahma
--

CREATE FUNCTION utils.updateobjectplacelocation() RETURNS void
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
BEGIN
  RAISE NOTICE 'Creating/Updating utils.current_location_temp';
  PERFORM utils.createCurrentLocationTable();

  RAISE NOTICE 'Populating utils.placename_hierarchy';
  PERFORM utils.populatePlacenameHierarchy();

  RAISE NOTICE 'Building hierarchies in utils.placename_hierarchy';
  PERFORM utils.updatePlacenameHierarchyTable();

  RAISE NOTICE 'Creating/updating utils.object_place_temp';
  PERFORM utils.createObjectPlaceTable();

  RAISE NOTICE 'Creating utils.object_place_location';
  PERFORM utils.createObjectPlaceLocation();
END;
$$;


ALTER FUNCTION utils.updateobjectplacelocation() OWNER TO nuxeo_pahma;

