CREATE OR REPLACE FUNCTION public.get_deplname()
 RETURNS character varying
 LANGUAGE plpgsql
 IMMUTABLE STRICT
AS $function$

DECLARE namestr VARCHAR(20);

BEGIN

SELECT 
  REGEXP_REPLACE(current_database(), '[_].*$', '') || 
  CASE WHEN REGEXP_REPLACE(name, '^.*-(qa|prod)-.*$', '\1') = 'qa' THEN '.qa' ELSE '' END
INTO namestr
FROM utils.servername;

RETURN namestr;

END;

$function$
