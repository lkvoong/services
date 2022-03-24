-- Dumped from database version 11.12
-- Dumped by pg_dump version 14.2

--
-- Name: clt_objcsid_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_pahma
--

CREATE INDEX clt_objcsid_ndx ON utils.current_location_temp USING btree (collectionobjectcsid);


--
-- Name: opn_csidhier_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_pahma
--

CREATE INDEX opn_csidhier_ndx ON utils.object_place_location USING btree (place_csid_hierarchy);


--
-- Name: opn_id_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_pahma
--

CREATE INDEX opn_id_ndx ON utils.object_place_location USING btree (id);


--
-- Name: opn_location_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_pahma
--

CREATE INDEX opn_location_ndx ON utils.object_place_location USING btree (storagelocation);


--
-- Name: opn_objcsid_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_pahma
--

CREATE INDEX opn_objcsid_ndx ON utils.object_place_location USING btree (collectionobjectcsid);


--
-- Name: opn_objnumber_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_pahma
--

CREATE INDEX opn_objnumber_ndx ON utils.object_place_location USING btree (objectnumber);


--
-- Name: opn_placename_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_pahma
--

CREATE INDEX opn_placename_ndx ON utils.object_place_location USING btree (placename);


--
-- Name: opt_placecsid_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_pahma
--

CREATE INDEX opt_placecsid_ndx ON utils.object_place_temp USING btree (placecsid);


--
-- Name: uch_ccsid_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_pahma
--

CREATE INDEX uch_ccsid_ndx ON utils.culture_hierarchy USING btree (culturecsid);


--
-- Name: uch_cname_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_pahma
--

CREATE INDEX uch_cname_ndx ON utils.culture_hierarchy USING btree (culture);


--
-- Name: umh_mcsid_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_pahma
--

CREATE INDEX umh_mcsid_ndx ON utils.material_hierarchy USING btree (materialcsid);


--
-- Name: umh_mname_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_pahma
--

CREATE INDEX umh_mname_ndx ON utils.material_hierarchy USING btree (material);


--
-- Name: uph_pcsid_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_pahma
--

CREATE INDEX uph_pcsid_ndx ON utils.placename_hierarchy USING btree (placecsid);


--
-- Name: uph_pname_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_pahma
--

CREATE INDEX uph_pname_ndx ON utils.placename_hierarchy USING btree (placename);


--
-- Name: uth_tcsid_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_pahma
--

CREATE INDEX uth_tcsid_ndx ON utils.taxon_hierarchy USING btree (taxoncsid);


--
-- Name: uth_tname_ndx; Type: INDEX; Schema: utils; Owner: nuxeo_pahma
--

CREATE INDEX uth_tname_ndx ON utils.taxon_hierarchy USING btree (taxon);

