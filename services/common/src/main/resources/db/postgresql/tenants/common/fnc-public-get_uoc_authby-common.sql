-- Used by bampfa, botgarden, cinefiles, pahma, ucjeps.

CREATE OR REPLACE FUNCTION public.get_uoc_authby(character varying, 
                                                 character varying DEFAULT '%'::character varying, 
                                                 character varying DEFAULT '%'::character varying)
  RETURNS character varying
  LANGUAGE plpgsql
  IMMUTABLE STRICT
AS $function$

DECLARE authstr VARCHAR(4000);

BEGIN

  select '&nbsp;&nbsp;&nbsp;&nbsp;' || string_agg(
    case
      when ag.authorizationdate is null then ''
      else to_char(ag.authorizationdate::timestamp at time zone 'US/Pacific' at time zone 'UTC', 'yyyy-mm-dd') || ': '
    end || 
    case 
      when ag.authorizationstatus is null then '' 
      else '<b>' || getdispl(ag.authorizationstatus) || '</b>: ' 
    end || 
    getdispl(ag.authorizedby), 
    '<br>&nbsp;&nbsp;&nbsp;&nbsp;' order by ag.authorizationdate)
  into authstr
  from uoc_common uc
  join hierarchy hag on (uc.id = hag.parentid and hag.name = 'uoc_common:authorizationGroupList')
  join authorizationgroup ag on (hag.id = ag.id)
  where uc.id = $1
  and coalesce(ag.authorizedby, '') like $2
  and coalesce(ag.authorizationstatus, '') like $3
  group by uc.id;

  RETURN authstr;

END;

$function$;
