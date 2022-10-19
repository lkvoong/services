-- Used by bampfa, botgarden, cinefiles, pahma, ucjeps.

CREATE OR REPLACE FUNCTION public.get_uoc_reqby(character varying)
  RETURNS character varying
  LANGUAGE plpgsql
  IMMUTABLE STRICT
AS $function$

DECLARE reqstr VARCHAR(4000);

BEGIN

  select string_agg(
    case when ug.userInstitutionRole is null then '' else getdispl(ug.userInstitutionRole) || ': ' end ||
    getdispl(ug.user), 
    '<br>' order by hug.pos)
  into reqstr
  from uoc_common uc
  join hierarchy hug on ( uc.id = hug.parentid and hug.name = 'uoc_common:userGroupList')
  join usergroup ug on (hug.id = ug.id)
  where uc.id = $1
  and ug.user is not null
  group by uc.id;

  RETURN reqstr;

END;

$function$;
