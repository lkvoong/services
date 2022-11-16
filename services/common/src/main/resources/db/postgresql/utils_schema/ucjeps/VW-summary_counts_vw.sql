-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: summary_counts_vw; Type: VIEW; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE VIEW utils.summary_counts_vw AS
 SELECT m.yyyymm,
    m.month_yyyy,
    s.scanned,
    d.dbased
   FROM ((( SELECT to_char(core.createdat, 'YYYYMM'::text) AS yyyymm,
            to_char(core.createdat, 'Month YYYY'::text) AS month_yyyy
           FROM public.collectionspace_core core
          GROUP BY (to_char(core.createdat, 'YYYYMM'::text)), (to_char(core.createdat, 'Month YYYY'::text))
          ORDER BY (to_char(core.createdat, 'YYYYMM'::text)), (to_char(core.createdat, 'Month YYYY'::text))) m
     FULL JOIN ( SELECT count(*) AS dbased,
            to_char(core.updatedat, 'YYYYMM'::text) AS yyyymm,
            to_char(core.updatedat, 'Month YYYY'::text) AS month_yyyy
           FROM ((((((((((((public.blobs_common bc
             JOIN public.hierarchy hier_bc ON (((bc.id)::text = (hier_bc.id)::text)))
             JOIN public.misc misc_bc ON (((bc.id)::text = (misc_bc.id)::text)))
             JOIN public.media_common mc ON (((hier_bc.name)::text = (mc.blobcsid)::text)))
             JOIN public.hierarchy hier_mc ON (((mc.id)::text = (hier_mc.id)::text)))
             JOIN public.misc misc_mc ON (((mc.id)::text = (misc_mc.id)::text)))
             JOIN public.relations_common rc ON (((hier_mc.name)::text = (rc.objectcsid)::text)))
             JOIN public.hierarchy hier_rc ON (((rc.subjectcsid)::text = (hier_rc.name)::text)))
             JOIN public.collectionobjects_common coc ON (((hier_rc.id)::text = (coc.id)::text)))
             JOIN public.misc misc_coc ON (((coc.id)::text = (misc_coc.id)::text)))
             JOIN public.collectionspace_core core ON (((coc.id)::text = (core.id)::text)))
             JOIN public.hierarchy hier_sdg ON (((coc.id)::text = (hier_sdg.parentid)::text)))
             JOIN public.structureddategroup sdg ON (((hier_sdg.id)::text = (sdg.id)::text)))
          WHERE (((misc_mc.lifecyclestate)::text <> 'deleted'::text) AND ((misc_bc.lifecyclestate)::text <> 'deleted'::text) AND ((misc_coc.lifecyclestate)::text <> 'deleted'::text) AND ((rc.subjectdocumenttype)::text = 'CollectionObject'::text) AND ((rc.objectdocumenttype)::text = 'Media'::text) AND ((hier_sdg.name)::text = 'collectionobjects_common:fieldCollectionDateGroup'::text) AND (sdg.datedisplaydate IS NOT NULL) AND ((sdg.datedisplaydate)::text <> ''::text))
          GROUP BY (to_char(core.updatedat, 'YYYYMM'::text)), (to_char(core.updatedat, 'Month YYYY'::text))) d ON ((d.month_yyyy = m.month_yyyy)))
     FULL JOIN ( SELECT count(*) AS scanned,
            to_char(core.createdat, 'YYYYMM'::text) AS yyyymm,
            to_char(core.createdat, 'Month YYYY'::text) AS month_yyyy
           FROM ((((((public.blobs_common bc
             JOIN public.hierarchy hier_bc ON (((bc.id)::text = (hier_bc.id)::text)))
             JOIN public.media_common mc ON (((hier_bc.name)::text = (mc.blobcsid)::text)))
             JOIN public.media_ucjeps mu ON (((mc.id)::text = (mu.id)::text)))
             JOIN public.misc misc_mc ON (((mc.id)::text = (misc_mc.id)::text)))
             JOIN public.collectionspace_core core ON (((bc.id)::text = (core.id)::text)))
             JOIN public.misc misc_bc ON (((bc.id)::text = (misc_bc.id)::text)))
          WHERE (((misc_mc.lifecyclestate)::text <> 'deleted'::text) AND ((misc_bc.lifecyclestate)::text <> 'deleted'::text))
          GROUP BY (to_char(core.createdat, 'YYYYMM'::text)), (to_char(core.createdat, 'Month YYYY'::text))) s ON ((s.month_yyyy = m.month_yyyy)))
  ORDER BY m.yyyymm;


ALTER TABLE utils.summary_counts_vw OWNER TO nuxeo_ucjeps;

