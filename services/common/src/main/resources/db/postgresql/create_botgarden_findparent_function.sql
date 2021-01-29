CREATE OR REPLACE FUNCTION public.findparent(tcid character varying)
 RETURNS character varying
 LANGUAGE plpgsql
 IMMUTABLE STRICT
AS $function$
declare parent_name varchar(200);
begin
WITH RECURSIVE taxon_hierarchyquery as (
SELECT
    tc.id tcid,
    h.name taxoncsid,
    getdispl(tc.refname) taxon,
    tc.taxonrank taxonrank,
    rc.objectcsid broadertaxoncsid,
    getdispl(tc2.refname) broadertaxon,
    tc2.taxonrank broadertaxonrank,
    0 AS level
FROM taxon_common tc
JOIN hierarchy h ON (tc.id = h.id AND h.primarytype='TaxonTenant35')
LEFT OUTER JOIN relations_common rc ON (h.name = rc.subjectcsid)
LEFT OUTER JOIN hierarchy h2 ON (h2.primarytype = 'TaxonTenant35'
AND rc.relationshiptype='hasBroader' AND rc.objectcsid = h2.name)
LEFT OUTER JOIN taxon_common tc2 ON (tc2.id = h2.id)
WHERE tc.refname LIKE '%(taxon)%'
AND tc.id = $1
UNION ALL
SELECT
    tc.id tcid,
    h.name taxoncsid,
    getdispl(tc.refname) taxon,
    tc.taxonrank taxonrank,
    rc.objectcsid broadertaxoncsid,
    getdispl(tc2.refname) broadertaxon,
    tc2.taxonrank broadertaxonrank,
    th.level - 1 AS level
FROM taxon_common tc
JOIN hierarchy h ON (tc.id = h.id AND h.primarytype='TaxonTenant35')
LEFT OUTER JOIN relations_common rc ON (h.name = rc.subjectcsid)
LEFT OUTER JOIN hierarchy h2 ON (h2.primarytype = 'TaxonTenant35'
    AND rc.relationshiptype='hasBroader' AND rc.objectcsid = h2.name)
LEFT OUTER JOIN taxon_common tc2 ON (tc2.id = h2.id)
INNER JOIN taxon_hierarchyquery AS th
ON h.name = th.broadertaxoncsid
)
SELECT taxon into parent_name from taxon_hierarchyquery
where level = -1;

return parent_name;

end;

$function$

-- GRANT EXECUTE ON FUNCTION public.findparent(tcid character varying) to PUBLIC;
