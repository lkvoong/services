-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: refreshculturehierarchytable(); Type: FUNCTION; Schema: utils; Owner: nuxeo_pahma
-- Maintained by PAHMA Hierarchies scripts: 
-- https://github.com/cspace-deployment/Tools/tree/master/scripts/pahma/hierarchies
-- 

CREATE FUNCTION utils.refreshculturehierarchytable() RETURNS void
    LANGUAGE sql
    AS $$
   insert into utils.refresh_log (msg) values ( 'Creating culture_hierarchy table' );
   select utils.createCultureHierarchyTable();

   insert into utils.refresh_log (msg) values ( 'Populating culture_hierarchy table' );
   select utils.populateCultureHierarchyTable();

   insert into utils.refresh_log (msg) values ( 'Updating culture_hierarchy table' );
   select utils.updateCultureHierarchyTable();

   insert into utils.refresh_log (msg) values ( 'All done' );
$$;


ALTER FUNCTION utils.refreshculturehierarchytable() OWNER TO nuxeo_pahma;

