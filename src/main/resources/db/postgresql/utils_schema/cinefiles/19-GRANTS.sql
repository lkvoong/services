-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: SCHEMA utils; Type: ACL; Schema: -; Owner: nuxeo_cinefiles
--

GRANT ALL ON SCHEMA utils TO reporters_cinefiles;


--
-- Name: TABLE activecobs_dv; Type: ACL; Schema: utils; Owner: nuxeo_cinefiles
--

GRANT SELECT ON TABLE utils.activecobs_dv TO reporters_cinefiles;


--
-- Name: TABLE allcoids; Type: ACL; Schema: utils; Owner: nuxeo_cinefiles
--

GRANT SELECT ON TABLE utils.allcoids TO reporters_cinefiles;


--
-- Name: TABLE archiveimgs; Type: ACL; Schema: utils; Owner: nuxeo_cinefiles
--

GRANT SELECT ON TABLE utils.archiveimgs TO reporters_cinefiles;


--
-- Name: TABLE blob_md5_dates_dv; Type: ACL; Schema: utils; Owner: nuxeo_cinefiles
--

GRANT SELECT ON TABLE utils.blob_md5_dates_dv TO reporters_cinefiles;


--
-- Name: TABLE blob_md5_dv; Type: ACL; Schema: utils; Owner: nuxeo_cinefiles
--

GRANT SELECT ON TABLE utils.blob_md5_dv TO reporters_cinefiles;


--
-- Name: TABLE blobs_loaded; Type: ACL; Schema: utils; Owner: nuxeo_cinefiles
--

GRANT SELECT ON TABLE utils.blobs_loaded TO reporters_cinefiles;


--
-- Name: TABLE ccsources; Type: ACL; Schema: utils; Owner: nuxeo_cinefiles
--

GRANT SELECT ON TABLE utils.ccsources TO reporters_cinefiles;


--
-- Name: TABLE cinefiles_accesscodes; Type: ACL; Schema: utils; Owner: nuxeo_cinefiles
--

GRANT SELECT ON TABLE utils.cinefiles_accesscodes TO reporters_cinefiles;


--
-- Name: TABLE coids; Type: ACL; Schema: utils; Owner: nuxeo_cinefiles
--

GRANT SELECT ON TABLE utils.coids TO reporters_cinefiles;


--
-- Name: TABLE media_blob_titles; Type: ACL; Schema: utils; Owner: nuxeo_cinefiles
--

GRANT SELECT ON TABLE utils.media_blob_titles TO reporters_cinefiles;


--
-- Name: TABLE newcollobject; Type: ACL; Schema: utils; Owner: nuxeo_cinefiles
--

GRANT SELECT ON TABLE utils.newcollobject TO reporters_cinefiles;


--
-- Name: TABLE ocfids; Type: ACL; Schema: utils; Owner: nuxeo_cinefiles
--

GRANT SELECT ON TABLE utils.ocfids TO reporters_cinefiles;


--
-- Name: TABLE org_urls_view; Type: ACL; Schema: utils; Owner: nuxeo_cinefiles
--

GRANT SELECT ON TABLE utils.org_urls_view TO reporters_cinefiles;


--
-- Name: TABLE servername; Type: ACL; Schema: utils; Owner: nuxeo_cinefiles
--

GRANT SELECT ON TABLE utils.servername TO reporters_cinefiles;


--
-- Name: TABLE tempids; Type: ACL; Schema: utils; Owner: nuxeo_cinefiles
--

GRANT SELECT ON TABLE utils.tempids TO reporters_cinefiles;


--
-- Name: TABLE webfarmimgs; Type: ACL; Schema: utils; Owner: nuxeo_cinefiles
--

GRANT SELECT ON TABLE utils.webfarmimgs TO reporters_cinefiles;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: utils; Owner: nuxeo_cinefiles
--

ALTER DEFAULT PRIVILEGES FOR ROLE nuxeo_cinefiles IN SCHEMA utils GRANT ALL ON FUNCTIONS  TO reporters_cinefiles;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: utils; Owner: nuxeo_cinefiles
--

ALTER DEFAULT PRIVILEGES FOR ROLE nuxeo_cinefiles IN SCHEMA utils GRANT SELECT ON TABLES  TO PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE nuxeo_cinefiles IN SCHEMA utils GRANT SELECT ON TABLES  TO reporters_cinefiles;

