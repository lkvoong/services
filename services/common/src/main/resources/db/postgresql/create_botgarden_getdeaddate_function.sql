/* Gets the latest action date for a specific:
     1) accession: collectionobjects_common.objectnumber
     2) action: movements_common.reasonformove
     3) bed location: getdispl(movments_common.currentlocation)

   Used in the All Accessions Ever (ucbgAccessionsByBedDate.jrxml) report.

   Usage:
     select get_actiondate('98.0890', 'Planted Out', '3A, Vernal Pool, Californian');
*/

CREATE OR REPLACE FUNCTION public.get_deaddate(cocid character varying, bedloc character varying)
 RETURNS timestamp without time zone
 LANGUAGE plpgsql
 IMMUTABLE STRICT
AS $function$
declare
        recCount int;
        deadDate  timestamp;

begin

        select into recCount count(distinct(mc.locationdate))
        from movements_common mc
        join movements_botgarden mb on (mc.id = mb.id)
        join hierarchy hmc on (mc.id = hmc.id)
        join relations_common rc on (hmc.name = rc.subjectcsid and rc.objectdocumenttype = 'CollectionObject')
        join hierarchy hcoc on (rc.objectcsid = hcoc.name)
        join collectionobjects_common coc on (hcoc.id = coc.id)
        where coc.objectnumber = $1
        and getdispl(mc.reasonformove) = 'Dead'
        and getdispl(mb.previouslocation) = $2;

        if recCount = 0 then return null;

        elseif recCount = 1 then
                select into deadDate distinct mc.locationdate
                from movements_common mc
                join movements_botgarden mb on (mc.id = mb.id)
                join hierarchy hmc on (mc.id = hmc.id)
                join relations_common rc on (hmc.name = rc.subjectcsid and rc.objectdocumenttype = 'CollectionObject')
                join hierarchy hcoc on (rc.objectcsid = hcoc.name)
                join collectionobjects_common coc on (hcoc.id = coc.id)
                where coc.objectnumber = $1
                and getdispl(mc.reasonformove) = 'Dead'
                and getdispl(mb.previouslocation) = $2;

                return deadDate;

        elseif recCount > 1 then
                select into deadDate max(distinct(mc.locationdate))
                from movements_common mc
                join movements_botgarden mb on (mc.id = mb.id)
                join hierarchy hmc on (mc.id = hmc.id)
                join relations_common rc on (hmc.name = rc.subjectcsid and rc.objectdocumenttype = 'CollectionObject')
                join hierarchy hcoc on (rc.objectcsid = hcoc.name)
                join collectionobjects_common coc on (hcoc.id = coc.id)
                where coc.objectnumber = $1
                and getdispl(mc.reasonformove) = 'Dead'
                and getdispl(mb.previouslocation) = $2;

                return deadDate;
        end if;

        return null;

end;

$function$

-- GRANT EXECUTE ON FUNCTION get_actiondate(varchar, varchar, varchar) TO PUBLIC;
