-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: SCHEMA utils; Type: ACL; Schema: -; Owner: nuxeo_cinefiles
--

GRANT ALL ON SCHEMA utils TO reporters_cinefiles;


--
-- Name: TABLE servername; Type: ACL; Schema: utils; Owner: nuxeo_cinefiles
--

GRANT SELECT ON TABLE utils.servername TO reporters_cinefiles;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: utils; Owner: nuxeo_cinefiles
--

ALTER DEFAULT PRIVILEGES FOR ROLE nuxeo_cinefiles IN SCHEMA utils GRANT ALL ON FUNCTIONS  TO reporters_cinefiles;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: utils; Owner: nuxeo_cinefiles
--

ALTER DEFAULT PRIVILEGES FOR ROLE nuxeo_cinefiles IN SCHEMA utils GRANT SELECT ON TABLES  TO PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE nuxeo_cinefiles IN SCHEMA utils GRANT SELECT ON TABLES  TO reporters_cinefiles;

