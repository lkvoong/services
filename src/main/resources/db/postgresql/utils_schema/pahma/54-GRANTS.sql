-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: SCHEMA utils; Type: ACL; Schema: -; Owner: nuxeo_pahma
--

GRANT ALL ON SCHEMA utils TO reporters_pahma;
GRANT USAGE ON SCHEMA utils TO reader_pahma;


--
-- Name: FUNCTION aggrepdatefield(coid character varying, tname character varying, cname character varying, sepval character varying); Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT ALL ON FUNCTION utils.aggrepdatefield(coid character varying, tname character varying, cname character varying, sepval character varying) TO reporters_pahma;


--
-- Name: FUNCTION aggrepfield(coid character varying, tname character varying, sepval character varying); Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT ALL ON FUNCTION utils.aggrepfield(coid character varying, tname character varying, sepval character varying) TO reporters_pahma;


--
-- Name: FUNCTION aggrepgroupfield(coid character varying, tname character varying, cname character varying, sepval character varying); Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT ALL ON FUNCTION utils.aggrepgroupfield(coid character varying, tname character varying, cname character varying, sepval character varying) TO reporters_pahma;


--
-- Name: FUNCTION createculturehierarchytable(); Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT ALL ON FUNCTION utils.createculturehierarchytable() TO reporters_pahma;


--
-- Name: FUNCTION creatematerialhierarchytable(); Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT ALL ON FUNCTION utils.creatematerialhierarchytable() TO reporters_pahma;


--
-- Name: FUNCTION createtaxonhierarchytable(); Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT ALL ON FUNCTION utils.createtaxonhierarchytable() TO reporters_pahma;


--
-- Name: FUNCTION getnagpra(cocid character varying); Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT ALL ON FUNCTION utils.getnagpra(cocid character varying) TO reporters_pahma;


--
-- Name: FUNCTION populateculturehierarchytable(); Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT ALL ON FUNCTION utils.populateculturehierarchytable() TO reporters_pahma;


--
-- Name: FUNCTION populatematerialhierarchytable(); Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT ALL ON FUNCTION utils.populatematerialhierarchytable() TO reporters_pahma;


--
-- Name: FUNCTION populatetaxonhierarchytable(); Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT ALL ON FUNCTION utils.populatetaxonhierarchytable() TO reporters_pahma;


--
-- Name: FUNCTION refreshculturehierarchytable(); Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT ALL ON FUNCTION utils.refreshculturehierarchytable() TO reporters_pahma;


--
-- Name: FUNCTION refreshmaterialhierarchytable(); Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT ALL ON FUNCTION utils.refreshmaterialhierarchytable() TO reporters_pahma;


--
-- Name: FUNCTION refreshtaxonhierarchytable(); Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT ALL ON FUNCTION utils.refreshtaxonhierarchytable() TO reporters_pahma;


--
-- Name: FUNCTION updateculturehierarchytable(); Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT ALL ON FUNCTION utils.updateculturehierarchytable() TO reporters_pahma;


--
-- Name: FUNCTION updatematerialhierarchytable(); Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT ALL ON FUNCTION utils.updatematerialhierarchytable() TO reporters_pahma;


--
-- Name: FUNCTION updateobjectplacelocation(); Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT ALL ON FUNCTION utils.updateobjectplacelocation() TO reporters_pahma;


--
-- Name: FUNCTION updatetaxonhierarchytable(); Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT ALL ON FUNCTION utils.updatetaxonhierarchytable() TO reporters_pahma;


--
-- Name: TABLE bc_id_repositoryid_list; Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT SELECT ON TABLE utils.bc_id_repositoryid_list TO reporters_pahma;


--
-- Name: TABLE blobstocontent; Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT SELECT ON TABLE utils.blobstocontent TO reporters_pahma;


--
-- Name: TABLE culture_hierarchy; Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT SELECT ON TABLE utils.culture_hierarchy TO reporters_pahma;


--
-- Name: TABLE current_location_temp; Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT SELECT ON TABLE utils.current_location_temp TO reporters_pahma;


--
-- Name: TABLE current_location_view; Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT SELECT ON TABLE utils.current_location_view TO reporters_pahma;


--
-- Name: TABLE h1_id_name_list; Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT SELECT ON TABLE utils.h1_id_name_list TO reporters_pahma;


--
-- Name: TABLE material_hierarchy; Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT SELECT ON TABLE utils.material_hierarchy TO reporters_pahma;


--
-- Name: TABLE mc_id_csid_list; Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT SELECT ON TABLE utils.mc_id_csid_list TO reporters_pahma;


--
-- Name: TABLE mediablobcontent_list; Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT SELECT ON TABLE utils.mediablobcontent_list TO reporters_pahma;


--
-- Name: TABLE mediacontentview; Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT SELECT ON TABLE utils.mediacontentview TO reporters_pahma;


--
-- Name: TABLE object_culture_hierarchy; Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT SELECT ON TABLE utils.object_culture_hierarchy TO reporters_pahma;


--
-- Name: TABLE object_material_hierarchy; Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT SELECT ON TABLE utils.object_material_hierarchy TO reporters_pahma;


--
-- Name: TABLE object_place_location; Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT SELECT ON TABLE utils.object_place_location TO reporters_pahma;


--
-- Name: TABLE object_place_temp; Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT SELECT ON TABLE utils.object_place_temp TO reporters_pahma;


--
-- Name: TABLE placename_hierarchy; Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT SELECT ON TABLE utils.placename_hierarchy TO reporters_pahma;
GRANT SELECT ON TABLE utils.placename_hierarchy TO reader_pahma;


--
-- Name: TABLE object_place_view; Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT SELECT ON TABLE utils.object_place_view TO reporters_pahma;


--
-- Name: TABLE pahma_duprelations_tmp2; Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT SELECT ON TABLE utils.pahma_duprelations_tmp2 TO reporters_pahma;


--
-- Name: TABLE pahma_deleteduprelations_vw2; Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT SELECT ON TABLE utils.pahma_deleteduprelations_vw2 TO reporters_pahma;


--
-- Name: TABLE refresh_log; Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT SELECT ON TABLE utils.refresh_log TO reporters_pahma;


--
-- Name: TABLE servername; Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT SELECT ON TABLE utils.servername TO reporters_pahma;


--
-- Name: TABLE taxon_hierarchy; Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT SELECT ON TABLE utils.taxon_hierarchy TO reporters_pahma;


--
-- Name: TABLE updateimagedata; Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT SELECT ON TABLE utils.updateimagedata TO reporters_pahma;


--
-- Name: TABLE view_counts; Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT SELECT ON TABLE utils.view_counts TO reporters_pahma;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: utils; Owner: nuxeo_pahma
--

ALTER DEFAULT PRIVILEGES FOR ROLE nuxeo_pahma IN SCHEMA utils GRANT ALL ON FUNCTIONS  TO reporters_pahma;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: utils; Owner: csadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE csadmin IN SCHEMA utils GRANT SELECT ON TABLES  TO reporters_pahma;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: utils; Owner: nuxeo_pahma
--

ALTER DEFAULT PRIVILEGES FOR ROLE nuxeo_pahma IN SCHEMA utils GRANT SELECT ON TABLES  TO reporters_pahma;

