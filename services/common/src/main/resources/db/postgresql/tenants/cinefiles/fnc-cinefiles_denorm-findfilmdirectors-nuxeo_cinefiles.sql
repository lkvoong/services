CREATE OR REPLACE FUNCTION cinefiles_denorm.findfilmdirectors(text)
 RETURNS text
 LANGUAGE plpgsql
 IMMUTABLE STRICT
AS $function$
declare
   directorstring text;
   r text;

begin

directorstring := '';

FOR r IN
SELECT case when cg.creator like '%orgauthorities%' then 
      cinefiles_denorm.getdispl(cg.creator)
    else 
      rtrim(concat_ws(', ', ptg.surname, (concat_ws(' ', ptg.forename, ptg.middlename, ptg.nameadditions))))
    end as filmDirector
FROM hierarchy h1
INNER JOIN works_common wc
   ON ( h1.id = wc.id AND h1.primarytype = 'WorkitemTenant50' )
LEFT OUTER JOIN hierarchy h2
   ON ( h2.parentid = h1.id AND h2.primarytype = 'creatorGroup')
LEFT OUTER JOIN creatorgroup cg
   ON (h2.id = cg.id)
left outer join persons_common pc on (cg.creator=pc.refname)
left outer join hierarchy h3 on (pc.id=h3.parentid and h3.name='persons_common:personTermGroupList' and h3.pos=0)
left outer join cinefiles_denorm.persontermgroup ptg on (h3.id=ptg.id)
WHERE wc.shortidentifier = $1
ORDER BY h2.pos

LOOP

directorstring := directorstring || r || '|';

END LOOP;

if directorstring = '|' then directorstring = null;
end if;

directorstring := trim(trailing '|' from directorstring);

return directorstring;
end;
$function$
