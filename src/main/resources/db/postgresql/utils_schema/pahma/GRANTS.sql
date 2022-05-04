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
-- Name: FUNCTION getnagpra(cocid character varying); Type: ACL; Schema: utils; Owner: nuxeo_pahma
--

GRANT ALL ON FUNCTION utils.getnagpra(cocid character varying) TO reporters_pahma;


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

