-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: plantsalespottags; Type: VIEW; Schema: utils; Owner: nuxeo_botgarden
--

CREATE VIEW utils.plantsalespottags AS
 SELECT row_number() OVER (ORDER BY pc.id) AS label_id,
    co1.objectnumber AS accession_number,
        CASE
            WHEN ((pc.taxonname IS NOT NULL) AND (pc.family IS NOT NULL)) THEN ((public.getdispl((pc.taxonname)::text) || ' '::text) || public.getdispl((pc.family)::text))
            WHEN ((pc.taxonname IS NOT NULL) AND (pc.family IS NULL)) THEN public.getdispl((pc.taxonname)::text)
            WHEN ((pc.taxonname IS NULL) AND (pc.family IS NOT NULL)) THEN public.getdispl((pc.family)::text)
            ELSE NULL::text
        END AS taxon_data,
    pc.commonname AS common_name,
    pc.locale AS country_name,
    pc.labeldata AS label_data,
    pc.numberoflabels AS quantity,
    pc.printlabels AS label_req_flag,
    core.createdby AS staff_logon,
    date(core.createdat) AS date_entered,
    core.updatedby AS last_change_staff_logon,
    date(core.updatedat) AS last_change_date
   FROM (((((((public.pottags_common pc
     LEFT JOIN public.hierarchy h1 ON (((pc.id)::text = (h1.id)::text)))
     LEFT JOIN public.relations_common r1 ON ((((h1.name)::text = (r1.subjectcsid)::text) AND ((r1.objectdocumenttype)::text = 'CollectionObject'::text))))
     LEFT JOIN public.hierarchy h2 ON (((r1.objectcsid)::text = (h2.name)::text)))
     LEFT JOIN public.collectionobjects_common co1 ON (((co1.id)::text = (h2.id)::text)))
     JOIN public.collectionspace_core core ON ((((core.id)::text = (pc.id)::text) AND ((core.tenantid)::text = (35)::text))))
     JOIN public.misc misc1 ON ((((misc1.id)::text = (pc.id)::text) AND ((misc1.lifecyclestate)::text <> 'deleted'::text))))
     LEFT JOIN public.misc misc2 ON ((((misc2.id)::text = (co1.id)::text) AND ((misc2.lifecyclestate)::text <> 'deleted'::text))))
  WHERE ((pc.printlabels)::text = 'yes'::text)
  ORDER BY (row_number() OVER (ORDER BY pc.id));


ALTER TABLE utils.plantsalespottags OWNER TO nuxeo_botgarden;

