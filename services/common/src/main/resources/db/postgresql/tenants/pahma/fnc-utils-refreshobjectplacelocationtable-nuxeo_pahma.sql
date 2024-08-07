CREATE OR REPLACE FUNCTION utils.refreshobjectplacelocationtable()
 RETURNS void
 LANGUAGE sql
AS $function$
   insert into utils.refresh_log (msg) values ( 'Creating current_location_temp table' );
   select utils.createcurrentlocationtable();

   insert into utils.refresh_log (msg) values ( 'Populating placename_hierarchy table' );
   select utils.populatePlacenameHierarchyTable();

   insert into utils.refresh_log (msg) values ( 'Updating placename_hierarchy table' );
   select utils.updatePlacenameHierarchyTable();

   insert into utils.refresh_log (msg) values ( 'Creating object_place_temp table' );
   select utils.createObjectPlaceTable();

   insert into utils.refresh_log (msg) values ( 'Creating object_place_location table' );
   select utils.createObjectPlaceLocationTable();

   insert into utils.refresh_log (msg) values ( 'All done' );
$function$
