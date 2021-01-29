CREATE OR REPLACE FUNCTION public.findsubsectionparent(character varying)
 RETURNS character varying
 LANGUAGE sql
 IMMUTABLE STRICT
AS $function$
         SELECT
            regexp_replace(tc2.refname, '^.*\)''(.*)''$', '\1') subsectionparent
         FROM
            taxon_common tc1
            JOIN hierarchy h1 ON tc1.id=h1.id
            JOIN relations_common rc1 ON (h1.name=rc1.subjectcsid
                                          AND rc1.relationshiptype='hasBroader'
                                          AND rc1.subjectdocumenttype='Taxon')
            JOIN hierarchy h2 ON h2.name=rc1.objectcsid
            JOIN taxon_common tc2 ON tc2.id=h2.id
         WHERE
            tc2.taxonrank IN ('subsection', 'subsect')
            AND tc1.refname=$1
      $function$

-- GRANT EXECUTE ON FUNCTION public.findsubsectionparent(character varying) TO PUBLIC;
