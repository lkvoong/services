-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: createculturehierarchytable(); Type: FUNCTION; Schema: utils; Owner: nuxeo_pahma
-- Maintained by PAHMA Hierarchies scripts: 
-- https://github.com/cspace-deployment/Tools/tree/master/scripts/pahma/hierarchies
-- 

CREATE FUNCTION utils.createculturehierarchytable() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  IF NOT EXISTS ( SELECT relname
                  FROM pg_catalog.pg_class c
                       JOIN
                       pg_catalog.pg_namespace n
                       ON (n.oid = c.relnamespace)
               WHERE c.relname = 'culture_hierarchy'
                 AND n.nspname = 'utils' )
  THEN
    CREATE TABLE utils.culture_hierarchy (
       culturecsid text,
       culture     text,
       parentcsid  text,
       nextcsid    text,
       culture_hierarchy text,
       csid_hierarchy text );

    CREATE INDEX uch_ccsid_ndx on utils.culture_hierarchy ( culturecsid );
    CREATE INDEX uch_cname_ndx on utils.culture_hierarchy ( culture );
  END IF;
END;
$$;


ALTER FUNCTION utils.createculturehierarchytable() OWNER TO nuxeo_pahma;

