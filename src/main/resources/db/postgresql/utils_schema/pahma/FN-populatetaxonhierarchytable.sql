-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: populatetaxonhierarchytable(); Type: FUNCTION; Schema: utils; Owner: nuxeo_pahma
-- Maintained by PAHMA Hierarchies scripts:
-- https://github.com/cspace-deployment/Tools/tree/master/scripts/pahma/hierarchies
--

CREATE FUNCTION utils.populatetaxonhierarchytable() RETURNS void
    LANGUAGE sql
    AS $_$
  TRUNCATE TABLE utils.taxon_hierarchy;

  WITH taxon_hierarchyquery as (
   SELECT
      h.name taxoncsid,
      regexp_replace(tc.refname, '^.*\)''(.*)''$', '\1') taxon,
      rc.objectcsid broadertaxoncsid,
      regexp_replace(tc2.refname, '^.*\)''(.*)''$', '\1') broadertaxon
    FROM public.taxon_common tc
      INNER JOIN misc m ON (tc.id=m.id AND m.lifecyclestate<>'deleted')
      LEFT OUTER JOIN hierarchy h ON (tc.id = h.id AND h.primarytype='Taxon')
      LEFT OUTER JOIN public.relations_common rc ON (h.name = rc.subjectcsid)
      LEFT OUTER JOIN hierarchy h2 ON (h2.primarytype = 'Taxon'
                            AND rc.objectcsid = h2.name)
      LEFT OUTER JOIN taxon_common tc2 ON (tc2.id = h2.id)
    )
  INSERT INTO utils.taxon_hierarchy
  SELECT DISTINCT
    taxoncsid, taxon,
    broadertaxoncsid as parentid,
    broadertaxoncsid as nextcsid,
    taxon AS taxon_hierarchy,
    taxoncsid AS csid_hierarchy
  FROM  taxon_hierarchyquery;
$_$;


ALTER FUNCTION utils.populatetaxonhierarchytable() OWNER TO nuxeo_pahma;

