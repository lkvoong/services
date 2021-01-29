CREATE OR REPLACE FUNCTION public.get_uoc_objnum(character varying)
 RETURNS character varying
 LANGUAGE plpgsql
 IMMUTABLE STRICT
AS $function$

DECLARE objnumstr VARCHAR(4000);

BEGIN

select string_agg(coc.objectnumber, '; ' order by coc.objectnumber)
into objnumstr
from uoc_common uc
join hierarchy huc on (uc.id = huc.id)
join relations_common rc on (huc.name = rc.subjectcsid and rc.subjectdocumenttype = 'Uoc')
join hierarchy hcoc on (rc.objectcsid = hcoc.name and rc.objectdocumenttype = 'CollectionObject')
join collectionobjects_common coc on (hcoc.id = coc.id)
where uc.id = $1
and coc.objectnumber is not null
and coc.objectnumber != ''
group by uc.id;

RETURN objnumstr;

END;

$function$

-- GRANT EXECUTE ON FUNCTION public.get_uoc_objnum(character varying) to PUBLIC;
