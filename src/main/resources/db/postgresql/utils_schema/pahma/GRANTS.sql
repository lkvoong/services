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
-- Name: TABLE servername; Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT SELECT ON TABLE utils.servername TO reporters_pahma;


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

