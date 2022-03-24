-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: creatematerialhierarchytable(); Type: FUNCTION; Schema: utils; Owner: nuxeo_pahma
--

CREATE FUNCTION utils.creatematerialhierarchytable() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  IF NOT EXISTS ( SELECT relname
                  FROM pg_catalog.pg_class c
                       JOIN
                       pg_catalog.pg_namespace n
                       ON (n.oid = c.relnamespace)
               WHERE c.relname = 'material_hierarchy'
                 AND n.nspname = 'utils' )
  THEN
    CREATE TABLE utils.material_hierarchy (
       materialcsid text,
       material     text,
       parentcsid   text,
       nextcsid     text,
       material_hierarchy text,
       csid_hierarchy     text );

    CREATE INDEX umh_mcsid_ndx on utils.material_hierarchy ( materialcsid );
    CREATE INDEX umh_mname_ndx on utils.material_hierarchy ( material );
  END IF;
END;
$$;


ALTER FUNCTION utils.creatematerialhierarchytable() OWNER TO nuxeo_pahma;

