-- Used by bampfa, botgarden, cinefiles, pahma, ucjeps.

CREATE OR REPLACE FUNCTION public.getdispl(text)
  RETURNS text
  LANGUAGE sql
  IMMUTABLE STRICT
AS $function$
  SELECT regexp_replace($1, '^.*\)''(.+)''$', '\1')
$function$;
