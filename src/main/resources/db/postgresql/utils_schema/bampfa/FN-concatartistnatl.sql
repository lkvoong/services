-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: concatartistnatl(character varying); Type: FUNCTION; Schema: utils; Owner: nuxeo_bampfa
--

CREATE FUNCTION utils.concatartistnatl(id character varying) RETURNS character varying
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
 
 DECLARE artistnatlstr VARCHAR;
 
 BEGIN
 
 select array_to_string(
     array_agg(
         case when b.bampfaobjectproductionpersonqualifier is null or b.bampfaobjectproductionpersonqualifier = ''
             then ''
             else utils.getdispl(b.bampfaobjectproductionpersonqualifier) || ' '
         end ||
         utils.getdispl(b.bampfaobjectproductionperson) ||
         case when pcn.item is null or pcn.item = ''
             then ''
             else ' (' || utils.getdispl(pcn.item) || ')'
         end
     order by hb.pos),
     '; ')
 into artistnatlstr
 from collectionobjects_common coc
 left outer join hierarchy hb on (
     coc.id = hb.parentid
     and hb.name = 'collectionobjects_bampfa:bampfaObjectProductionPersonGroupList')
 left outer join bampfaobjectproductionpersongroup b on (hb.id = b.id)
 left outer join persons_common pc on (b.bampfaobjectproductionperson = pc.refname)
 left outer join persons_common_nationalities pcn on (pc.id = pcn.id and pcn.pos = 0)
 where coc.id = $1
 and b.bampfaobjectproductionperson is not null
 and b.bampfaobjectproductionperson != ''
 group by coc.id
 ;
 
 RETURN artistnatlstr;
 
 END;
 
 $_$;


ALTER FUNCTION utils.concatartistnatl(id character varying) OWNER TO nuxeo_bampfa;

