-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: aggrepfield(character varying, character varying, character varying); Type: FUNCTION; Schema: utils; Owner: nuxeo_pahma
--

CREATE FUNCTION utils.aggrepfield(coid character varying, tname character varying, sepval character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
DECLARE
    aggstr VARCHAr;
BEGIN
    EXECUTE 'SELECT STRING_AGG(CASE WHEN item IS NULL THEN ''%NULLVALUE%'''
        || ' ELSE regexp_replace(item, E''[\\n\\r]+'', ''\n'', ''g'') END, ''' || sepval || ''' ORDER BY pos)'
        || ' FROM ' || tname 
        || ' WHERE id = $1'
        || ' GROUP BY id'
        INTO aggstr
        USING coid;

    RETURN aggstr;
END;
$_$;


ALTER FUNCTION utils.aggrepfield(coid character varying, tname character varying, sepval character varying) OWNER TO nuxeo_pahma;

