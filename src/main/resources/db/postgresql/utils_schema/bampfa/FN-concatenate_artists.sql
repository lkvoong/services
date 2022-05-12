-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: concatenate_artists(character varying); Type: FUNCTION; Schema: utils; Owner: nuxeo_bampfa
--

CREATE FUNCTION utils.concatenate_artists(csid character varying) RETURNS character varying
    LANGUAGE plpgsql IMMUTABLE STRICT SECURITY DEFINER
    AS $_$

DECLARE artiststring VARCHAR(300);

BEGIN

select array_to_string(
    array_agg(
        utils.getdispl(b.bampfaobjectproductionperson) ||
        case when b.bampfaobjectproductionpersonqualifier is not null
            and b.bampfaobjectproductionpersonqualifier != ''
            then ' (' || utils.getdispl(b.bampfaobjectproductionpersonqualifier) || ')'
            else ''
        end
        order by hb.pos),
        '; ')
    into artiststring
from collectionobjects_common coc
inner join hierarchy hcoc on (
    coc.id = hcoc.id)
inner join hierarchy hb on (
    coc.id = hb.parentid
    and hb.name = 'collectionobjects_bampfa:bampfaObjectProductionPersonGroupList')
inner join bampfaobjectproductionpersongroup b on (
    hb.id = b.id)
where hcoc.name = $1
and b.bampfaobjectproductionperson is not null
and b.bampfaobjectproductionperson != ''
group by hcoc.name
;

RETURN artiststring;

END;

$_$;


ALTER FUNCTION utils.concatenate_artists(csid character varying) OWNER TO nuxeo_bampfa;

