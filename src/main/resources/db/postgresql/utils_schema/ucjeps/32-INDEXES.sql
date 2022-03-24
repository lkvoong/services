-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: cwdata_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE INDEX cwdata_ndx ON utils.content_workx USING btree (data);


--
-- Name: cwddata_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE INDEX cwddata_ndx ON utils.content_work_done USING btree (data);


--
-- Name: cwdid_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE UNIQUE INDEX cwdid_ndx ON utils.content_work_done USING btree (id);


--
-- Name: cwdname_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE INDEX cwdname_ndx ON utils.content_work_done USING btree (name);


--
-- Name: cwdnewdata_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE INDEX cwdnewdata_ndx ON utils.content_work_done USING btree (newdata);


--
-- Name: cwid_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE UNIQUE INDEX cwid_ndx ON utils.content_workx USING btree (id);


--
-- Name: cwname_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE INDEX cwname_ndx ON utils.content_workx USING btree (name);


--
-- Name: cwnewdata_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE INDEX cwnewdata_ndx ON utils.content_workx USING btree (newdata);


--
-- Name: majorgroup_family_lkv_tid_uidx; Type: INDEX; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE UNIQUE INDEX majorgroup_family_lkv_tid_uidx ON utils.majorgroup_family_lkv USING btree (taxonid);


--
-- Name: ucw_data_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE INDEX ucw_data_ndx ON utils.content_work USING btree (data);


--
-- Name: ucw_id_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE UNIQUE INDEX ucw_id_ndx ON utils.content_work USING btree (id);


--
-- Name: ucw_ndata_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_ucjeps
--

CREATE INDEX ucw_ndata_ndx ON utils.content_work USING btree (newdata);

