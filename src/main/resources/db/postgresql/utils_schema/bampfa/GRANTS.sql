-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: SCHEMA utils; Type: ACL; Schema: -; Owner: nuxeo_bampfa
--

GRANT ALL ON SCHEMA utils TO reporters_bampfa;
GRANT USAGE ON SCHEMA utils TO reader_bampfa;
GRANT USAGE ON SCHEMA utils TO piction_ro;
GRANT USAGE ON SCHEMA utils TO piction;


--
-- Name: FUNCTION concat_artists(csid character varying); Type: ACL; Schema: utils; Owner: nuxeo_bampfa
--

GRANT ALL ON FUNCTION utils.concat_artists(csid character varying) TO reporters_bampfa;


--
-- Name: FUNCTION get_first_blobcsid(title character varying); Type: ACL; Schema: utils; Owner: nuxeo_bampfa
--

GRANT ALL ON FUNCTION utils.get_first_blobcsid(title character varying) TO reader_bampfa;
GRANT ALL ON FUNCTION utils.get_first_blobcsid(title character varying) TO reporters_bampfa;


--
-- Name: FUNCTION get_first_blobcsid_displevel(title character varying, returnvar character varying); Type: ACL; Schema: utils; Owner: nuxeo_bampfa
--

GRANT ALL ON FUNCTION utils.get_first_blobcsid_displevel(title character varying, returnvar character varying) TO reader_bampfa;
GRANT ALL ON FUNCTION utils.get_first_blobcsid_displevel(title character varying, returnvar character varying) TO reporters_bampfa;


--
-- Name: FUNCTION get_first_blobcsid_filename(title character varying, returnvar character varying); Type: ACL; Schema: utils; Owner: nuxeo_bampfa
--

GRANT ALL ON FUNCTION utils.get_first_blobcsid_filename(title character varying, returnvar character varying) TO reader_bampfa;
GRANT ALL ON FUNCTION utils.get_first_blobcsid_filename(title character varying, returnvar character varying) TO reporters_bampfa;


--
-- Name: FUNCTION get_object_image_count(objcsid character varying); Type: ACL; Schema: utils; Owner: nuxeo_bampfa
--

GRANT ALL ON FUNCTION utils.get_object_image_count(objcsid character varying) TO reader_bampfa;
GRANT ALL ON FUNCTION utils.get_object_image_count(objcsid character varying) TO reporters_bampfa;


--
-- Name: FUNCTION get_originaljpeg_filepath(title character varying); Type: ACL; Schema: utils; Owner: nuxeo_bampfa
--

GRANT ALL ON FUNCTION utils.get_originaljpeg_filepath(title character varying) TO csadmin;
GRANT ALL ON FUNCTION utils.get_originaljpeg_filepath(title character varying) TO reporters_bampfa;


--
-- Name: FUNCTION get_updatedat_co_mh(objcsid character varying); Type: ACL; Schema: utils; Owner: nuxeo_bampfa
--

GRANT ALL ON FUNCTION utils.get_updatedat_co_mh(objcsid character varying) TO reader_bampfa;
GRANT ALL ON FUNCTION utils.get_updatedat_co_mh(objcsid character varying) TO reporters_bampfa;


--
-- Name: FUNCTION getdispl(text); Type: ACL; Schema: utils; Owner: nuxeo_bampfa
--

GRANT ALL ON FUNCTION utils.getdispl(text) TO reporters_bampfa;


--
-- Name: TABLE bampfa_collectionitems_vw; Type: ACL; Schema: utils; Owner: nuxeo_bampfa
--

GRANT SELECT ON TABLE utils.bampfa_collectionitems_vw TO reader_bampfa;
GRANT SELECT ON TABLE utils.bampfa_collectionitems_vw TO reporters_bampfa;


--
-- Name: TABLE servername; Type: ACL; Schema: utils; Owner: nuxeo_bampfa
--

GRANT SELECT ON TABLE utils.servername TO reporters_bampfa;

