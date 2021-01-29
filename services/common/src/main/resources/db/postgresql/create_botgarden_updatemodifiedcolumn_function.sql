CREATE OR REPLACE FUNCTION public.update_modified_column()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$BEGIN NEW.modified = now(); RETURN NEW; END;$function$

-- GRANT EXECUTE ON FUNCTION public.update_modified_column() TO PUBLIC;
