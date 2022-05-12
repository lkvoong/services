-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: SCHEMA utils; Type: ACL; Schema: -; Owner: nuxeo_ucjeps
--

GRANT ALL ON SCHEMA utils TO reporters_ucjeps;


--
-- Name: FUNCTION concat_relatedaccns(accnid character varying); Type: ACL; Schema: utils; Owner: nuxeo_ucjeps
--

GRANT ALL ON FUNCTION utils.concat_relatedaccns(accnid character varying) TO reporter_ucjeps;
GRANT ALL ON FUNCTION utils.concat_relatedaccns(accnid character varying) TO reporters_ucjeps;


--
-- Name: TABLE servername; Type: ACL; Schema: utils; Owner: nuxeo_ucjeps
--

GRANT SELECT ON TABLE utils.servername TO PUBLIC;

