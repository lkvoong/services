/* Used by UCB deployments to determine qa|prod server.
-- old servername format: cs-ucb-(qa|prod)-db.lyrtech.org
-- new servername format: cspace-ucb-(qa|production)
*/

CREATE OR REPLACE FUNCTION public.get_deplname()
 RETURNS character varying
 LANGUAGE plpgsql
 IMMUTABLE STRICT
AS $function$

DECLARE namestr VARCHAR(20);

BEGIN

SELECT 
  REGEXP_REPLACE(REGEXP_REPLACE(current_database(), '[_].*$', ''), 'botgarden', 'ucbg') || 
  CASE WHEN REGEXP_REPLACE(name, '^.*-(qa)-?.*$', '\1') = 'qa' THEN '.qa' ELSE '' END
INTO namestr
FROM utils.servername;

RETURN namestr;

END;

$function$
