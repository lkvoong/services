-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: aggrepgroupfield(character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: utils; Owner: nuxeo_pahma
--

CREATE FUNCTION utils.aggrepgroupfield(coid character varying, tname character varying, cname character varying, sepval character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
DECLARE
    ctype VARCHAR;
    cstr VARCHAR;
    aggstr VARCHAR;
BEGIN
    SELECT data_type INTO ctype FROM information_schema.columns WHERE table_name = tname AND column_name = cname;

    IF ctype IN ('text', 'character varying') THEN 
        cstr := cname;
    ELSE
        cstr := cname || '::text';
    END IF;

    EXECUTE 'SELECT STRING_AGG(CASE WHEN n.' || cname || ' IS NULL THEN ''%NULLVALUE%'''
        || ' ELSE regexp_replace(n.' || cstr || ', E''[\\n\\r]+'', ''\n'', ''g'') END, ''' || sepval || ''' ORDER BY h.pos)'
        || ' FROM hierarchy h' 
        || ' JOIN ' || tname || ' n ON (h.id = n.id AND lower(h.primarytype) = $1)' 
        || ' WHERE h.parentid = $2'
        || ' GROUP BY h.parentid'
        INTO aggstr
        USING tname, coid;

    RETURN aggstr;

END;
$_$;


ALTER FUNCTION utils.aggrepgroupfield(coid character varying, tname character varying, cname character varying, sepval character varying) OWNER TO nuxeo_pahma;

