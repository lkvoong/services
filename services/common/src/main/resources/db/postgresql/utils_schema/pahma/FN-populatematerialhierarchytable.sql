-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: populatematerialhierarchytable(); Type: FUNCTION; Schema: utils; Owner: nuxeo_pahma
-- Maintained by PAHMA Hierarchies scripts:
-- https://github.com/cspace-deployment/Tools/tree/master/scripts/pahma/hierarchies
--

CREATE FUNCTION utils.populatematerialhierarchytable() RETURNS void
    LANGUAGE sql
    AS $_$
  TRUNCATE TABLE utils.material_hierarchy;

  WITH material_hierarchyquery AS (
   SELECT
      h.name materialcsid,
      regexp_replace(cnc.refname, '^.*\)''(.*)''$', '\1') material,
      rc.objectcsid broadermaterialcsid,
      regexp_replace(cnc2.refname, '^.*\)''(.*)''$', '\1') broadermaterial
    FROM public.concepts_common cnc
      INNER JOIN misc m ON (cnc.id=m.id AND m.lifecyclestate<>'deleted')
      LEFT OUTER JOIN hierarchy h ON (cnc.id = h.id AND h.primarytype='Conceptitem')
      LEFT OUTER JOIN public.relations_common rc ON (h.name = rc.subjectcsid)
      LEFT OUTER JOIN hierarchy h2 ON (h2.primarytype = 'Conceptitem'
                            AND rc.objectcsid = h2.name)
      LEFT OUTER JOIN concepts_common cnc2 ON (cnc2.id = h2.id)
      WHERE cnc.refname LIKE 'urn:cspace:pahma.cspace.berkeley.edu:conceptauthorities:name(material_ca)%'
    )
  INSERT INTO utils.material_hierarchy
  SELECT DISTINCT
    materialcsid,
    material,
    broadermaterialcsid AS parentcsid,
    broadermaterialcsid AS nextcsid,
    material AS material_hierarchy,
    materialcsid AS csid_hierarchy
  FROM  material_hierarchyquery;
$_$;


ALTER FUNCTION utils.populatematerialhierarchytable() OWNER TO nuxeo_pahma;

