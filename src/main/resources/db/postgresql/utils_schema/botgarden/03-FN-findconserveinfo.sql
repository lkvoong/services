-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: findconserveinfo(text); Type: FUNCTION; Schema: utils; Owner: nuxeo_botgarden
--

CREATE FUNCTION utils.findconserveinfo(text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
declare
   conserveinfo text;
   r text;

begin

conserveinfo := '';

FOR r IN
select 
  case when (pag.conservationorganization is not null and pag.conservationorganization not like '%not applicable%')
        then regexp_replace(pag.conservationorganization, '^.*\)''(.*)''$', '\1')||': '||regexp_replace(pag.conservationcategory, '^.*\)''(.*)''$', '\1')
       else regexp_replace(pag.conservationcategory, '^.*\)''(.*)''$', '\1')
  end as conserveinfo
from taxon_common tc
left outer join hierarchy h
     on (tc.id = h.parentid and h.name = 'taxon_naturalhistory:plantAttributesGroupList')
left outer join plantattributesgroup pag on (pag.id=h.id)
where pag.conservationorganization is not null and pag.conservationorganization not like '%not applicable%'
     and tc.refname = $1
order by h.pos

LOOP

conserveinfo := conserveinfo || r || '|';

END LOOP;

if conserveinfo = '|' then conserveinfo = null;
end if;

conserveinfo := trim(trailing '|' from conserveinfo);

return conserveinfo;
end;
$_$;


ALTER FUNCTION utils.findconserveinfo(text) OWNER TO nuxeo_botgarden;

