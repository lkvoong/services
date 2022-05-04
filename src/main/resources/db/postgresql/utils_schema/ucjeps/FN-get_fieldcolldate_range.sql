-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: get_fieldcolldate_range(character varying); Type: FUNCTION; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE FUNCTION utils.get_fieldcolldate_range(cocid character varying) RETURNS character varying
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$

DECLARE
        eyear INTEGER;
        emonth INTEGER;
        eday INTEGER;
        lyear INTEGER;
        lmonth INTEGER;
        lday INTEGER;
        edate VARCHAR(100);
        ldate VARCHAR(100);
        datestring VARCHAR(200);

BEGIN

select
        sdg.dateearliestsingleyear,
        sdg.dateearliestsinglemonth,
        sdg.dateearliestsingleday,
        sdg.datelatestyear,
        sdg.datelatestmonth,
        sdg.datelatestday
into
        eyear,
        emonth,
        eday,
        lyear,
        lmonth,
        lday
from collectionobjects_common coc
left outer join hierarchy hsdg on (
        coc.id = hsdg.parentid and
        name = 'collectionobjects_common:fieldCollectionDateGroup')
left outer join structureddategroup sdg on (hsdg.id = sdg.id)
where coc.id = $1;


if eyear is not null and emonth is not null and eday is not null
        and lyear is not null and lmonth is not null and lday is not null
then
        select
                to_char(make_date(eyear, emonth, eday), 'YYYY/MM/DD'),
                to_char(make_date(lyear, lmonth, lday), 'YYYY/MM/DD')
        into
                edate,
                ldate;
else
        select
                coalesce(eyear::text, '0000') || '/' ||
                        lpad(coalesce(emonth::text, '00'), 2, '0') || '/' ||
                        lpad(coalesce(eday::text, '00'), 2, '0'),
                coalesce(lyear::text, '0000') || '/' ||
                        lpad(coalesce(lmonth::text, '00'), 2, '0') || '/' ||
                        lpad(coalesce(lday::text, '00'), 2, '0')
        into
                edate,
                ldate;

        edate := regexp_replace(regexp_replace(edate, '/00', '', 'g'), '^0000', '');
        ldate := regexp_replace(regexp_replace(ldate, '/00', '', 'g'), '^0000', '');

end if;

datestring := edate || case when ldate is null or ldate = '' then '' else ' - ' || ldate end;

RETURN datestring;

END;

$_$;


ALTER FUNCTION utils.get_fieldcolldate_range(cocid character varying) OWNER TO nuxeo_ucjeps;

