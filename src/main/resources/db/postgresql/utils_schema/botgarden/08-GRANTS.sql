-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

GRANT ALL ON SCHEMA utils TO reporters_botgarden;


--
-- Name: TABLE plantsalespottags; Type: ACL; Schema: utils; Owner: nuxeo_botgarden
--

GRANT SELECT ON TABLE utils.plantsalespottags TO reporters_botgarden;
GRANT SELECT ON TABLE utils.plantsalespottags TO PUBLIC;


--
-- Name: TABLE servername; Type: ACL; Schema: utils; Owner: nuxeo_botgarden
--

GRANT SELECT ON TABLE utils.servername TO reporters_botgarden;


--
-- Name: TABLE taxon_missing_fam_lkv; Type: ACL; Schema: utils; Owner: nuxeo_botgarden
--

GRANT SELECT ON TABLE utils.taxon_missing_fam_lkv TO reporters_botgarden;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: utils; Owner: nuxeo_botgarden
--

ALTER DEFAULT PRIVILEGES FOR ROLE nuxeo_botgarden IN SCHEMA utils GRANT SELECT ON TABLES  TO PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE nuxeo_botgarden IN SCHEMA utils GRANT SELECT ON TABLES  TO reporters_botgarden;

