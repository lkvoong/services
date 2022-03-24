-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: darwincore_view; Type: VIEW; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE VIEW utils.darwincore_view AS
 SELECT collectionobjects_common.collection AS collectioncode,
    collectionobjects_common.numberofobjects AS individualcount,
    collectionobjects_common.objectnumber AS catalognumber,
    collectionobjects_common.phase AS lifestage,
    collectionobjects_common.sex,
    collectionobjects_common_forms.item AS preparations,
    ((collectionobjects_naturalhistory.fieldcollectiondateearliest)::text || (collectionobjects_naturalhistory.fieldcollectiondatelatest)::text) AS eventdate,
    collectionobjects_naturalhistory.fieldloccoordinatesystem AS verbatimcoordinatesystem,
    collectionobjects_naturalhistory.fieldloccountry AS country,
    collectionobjects_naturalhistory.fieldlocstate AS stateprovince,
    collectionobjects_naturalhistory.fieldloccounty AS county,
    collectionobjects_naturalhistory.fieldlocgeodeticdatum AS geodeticdatum,
    collectionobjects_naturalhistory.fieldlochighergeography AS highergeography,
    collectionobjects_naturalhistory.fieldloclatdecimal AS decimallatitude,
    collectionobjects_naturalhistory.fieldloclongdecimal AS decimallongitude,
    collectionobjects_naturalhistory.fieldlocverbatim AS verbatimlocality,
    (((((((collectionobjects_naturalhistory.typespecimenkind)::text || ' of '::text) || (taxonomicidentgroup.taxon)::text) || '. '::text) || (collectionobjects_naturalhistory.typespecimenreference)::text) || ':'::text) || (collectionobjects_naturalhistory.typespecimenrefpage)::text) AS typestatus,
    collectionobjects_common_fieldcollectionmethods.item AS samplingprotocol,
    collectionobjects_common.fieldcollectionnote AS habitat,
    collectionobjects_common_fieldcollectors.item AS recordedby,
    othernumber.numbervalue AS othercatalognumbers,
    taxon_common.taxonguid AS taxonid,
    taxon_common.taxonnamesource AS nameaccordingto,
    taxon_common.taxonnamesourcecode AS nameaccordingtoid,
    taxon_common.taxonnote AS taxonremarks,
    taxon_common.taxonomicstatus,
    taxon_common.taxonyear AS namepublishedinyear,
    taxon_common.termstatus AS nomenclaturalstatus,
    taxonauthorgroup.taxonauthor AS scientificnameauthorship,
    taxonomicidentgroup.identby AS identifiedby,
    taxonomicidentgroup.identdate AS dateidentified,
    taxonomicidentgroup.notes AS identificationremarks,
    taxonomicidentgroup.qualifier AS identificationqualifier,
    taxonomicidentgroup.reference AS identificationreferences,
    taxonomicidentgroup.taxon AS scientificname
   FROM (((((((((((public.collectionobjects_common
     LEFT JOIN public.collectionobjects_common_forms ON (((collectionobjects_common.id)::text = (collectionobjects_common_forms.id)::text)))
     LEFT JOIN public.collectionobjects_naturalhistory ON (((collectionobjects_common.id)::text = (collectionobjects_naturalhistory.id)::text)))
     LEFT JOIN public.collectionobjects_common_fieldcollectionmethods ON (((collectionobjects_common.id)::text = (collectionobjects_common_fieldcollectionmethods.id)::text)))
     LEFT JOIN public.collectionobjects_common_fieldcollectors ON (((collectionobjects_common.id)::text = (collectionobjects_common_fieldcollectors.id)::text)))
     LEFT JOIN public.hierarchy h1 ON (((collectionobjects_common.id)::text = (h1.parentid)::text)))
     LEFT JOIN public.othernumber ON (((h1.id)::text = (othernumber.id)::text)))
     LEFT JOIN public.hierarchy h2 ON (((collectionobjects_common.id)::text = (h2.parentid)::text)))
     LEFT JOIN public.taxonomicidentgroup ON (((h2.id)::text = (taxonomicidentgroup.id)::text)))
     LEFT JOIN public.taxon_common ON (((taxonomicidentgroup.taxon)::text = (taxon_common.refname)::text)))
     LEFT JOIN public.hierarchy h3 ON (((taxon_common.id)::text = (h3.parentid)::text)))
     LEFT JOIN public.taxonauthorgroup ON (((h3.id)::text = (taxonauthorgroup.id)::text)))
  WHERE (((h1.primarytype)::text = 'otherNumber'::text) AND ((h2.primarytype)::text = 'taxonomicIdentGroup'::text) AND ((h2.primarytype)::text = 'taxonAuthorGroup'::text));


ALTER TABLE utils.darwincore_view OWNER TO nuxeo_ucjeps;

