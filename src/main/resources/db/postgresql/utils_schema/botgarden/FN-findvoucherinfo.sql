-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: findvoucherinfo(text); Type: FUNCTION; Schema: utils; Owner: nuxeo_botgarden
--

CREATE FUNCTION utils.findvoucherinfo(text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$

select
  array_to_string(array_agg(concat_ws(', ', regexp_replace(lc.borrower, '^.*\)''(.*)''$', '\1'), to_char(lc.loanoutdate, 'YYYY-MM-DD'))), '|') as voucherinfo
from relations_common rv 
join hierarchy hv on (rv.objectcsid=hv.name and rv.subjectcsid = $1 and rv.objectdocumenttype='Loanout')
join loansout_common lc on (lc.id=hv.id)
join misc mv on (lc.id=mv.id and mv.lifecyclestate <> 'deleted');

$_$;


ALTER FUNCTION utils.findvoucherinfo(text) OWNER TO nuxeo_botgarden;

