-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: refreshmaterialhierarchytable(); Type: FUNCTION; Schema: utils; Owner: nuxeo_pahma
-- Maintained by PAHMA Hierarchies scripts:
-- https://github.com/cspace-deployment/Tools/tree/master/scripts/pahma/hierarchies
--

CREATE FUNCTION utils.refreshmaterialhierarchytable() RETURNS void
    LANGUAGE sql
    AS $$
   insert into utils.refresh_log (msg) values ( 'Creating material_hierarchy table' );
   select utils.createMaterialHierarchyTable();

   insert into utils.refresh_log (msg) values ( 'Populating material_hierarchy table' );
   select utils.populateMaterialHierarchyTable();

   insert into utils.refresh_log (msg) values ( 'Updating material_hierarchy table' );
   select utils.updateMaterialHierarchyTable();

   insert into utils.refresh_log (msg) values ( 'All done' );
$$;


ALTER FUNCTION utils.refreshmaterialhierarchytable() OWNER TO nuxeo_pahma;

