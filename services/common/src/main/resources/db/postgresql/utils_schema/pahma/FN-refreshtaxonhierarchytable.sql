-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: refreshtaxonhierarchytable(); Type: FUNCTION; Schema: utils; Owner: nuxeo_pahma
-- Maintained by PAHMA Hierarchies scripts:
-- https://github.com/cspace-deployment/Tools/tree/master/scripts/pahma/hierarchies
--

CREATE FUNCTION utils.refreshtaxonhierarchytable() RETURNS void
    LANGUAGE sql
    AS $$
   insert into utils.refresh_log (msg) values ( 'Creating taxon_hierarchy table' );
   select utils.createTaxonHierarchyTable();

   insert into utils.refresh_log (msg) values ( 'Populating taxon_hierarchy table' );
   select utils.populateTaxonHierarchyTable();

   insert into utils.refresh_log (msg) values ( 'Updating taxon_hierarchy table' );
   select utils.updateTaxonHierarchyTable();

   insert into utils.refresh_log (msg) values ( 'All done' );
$$;


ALTER FUNCTION utils.refreshtaxonhierarchytable() OWNER TO nuxeo_pahma;

