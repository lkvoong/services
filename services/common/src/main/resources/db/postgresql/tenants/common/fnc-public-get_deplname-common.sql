-- Will no longer be needed after migration to LYRASIS hosting.

CREATE OR REPLACE FUNCTION public.get_deplname()
  RETURNS character varying
  LANGUAGE plpgsql
  IMMUTABLE STRICT
AS $function$

DECLARE namestr VARCHAR(4000);

BEGIN

  select regexp_replace(current_database(), '[_].*$', '') ||
    case
      when inet_server_port() in (5117, 5119, 5114) then '-dev'
      when inet_server_port() in (5107, 5110, 5113) then '-qa'
      else ''
    end
  into namestr;

  RETURN namestr;

END;

$function$;
