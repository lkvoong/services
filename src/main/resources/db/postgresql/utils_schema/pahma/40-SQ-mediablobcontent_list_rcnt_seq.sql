-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: mediablobcontent_list_rcnt_seq; Type: SEQUENCE; Schema: utils; Owner: nuxeo_pahma
--

CREATE SEQUENCE utils.mediablobcontent_list_rcnt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE utils.mediablobcontent_list_rcnt_seq OWNER TO nuxeo_pahma;

--
-- Name: mediablobcontent_list_rcnt_seq; Type: SEQUENCE OWNED BY; Schema: utils; Owner: nuxeo_pahma
--

ALTER SEQUENCE utils.mediablobcontent_list_rcnt_seq OWNED BY utils.mediablobcontent_list.rcnt;

--
-- Name: mediablobcontent_list rcnt; Type: DEFAULT; Schema: utils; Owner: nuxeo_pahma
--

ALTER TABLE ONLY utils.mediablobcontent_list ALTER COLUMN rcnt SET DEFAULT nextval('utils.mediablobcontent_list_rcnt_seq'::regclass);


