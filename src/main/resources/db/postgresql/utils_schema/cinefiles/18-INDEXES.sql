-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: blobdocid_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_cinefiles
--

CREATE INDEX blobdocid_ndx ON utils.blobs_loaded USING btree (doc_id);


--
-- Name: blobpgnum_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_cinefiles
--

CREATE INDEX blobpgnum_ndx ON utils.blobs_loaded USING btree (pagenum);


--
-- Name: docid_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_cinefiles
--

CREATE INDEX docid_ndx ON utils.archiveimgs USING btree (doc_id);


--
-- Name: pgnum_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_cinefiles
--

CREATE INDEX pgnum_ndx ON utils.archiveimgs USING btree (pagenum);


--
-- Name: wfdocid_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_cinefiles
--

CREATE INDEX wfdocid_ndx ON utils.webfarmimgs USING btree (doc_id);


--
-- Name: wfpgnum_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_cinefiles
--

CREATE INDEX wfpgnum_ndx ON utils.webfarmimgs USING btree (pagenum);

