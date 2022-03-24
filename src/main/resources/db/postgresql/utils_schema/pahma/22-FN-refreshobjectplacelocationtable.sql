-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: refreshobjectplacelocationtable(); Type: FUNCTION; Schema: utils; Owner: nuxeo_pahma
--

CREATE FUNCTION utils.refreshobjectplacelocationtable() RETURNS void
    LANGUAGE sql
    AS $$
   insert into utils.refresh_log (msg) values ( 'Creating current_location_temp table' );
   select utils.createcurrentlocationtable();

   insert into utils.refresh_log (msg) values ( 'Populating placename_hierarchy table' );
   select utils.populatePlacenameHierarchyTable();

   insert into utils.refresh_log (msg) values ( 'Updating placename_hierarchy table' );
   select utils.updatePlacenameHierarchyTable();

   insert into utils.refresh_log (msg) values ( 'Creating object_place_temp table' );
   select utils.createObjectPlaceTable();

   insert into utils.refresh_log (msg) values ( 'Creating object_place_location table' );
   select utils.createObjectPlaceLocationTable();

   insert into utils.refresh_log (msg) values ( 'All done' );
$$;


ALTER FUNCTION utils.refreshobjectplacelocationtable() OWNER TO nuxeo_pahma;

