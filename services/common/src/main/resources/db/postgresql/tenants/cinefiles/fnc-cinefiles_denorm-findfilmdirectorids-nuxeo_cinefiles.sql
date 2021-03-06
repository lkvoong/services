CREATE OR REPLACE FUNCTION cinefiles_denorm.findfilmdirectorids(text)
 RETURNS text
 LANGUAGE plpgsql
 IMMUTABLE STRICT
AS $function$
declare
   directoridstring text;
   r text;

begin

directoridstring := '|';

FOR r IN
SELECT cinefiles_denorm.getshortid(cg.creator) filmDirector
FROM hierarchy h1
INNER JOIN works_common wc
   ON ( h1.id = wc.id AND h1.primarytype = 'WorkitemTenant50' )
LEFT OUTER JOIN hierarchy h2
   ON ( h2.parentid = h1.id AND h2.primarytype = 'creatorGroup')
LEFT OUTER JOIN creatorgroup cg
   ON (h2.id = cg.id)
WHERE wc.shortidentifier = $1
ORDER BY h2.pos

LOOP

directoridstring := directoridstring || r || '|';

END LOOP;

if directoridstring = '|' then directoridstring = null;
end if;

-- directorstring := trim(trailing '|' from directorstring);

return directoridstring;
end;
$function$
