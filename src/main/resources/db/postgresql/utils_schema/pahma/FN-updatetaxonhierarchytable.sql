-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: updatetaxonhierarchytable(); Type: FUNCTION; Schema: utils; Owner: nuxeo_pahma
-- Maintained by PAHMA Hierarchies scripts:
-- https://github.com/cspace-deployment/Tools/tree/master/scripts/pahma/hierarchies
--

CREATE FUNCTION utils.updatetaxonhierarchytable() RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  ph text;
  ch text;
  nxt utils.taxon_hierarchy.nextcsid%TYPE;
  cnt int;
BEGIN
  ph := '';
  ch := '';
  nxt := 1;
  cnt := 1;

  WHILE cnt < 100 LOOP
    UPDATE utils.taxon_hierarchy p1
      SET nextcsid = NULL,
          csid_hierarchy = p2.csid_hierarchy || '|' || p1.taxoncsid,
          taxon_hierarchy = p2.taxon_hierarchy || '|' || p1.taxon
    FROM utils.taxon_hierarchy p2
    WHERE  p1.nextcsid IS NOT NULL
      AND  p1.nextcsid = p2.taxoncsid
      AND  p2.nextcsid IS NULL;

    IF FOUND THEN
      select into cnt cnt+1;
    ELSE
      EXIT;
    END IF;
  END LOOP;

  RETURN cnt;
END;
$$;


ALTER FUNCTION utils.updatetaxonhierarchytable() OWNER TO nuxeo_pahma;

