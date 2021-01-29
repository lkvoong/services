/*
-- findconservecat.sql
-- return concatenated string of conservation categories, taking taxon refname as input
-- used in Bot Garden portal
-- CRH 1/18/2015
*/

CREATE OR REPLACE FUNCTION utils.findconservecat(text)
 RETURNS text
 LANGUAGE plpgsql
 IMMUTABLE STRICT
AS $function$
declare
   conservecat text;
   r text;

begin

conservecat := '';

FOR r IN
select
   regexp_replace(pag.conservationcategory, '^.*\)''(.*)''$', '\1') as conservecat
from taxon_common tc
left outer join hierarchy h
     on (tc.id = h.parentid and h.name = 'taxon_naturalhistory:plantAttributesGroupList')
left outer join plantattributesgroup pag on (pag.id=h.id)
where pag.conservationcategory is not null and pag.conservationcategory not like '%none%'
     and tc.refname = $1
order by h.pos

LOOP

conservecat := conservecat || r || '|';

END LOOP;

if conservecat = '|' then conservecat = null;
end if;

conservecat := trim(trailing '|' from conservecat);

return conservecat;
end;
$function$

-- GRANT EXECUTE ON FUNCTION utils.findconservecat(text) TO PUBLIC;
