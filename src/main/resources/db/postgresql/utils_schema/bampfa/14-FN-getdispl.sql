-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: getdispl(text); Type: FUNCTION; Schema: utils; Owner: nuxeo_bampfa
--

CREATE FUNCTION utils.getdispl(text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    SET search_path TO 'public'
    AS $_$
SELECT regexp_replace($1, '^.*\)''(.*)''$', '\1')
$_$;


ALTER FUNCTION utils.getdispl(text) OWNER TO nuxeo_bampfa;

