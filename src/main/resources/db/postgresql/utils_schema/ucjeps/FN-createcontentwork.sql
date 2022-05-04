-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: createcontentwork(); Type: FUNCTION; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE FUNCTION utils.createcontentwork() RETURNS bigint
    LANGUAGE sql
    AS $$ 
  CREATE OR REPLACE VIEW utils.content_work_view AS 
    SELECT 
      id, 
      name, 
      data, NULL::character varying(40) as newdata, 
      FALSE as rotated, 
      now()::timestamp without time zone as date, 
      0 as w, 
      0 as h 
    FROM public.content 
    WHERE name IS NOT NULL 
      AND length(name) > 0 
      AND data IS NOT NULL 
      AND length(data) > 0; 
      
  TRUNCATE TABLE utils.content_work; 
  
  INSERT INTO utils.content_work SELECT * FROM utils.content_work_view;

  DELETE FROM utils.content_work w USING utils.content_work_done d 
  WHERE w.id = d.id; 
 
  SELECT count(*) from utils.content_work; 
$$;


ALTER FUNCTION utils.createcontentwork() OWNER TO nuxeo_ucjeps;

