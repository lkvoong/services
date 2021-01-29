CREATE OR REPLACE FUNCTION public.findcommonname(character varying)
 RETURNS character varying
 LANGUAGE sql
 IMMUTABLE STRICT
AS $function$
         SELECT regexp_replace(cng.naturalhistorycommonname, '^.*\)''(.*)''$', '\1') commonname
         FROM taxon_common tc
              LEFT OUTER JOIN hierarchy h
                 ON (tc.id = h.parentid
                     AND h.pos = 0
                     AND h.name = 'taxon_naturalhistory:naturalHistoryCommonNameGroupList')
              LEFT OUTER JOIN naturalhistorycommonnamegroup cng
                 ON (cng.id = h.id)
         WHERE tc.refname=$1
      $function$

-- GRANT EXECUTE ON FUNCTION public.findcommonname(character varying) TO PUBLIC;
