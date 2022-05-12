-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: get_first_blobcsid(character varying); Type: FUNCTION; Schema: utils; Owner: nuxeo_bampfa
--

CREATE FUNCTION utils.get_first_blobcsid(title character varying) RETURNS character varying
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$

DECLARE blobcsid VARCHAR(50);

BEGIN

select
   mc.blobcsid into blobcsid
from collectionobjects_common co
   JOIN hierarchy hrel on (co.id = hrel.id)
   JOIN relations_common rimg on (hrel.name = rimg.objectcsid and rimg.subjectdocumenttype='Media')
   JOIN hierarchy hmc on (rimg.subjectcsid = hmc.name)
   JOIN media_common mc on (mc.id=hmc.id)
   JOIN misc m on (mc.id=m.id and m.lifecyclestate<>'deleted')
   JOIN media_bampfa mb on (mc.id=mb.id and mb.imagenumber='1' and mb.websitedisplaylevel != 'No public display')
where hrel.name=$1;

RETURN blobcsid;

END;

$_$;


ALTER FUNCTION utils.get_first_blobcsid(title character varying) OWNER TO nuxeo_bampfa;

