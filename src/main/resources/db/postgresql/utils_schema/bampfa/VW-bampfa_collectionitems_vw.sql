-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: bampfa_collectionitems_vw; Type: VIEW; Schema: utils; Owner: nuxeo_bampfa
--

CREATE VIEW utils.bampfa_collectionitems_vw AS
 SELECT h1.name AS objectcsid,
    co.objectnumber AS idnumber,
    cb.sortableeffectiveobjectnumber AS sortobjectnumber,
    con.numbervalue AS othernumber,
    utils.getdispl((cb.itemclass)::text) AS itemclass,
        CASE
            WHEN ((cb.artistdisplayoverride IS NULL) OR ((cb.artistdisplayoverride)::text = ''::text)) THEN utils.concat_artists(h1.name)
            ELSE cb.artistdisplayoverride
        END AS artistcalc,
        CASE
            WHEN ((pc.birthplace IS NULL) OR ((pc.birthplace)::text = ''::text)) THEN (pcn.item)::text
            WHEN ((pcn.item)::text = (pc.birthplace)::text) THEN (pcn.item)::text
            ELSE (((pcn.item)::text || ', born '::text) || (pc.birthplace)::text)
        END AS artistorigin,
    sdgpb.datedisplaydate AS artistbirthdate,
    sdgpd.datedisplaydate AS artistdeathdate,
    pb.datesactive,
    bt.bampfatitle AS title,
    cb.initialvalue,
    cv.currentvalue,
    cv.currentvaluesource,
    sdgcv.datedisplaydate AS currentvaluedate,
    cb.creditline,
        CASE
            WHEN (((cb.creditline)::text = ''::text) OR (cb.creditline IS NULL)) THEN 'University of California, Berkeley Art Museum and Pacific Film Archive'::text
            ELSE ('University of California, Berkeley Art Museum and Pacific Film Archive; '::text || (cb.creditline)::text)
        END AS fullbampfacreditline,
        CASE
            WHEN ((cb.permissiontoreproduce IS NULL) OR ((cb.permissiontoreproduce)::text = ''::text)) THEN pb.permissiontoreproduce
            ELSE cb.permissiontoreproduce
        END AS permissiontoreproduce,
        CASE
            WHEN ((cb.copyrightcredit IS NULL) OR ((cb.copyrightcredit)::text = ''::text)) THEN pb.copyrightcredit
            ELSE cb.copyrightcredit
        END AS copyrightcredit,
    cb.photocredit,
    sdg.datedisplaydate AS datemade,
    replace((mp.dimensionsummary)::text, '-'::text, ' '::text) AS measurement,
    co.physicaldescription AS materials,
    sdgac.datedisplaydate AS dateacquired,
    cas.item AS acquisitionsource,
    cb.provenance,
    sg.inscriptioncontent AS signature,
    ccom.item AS notescomments,
    cg.catalogername AS cataloger,
    cg.catalognote,
    cg.catalogdate,
        CASE
            WHEN ((pp.objectproductionplace IS NOT NULL) AND ((pp.objectproductionplace)::text <> ''::text)) THEN pp.objectproductionplace
            ELSE NULL::character varying
        END AS site,
    utils.getdispl((st1.item)::text) AS subjectone,
    utils.getdispl((st2.item)::text) AS subjecttwo,
    utils.getdispl((st3.item)::text) AS subjectthree,
    utils.getdispl((st4.item)::text) AS subjectfour,
    utils.getdispl((st5.item)::text) AS subjectfive,
    utils.getdispl((co.computedcurrentlocation)::text) AS currentlocation,
    utils.getdispl((cb.computedcrate)::text) AS currentcrate,
    utils.getdispl((col1.item)::text) AS collection1,
    utils.getdispl((col2.item)::text) AS collection2,
    utils.getdispl((col3.item)::text) AS collection3,
    utils.getdispl((ps1.item)::text) AS periodstyle1,
    utils.getdispl((ps2.item)::text) AS periodstyle2,
    utils.getdispl((ps3.item)::text) AS periodstyle3,
    utils.getdispl((ps4.item)::text) AS periodstyle4,
    utils.getdispl((ps5.item)::text) AS periodstyle5,
    utils.getdispl((cb.legalstatus)::text) AS legalstatus,
    utils.get_object_image_count(h1.name) AS imagecount,
    utils.get_first_blobcsid_displevel(h1.name, 'blobcsid'::character varying) AS image1blobcsid,
    utils.get_first_blobcsid_displevel(h1.name, 'displevel'::character varying) AS image1displevel,
    utils.getdispl((cb.acquisitionmethod)::text) AS acquisitionmethod
   FROM ((((((((((((((((((((((((((((((((((((((((((((((((public.hierarchy h1
     JOIN public.collectionobjects_common co ON ((((h1.id)::text = (co.id)::text) AND ((h1.primarytype)::text = 'CollectionObjectTenant55'::text))))
     JOIN public.misc m ON ((((co.id)::text = (m.id)::text) AND ((m.lifecyclestate)::text <> 'deleted'::text))))
     JOIN public.collectionobjects_bampfa cb ON (((co.id)::text = (cb.id)::text)))
     JOIN public.collectionspace_core core ON (((co.id)::text = (core.id)::text)))
     LEFT JOIN public.hierarchy h2 ON ((((h2.parentid)::text = (co.id)::text) AND ((h2.name)::text = 'collectionobjects_common:objectProductionDateGroupList'::text) AND (h2.pos = 0))))
     LEFT JOIN public.structureddategroup sdg ON (((h2.id)::text = (sdg.id)::text)))
     LEFT JOIN public.hierarchy h3 ON ((((h3.parentid)::text = (co.id)::text) AND ((h3.name)::text = 'collectionobjects_common:otherNumberList'::text) AND (h3.pos = 0))))
     LEFT JOIN public.othernumber con ON (((h3.id)::text = (con.id)::text)))
     LEFT JOIN public.hierarchy h4 ON ((((h4.parentid)::text = (co.id)::text) AND ((h4.name)::text = 'collectionobjects_bampfa:bampfaTitleGroupList'::text) AND (h4.pos = 0))))
     LEFT JOIN public.bampfatitlegroup bt ON (((h4.id)::text = (bt.id)::text)))
     LEFT JOIN public.hierarchy h5 ON ((((h5.parentid)::text = (co.id)::text) AND ((h5.name)::text = 'collectionobjects_bampfa:currentValueGroupList'::text) AND (h5.pos = 0))))
     LEFT JOIN public.currentvaluegroup cv ON (((h5.id)::text = (cv.id)::text)))
     LEFT JOIN public.hierarchy h6 ON ((((h6.parentid)::text = (cv.id)::text) AND ((h6.name)::text = 'currentValueDateGroup'::text))))
     LEFT JOIN public.structureddategroup sdgcv ON (((h6.id)::text = (sdgcv.id)::text)))
     LEFT JOIN public.hierarchy h7 ON ((((h7.parentid)::text = (co.id)::text) AND ((h7.name)::text = 'collectionobjects_common:measuredPartGroupList'::text) AND (h7.pos = 0))))
     LEFT JOIN public.measuredpartgroup mp ON (((h7.id)::text = (mp.id)::text)))
     LEFT JOIN public.hierarchy h8 ON ((((h8.parentid)::text = (co.id)::text) AND ((h8.name)::text = 'collectionobjects_common:textualInscriptionGroupList'::text) AND (h8.pos = 0))))
     LEFT JOIN public.textualinscriptiongroup sg ON (((h8.id)::text = (sg.id)::text)))
     LEFT JOIN public.hierarchy h9 ON ((((h9.parentid)::text = (co.id)::text) AND ((h9.name)::text = 'collectionobjects_bampfa:acquisitionDateGroupList'::text) AND (h9.pos = 0))))
     LEFT JOIN public.structureddategroup sdgac ON (((h9.id)::text = (sdgac.id)::text)))
     LEFT JOIN public.collectionobjects_bampfa_acquisitionsources cas ON ((((co.id)::text = (cas.id)::text) AND (cas.pos = 0))))
     LEFT JOIN public.collectionobjects_common_comments ccom ON ((((co.id)::text = (ccom.id)::text) AND (ccom.pos = 0))))
     LEFT JOIN public.hierarchy h10 ON ((((h10.parentid)::text = (co.id)::text) AND ((h10.name)::text = 'collectionobjects_bampfa:catalogerGroupList'::text) AND (h10.pos = 0))))
     LEFT JOIN public.catalogergroup cg ON (((h10.id)::text = (cg.id)::text)))
     LEFT JOIN public.hierarchy h11 ON ((((h11.parentid)::text = (co.id)::text) AND ((h11.name)::text = 'collectionobjects_bampfa:bampfaObjectProductionPersonGroupList'::text) AND (h11.pos = 0))))
     LEFT JOIN public.bampfaobjectproductionpersongroup ba ON (((h11.id)::text = (ba.id)::text)))
     LEFT JOIN public.persons_common pc ON (((ba.bampfaobjectproductionperson)::text = (pc.refname)::text)))
     LEFT JOIN public.persons_common_nationalities pcn ON ((((pc.id)::text = (pcn.id)::text) AND (pcn.pos = 0))))
     LEFT JOIN public.hierarchy h12 ON ((((h12.parentid)::text = (pc.id)::text) AND ((h12.name)::text = 'persons_common:birthDateGroup'::text))))
     LEFT JOIN public.structureddategroup sdgpb ON (((h12.id)::text = (sdgpb.id)::text)))
     LEFT JOIN public.hierarchy h13 ON ((((h13.parentid)::text = (pc.id)::text) AND ((h13.name)::text = 'persons_common:deathDateGroup'::text))))
     LEFT JOIN public.structureddategroup sdgpd ON (((h13.id)::text = (sdgpd.id)::text)))
     LEFT JOIN public.persons_bampfa pb ON (((pc.id)::text = (pb.id)::text)))
     LEFT JOIN public.hierarchy h14 ON ((((h14.parentid)::text = (co.id)::text) AND ((h14.name)::text = 'collectionobjects_common:objectProductionPlaceGroupList'::text) AND (h14.pos = 0))))
     LEFT JOIN public.objectproductionplacegroup pp ON (((h14.id)::text = (pp.id)::text)))
     LEFT JOIN public.collectionobjects_bampfa_subjectthemes st1 ON ((((st1.id)::text = (co.id)::text) AND (st1.pos = 0))))
     LEFT JOIN public.collectionobjects_bampfa_subjectthemes st2 ON ((((st2.id)::text = (co.id)::text) AND (st2.pos = 1))))
     LEFT JOIN public.collectionobjects_bampfa_subjectthemes st3 ON ((((st3.id)::text = (co.id)::text) AND (st3.pos = 2))))
     LEFT JOIN public.collectionobjects_bampfa_subjectthemes st4 ON ((((st4.id)::text = (co.id)::text) AND (st4.pos = 3))))
     LEFT JOIN public.collectionobjects_bampfa_subjectthemes st5 ON ((((st5.id)::text = (co.id)::text) AND (st5.pos = 4))))
     LEFT JOIN public.collectionobjects_bampfa_bampfacollectionlist col1 ON ((((col1.id)::text = (co.id)::text) AND (col1.pos = 0))))
     LEFT JOIN public.collectionobjects_bampfa_bampfacollectionlist col2 ON ((((col2.id)::text = (co.id)::text) AND (col2.pos = 1))))
     LEFT JOIN public.collectionobjects_bampfa_bampfacollectionlist col3 ON ((((col3.id)::text = (co.id)::text) AND (col2.pos = 2))))
     LEFT JOIN public.collectionobjects_common_styles ps1 ON ((((ps1.id)::text = (co.id)::text) AND (ps1.pos = 0))))
     LEFT JOIN public.collectionobjects_common_styles ps2 ON ((((ps2.id)::text = (co.id)::text) AND (ps2.pos = 1))))
     LEFT JOIN public.collectionobjects_common_styles ps3 ON ((((ps3.id)::text = (co.id)::text) AND (ps3.pos = 2))))
     LEFT JOIN public.collectionobjects_common_styles ps4 ON ((((ps4.id)::text = (co.id)::text) AND (ps4.pos = 3))))
     LEFT JOIN public.collectionobjects_common_styles ps5 ON ((((ps5.id)::text = (co.id)::text) AND (ps5.pos = 4))))
  ORDER BY cb.sortableeffectiveobjectnumber;


ALTER TABLE utils.bampfa_collectionitems_vw OWNER TO nuxeo_bampfa;

