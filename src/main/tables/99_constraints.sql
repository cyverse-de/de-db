--
-- Name: data_format_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY data_formats
    ADD CONSTRAINT data_format_pkey
    PRIMARY KEY (id);

--
-- Name: workflow_io_maps_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY workflow_io_maps
    ADD CONSTRAINT workflow_io_maps_pkey
    PRIMARY KEY (source_step, output, target_step, input);
CREATE INDEX workflow_io_maps_app_id_idx ON workflow_io_maps(app_id);
CREATE INDEX workflow_io_maps_source_idx ON workflow_io_maps(source_step);
CREATE INDEX workflow_io_maps_target_idx ON workflow_io_maps(target_step);

--
-- Name: dataobjects_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY dataobjects
    ADD CONSTRAINT dataobjects_pkey
    PRIMARY KEY (hid);

--
-- Name: deployed_component_data_files_pkey; Type: CONSTRAINT; Schema: public;
-- Owner: de; Tablespace:
--
ALTER TABLE ONLY deployed_component_data_files
    ADD CONSTRAINT deployed_component_data_files_pkey
    PRIMARY KEY (id);

--
-- Name: deployed_components_pkey; Type: CONSTRAINT; Schema: public; Owner:
-- de; Tablespace:
--
ALTER TABLE ONLY deployed_components
    ADD CONSTRAINT deployed_components_pkey
    PRIMARY KEY (hid);

--
-- Name: info_type_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY info_type
    ADD CONSTRAINT info_type_pkey
    PRIMARY KEY (hid);

--
-- Name: integration_data_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY integration_data
    ADD CONSTRAINT integration_data_pkey
    PRIMARY KEY (id);

--
-- Name: multiplicity_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY multiplicity
    ADD CONSTRAINT multiplicity_pkey
    PRIMARY KEY (hid);

--
-- Name: notification_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY notification
    ADD CONSTRAINT notification_pkey
    PRIMARY KEY (hid);

--
-- Name: notification_set_notification_pkey; Type: CONSTRAINT; Schema: public;
-- Owner: de; Tablespace:
--
ALTER TABLE ONLY notification_set_notification
    ADD CONSTRAINT notification_set_notification_pkey
    PRIMARY KEY (notification_set_id, hid);

--
-- Name: notification_set_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY notification_set
    ADD CONSTRAINT notification_set_pkey
    PRIMARY KEY (hid);

--
-- Name: notifications_receivers_pkey; Type: CONSTRAINT; Schema: public;
-- Owner: de; Tablespace:
--
ALTER TABLE ONLY notifications_receivers
    ADD CONSTRAINT notifications_receivers_pkey
    PRIMARY KEY (notification_id, hid);

--
-- Name: property_group_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY property_group
    ADD CONSTRAINT property_group_pkey
    PRIMARY KEY (hid);

--
-- Name: property_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY property
    ADD CONSTRAINT property_pkey
    PRIMARY KEY (hid);

--
-- Name: property_type_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY property_type
    ADD CONSTRAINT property_type_pkey
    PRIMARY KEY (hid);

--
-- Name: ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_pkey
    PRIMARY KEY (id);

--
-- Name: rule_argument_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY rule_argument
    ADD CONSTRAINT rule_argument_pkey
    PRIMARY KEY (rule_id, hid);

--
-- Name: rule_pkey; Type: CONSTRAINT; Schema: public; Owner: de; Tablespace:
--
ALTER TABLE ONLY rule
    ADD CONSTRAINT rule_pkey
    PRIMARY KEY (hid);

--
-- Name: rule_subtype_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY rule_subtype
    ADD CONSTRAINT rule_subtype_pkey
    PRIMARY KEY (hid);

--
-- Name: rule_type_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY rule_type
    ADD CONSTRAINT rule_type_pkey
    PRIMARY KEY (hid);

--
-- Name: suggested_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY suggested_groups
    ADD CONSTRAINT suggested_groups_pkey
    PRIMARY KEY (app_id, app_category_id);

--
-- Name: app_category_group_pkey; Type: CONSTRAINT; Schema: public; Owner:
-- de; Tablespace:
--
ALTER TABLE ONLY app_category_group
    ADD CONSTRAINT app_category_group_pkey
    PRIMARY KEY (parent_category_id, child_category_id);

--
-- Name: app_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY app_categories
    ADD CONSTRAINT app_categories_pkey
    PRIMARY KEY (id);

--
-- Name: app_category_app_pkey; Type: CONSTRAINT; Schema: public;
-- Owner: de; Tablespace:
--
ALTER TABLE ONLY app_category_app
    ADD CONSTRAINT app_category_app_pkey
    PRIMARY KEY (app_category_id, app_id);

--
-- Name: tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_pkey
    PRIMARY KEY (id);

--
-- Name: apps_pkey; Type: CONSTRAINT; Schema: public;
-- Owner: de; Tablespace:
--
ALTER TABLE ONLY apps
    ADD CONSTRAINT apps_pkey
    PRIMARY KEY (id);

--
-- Name: app_references_pkey; Type: CONSTRAINT; Schema:
-- public; Owner: de; Tablespace:
--
ALTER TABLE ONLY app_references
    ADD CONSTRAINT app_references_pkey
    PRIMARY KEY (id);

--
-- Name: app_steps_pkey; Type: CONSTRAINT; Schema: public;
-- Owner: de; Tablespace:
--
ALTER TABLE ONLY app_steps
    ADD CONSTRAINT app_steps_pkey
    PRIMARY KEY (id);

--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: de; Tablespace:
--
ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey
    PRIMARY KEY (id);

--
-- Name: value_type_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY value_type
    ADD CONSTRAINT value_type_pkey
    PRIMARY KEY (hid);

--
-- Name: votes_unique; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY ratings
    ADD CONSTRAINT votes_unique
    UNIQUE (user_id, app_id);

--
-- Name: workspace_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY workspace
    ADD CONSTRAINT workspace_pkey
    PRIMARY KEY (id);

--
-- Name: dataobjects_data_format_fkey; Type: FK CONSTRAINT; Schema: public;
-- Owner: de
--
ALTER TABLE ONLY dataobjects
    ADD CONSTRAINT dataobjects_data_format_fkey
    FOREIGN KEY (data_format)
    REFERENCES data_formats(id);

--
-- Name: dataobjects_info_type_fkey; Type: FK CONSTRAINT; Schema: public;
-- Owner: de
--
ALTER TABLE ONLY dataobjects
    ADD CONSTRAINT dataobjects_info_type_fkey
    FOREIGN KEY (info_type)
    REFERENCES info_type(hid);

--
-- Name: dataobjects_multiplicity_fkey; Type: FK CONSTRAINT; Schema: public;
-- Owner: de
--
ALTER TABLE ONLY dataobjects
    ADD CONSTRAINT dataobjects_multiplicity_fkey
    FOREIGN KEY (multiplicity)
    REFERENCES multiplicity(hid);

--
-- Name: deployed_comp_integration_data_id_fk; Type: FK CONSTRAINT; Schema:
-- public; Owner: de
--
ALTER TABLE ONLY deployed_components
    ADD CONSTRAINT deployed_comp_integration_data_id_fk
    FOREIGN KEY (integration_data_id)
    REFERENCES integration_data(id);

--
-- Name: deployed_component_data_files_deployed_component_id_fkey; Type: FK
-- CONSTRAINT; Schema: public; Owner: de
--
ALTER TABLE ONLY deployed_component_data_files
    ADD CONSTRAINT deployed_component_data_files_deployed_component_id_fkey
    FOREIGN KEY (deployed_component_id)
    REFERENCES deployed_components(hid);

--
-- Name: workflow_io_maps_source_fkey; Type: FK CONSTRAINT; Schema:
-- public; Owner: de
--
ALTER TABLE ONLY workflow_io_maps
    ADD CONSTRAINT workflow_io_maps_source_fkey
    FOREIGN KEY (source_step)
    REFERENCES app_steps(id);

--
-- Name: workflow_io_maps_target_fkey; Type: FK CONSTRAINT; Schema:
-- public; Owner: de
--
ALTER TABLE ONLY workflow_io_maps
    ADD CONSTRAINT workflow_io_maps_target_fkey
    FOREIGN KEY (target_step)
    REFERENCES app_steps(id);

--
-- Name: notification_set_notification_notification_id_fkey; Type: FK
-- CONSTRAINT; Schema: public; Owner: de
--
ALTER TABLE ONLY notification_set_notification
    ADD CONSTRAINT notification_set_notification_notification_id_fkey
    FOREIGN KEY (notification_id)
    REFERENCES notification(hid);

--
-- Name: notification_set_notification_notification_set_id_fkey; Type: FK
-- CONSTRAINT; Schema: public; Owner: de
--
ALTER TABLE ONLY notification_set_notification
    ADD CONSTRAINT notification_set_notification_notification_set_id_fkey
    FOREIGN KEY (notification_set_id)
    REFERENCES notification_set(hid);

--
-- Name: notifications_receivers_notification_id_fkey; Type: FK CONSTRAINT;
-- Schema: public; Owner: de
--
ALTER TABLE ONLY notifications_receivers
    ADD CONSTRAINT notifications_receivers_notification_id_fkey
    FOREIGN KEY (notification_id)
    REFERENCES notification(hid);

--
-- Name: property_dataobject_id_fkey; Type: FK CONSTRAINT; Schema: public;
-- Owner: de
--
ALTER TABLE ONLY property
    ADD CONSTRAINT property_dataobject_id_fkey
    FOREIGN KEY (dataobject_id)
    REFERENCES dataobjects(hid);

--
-- Name: property_property_group_id_fkey; Type: FK CONSTRAINT;
-- Schema: public; Owner: de
--
ALTER TABLE ONLY property
    ADD CONSTRAINT property_property_group_id_fkey
    FOREIGN KEY (property_group_id)
    REFERENCES property_group(hid);

--
-- Name: property_property_type_fkey; Type: FK CONSTRAINT; Schema: public;
-- Owner: de
--
ALTER TABLE ONLY property
    ADD CONSTRAINT property_property_type_fkey
    FOREIGN KEY (property_type)
    REFERENCES property_type(hid);

--
-- Name: ratings_app_id_fkey; Type: FK CONSTRAINT; Schema:
-- public; Owner: de
--
ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_app_id_fkey
    FOREIGN KEY (app_id)
    REFERENCES apps(id);

--
-- Name: ratings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: de
--
ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id);

--
-- Name: rule_argument_rule_id_fkey; Type: FK CONSTRAINT; Schema: public;
-- Owner: de
--
ALTER TABLE ONLY rule_argument
    ADD CONSTRAINT rule_argument_rule_id_fkey
    FOREIGN KEY (rule_id)
    REFERENCES rule(hid);

--
-- Name: rule_rule_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: de
--
ALTER TABLE ONLY rule
    ADD CONSTRAINT rule_rule_type_fkey
    FOREIGN KEY (rule_type)
    REFERENCES rule_type(hid);

--
-- Name: rule_type_value_type_rule_type_id_fkey; Type: FK CONSTRAINT; Schema:
-- public; Owner: de
--
ALTER TABLE ONLY rule_type_value_type
    ADD CONSTRAINT rule_type_value_type_rule_type_id_fkey
    FOREIGN KEY (rule_type_id)
    REFERENCES rule_type(hid);

--
-- Name: rule_type_value_type_value_type_id_fkey; Type: FK CONSTRAINT; Schema:
-- public; Owner: de
--
ALTER TABLE ONLY rule_type_value_type
    ADD CONSTRAINT rule_type_value_type_value_type_id_fkey
    FOREIGN KEY (value_type_id)
    REFERENCES value_type(hid);

--
-- Name: suggested_groups_app_category_id_fkey; Type: FK CONSTRAINT; Schema:
-- public; Owner: de
--
ALTER TABLE ONLY suggested_groups
    ADD CONSTRAINT suggested_groups_app_category_id_fkey
    FOREIGN KEY (app_category_id)
    REFERENCES app_categories(id);

--
-- Name: suggested_groups_app_id_fkey; Type: FK
-- CONSTRAINT; Schema: public; Owner: de
--
ALTER TABLE ONLY suggested_groups
    ADD CONSTRAINT suggested_groups_app_id_fkey
    FOREIGN KEY (app_id)
    REFERENCES apps(id);

--
-- Name: app_category_group_parent_category_id_fkey; Type: FK CONSTRAINT;
-- Schema: public; Owner: de
--
ALTER TABLE ONLY app_category_group
    ADD CONSTRAINT app_category_group_parent_category_id_fkey
    FOREIGN KEY (parent_category_id)
    REFERENCES app_categories(id);

--
-- Name: app_category_group_child_category_id_fkey; Type: FK CONSTRAINT; Schema:
-- public; Owner: de
--
ALTER TABLE ONLY app_category_group
    ADD CONSTRAINT app_category_group_child_category_id_fkey
    FOREIGN KEY (child_category_id)
    REFERENCES app_categories(id);

--
-- Name: app_category_app_app_category_id_fkey; Type: FK CONSTRAINT;
-- Schema: public; Owner: de
--
ALTER TABLE ONLY app_category_app
    ADD CONSTRAINT app_category_app_app_category_id_fkey
    FOREIGN KEY (app_category_id)
    REFERENCES app_categories(id);

--
-- Name: app_category_app_app_id_fkey; Type: FK CONSTRAINT;
-- Schema: public; Owner: de
--
ALTER TABLE ONLY app_category_app
    ADD CONSTRAINT app_category_app_app_id_fkey
    FOREIGN KEY (app_id)
    REFERENCES apps(id);

--
-- Name: property_group_task_id_fkey; Type: FK CONSTRAINT;
-- Schema: public; Owner: de
--
ALTER TABLE ONLY property_group
    ADD CONSTRAINT property_group_task_id_fkey
    FOREIGN KEY (task_id)
    REFERENCES tasks(id);

--
-- Name: app_integration_data_id_fk; Type: FK CONSTRAINT; Schema:
-- public; Owner: de
--
ALTER TABLE ONLY apps
    ADD CONSTRAINT app_integration_data_id_fk
    FOREIGN KEY (integration_data_id)
    REFERENCES integration_data(id);

--
-- Name: workflow_io_maps_app_id_fkey;
-- Type: FK CONSTRAINT; Schema: public; Owner: de
--
ALTER TABLE ONLY workflow_io_maps
    ADD CONSTRAINT workflow_io_maps_app_id_fkey
    FOREIGN KEY (app_id)
    REFERENCES apps(id);

--
-- Name: app_references_app_id_fkey;
-- Type: FK CONSTRAINT; Schema: public; Owner: de
--
ALTER TABLE ONLY app_references
    ADD CONSTRAINT app_references_app_id_fkey
    FOREIGN KEY (app_id)
    REFERENCES apps(id);

--
-- Name: app_steps_task_id_fkey; Type: FK
-- CONSTRAINT; Schema: public; Owner: de
--
ALTER TABLE ONLY app_steps
    ADD CONSTRAINT app_steps_task_id_fkey
    FOREIGN KEY (task_id)
    REFERENCES tasks(id);

--
-- Name: app_steps_app_id_fkey; Type: FK
-- CONSTRAINT; Schema: public; Owner: de
--
ALTER TABLE ONLY app_steps
    ADD CONSTRAINT app_steps_app_id_fkey
    FOREIGN KEY (app_id)
    REFERENCES apps(id);

--
-- Name: rule_property_id_fkey; Type: FK CONSTRAINT; Schema:
-- public; Owner: de
--
ALTER TABLE ONLY rule
    ADD CONSTRAINT rule_property_id_fkey
    FOREIGN KEY (property_id)
    REFERENCES property(hid);
CREATE INDEX rule_property_id_idx ON rule(property_id);

--
-- Name: workspace_root_category_id_fkey; Type: FK CONSTRAINT; Schema:
-- public; Owner: de
--
ALTER TABLE ONLY workspace
    ADD CONSTRAINT workspace_root_category_id_fkey
    FOREIGN KEY (root_category_id)
    REFERENCES app_categories(id);

--
-- Name: workspace_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: de
--
ALTER TABLE ONLY workspace
    ADD CONSTRAINT workspace_users_fk
    FOREIGN KEY (user_id)
    REFERENCES users(id);

--
-- Name: genome_reference_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
--
ALTER TABLE ONLY genome_reference
    ADD CONSTRAINT genome_reference_pkey
    PRIMARY KEY (id);

--
-- Name: genome_reference_created_by_fkey; Type: CONSTRAINT; Schema:
-- public; Owner: de;
--
ALTER TABLE ONLY genome_reference
    ADD CONSTRAINT genome_reference_created_by_fkey
    FOREIGN KEY (created_by)
    REFERENCES users(id);
--
-- Name: genome_reference_last_modified_by_fkey; Type: CONSTRAINT; Schema:
-- public; Owner: de;
--
ALTER TABLE ONLY genome_reference
    ADD CONSTRAINT genome_reference_last_modified_by_fkey
    FOREIGN KEY (last_modified_by)
    REFERENCES users(id);

--
-- The primary key for the collaborators table.
--
ALTER TABLE ONLY collaborators
    ADD CONSTRAINT collaborators_pkey
    PRIMARY KEY (id);

--
-- Foreign key constraints for the user field of the collaborators table.
--
ALTER TABLE ONLY collaborators
    ADD CONSTRAINT collaborators_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id);
--
-- Foreign key constraints for the collaborator_id field of the collaborators
-- table.
--
ALTER TABLE ONLY collaborators
    ADD CONSTRAINT collaborators_collaborator_id_fkey
    FOREIGN KEY (collaborator_id)
    REFERENCES users(id);

--
-- Add a uniqueness constraint for the integration_data table.
--
ALTER TABLE ONLY integration_data
    ADD CONSTRAINT integration_data_name_email_unique
    UNIQUE (integrator_name, integrator_email);

--
-- The primary key for the data_source table.
--
ALTER TABLE ONLY data_source
    ADD CONSTRAINT data_source_pkey
    PRIMARY KEY (id);

--
-- Each data source must have a unique name.
--
ALTER TABLE ONLY data_source
    ADD CONSTRAINT data_source_unique_name
    UNIQUE (name);

--
-- Foreign key constraint for the data_source field of the dataobjects table.
--
ALTER TABLE ONLY dataobjects
    ADD CONSTRAINT dataobjects_data_source_id_fkey
    FOREIGN KEY (data_source_id)
    REFERENCES data_source(id);

--
-- Foreign key constraint for the tool_type_id field of the deployed_components
-- table.
--
ALTER TABLE ONLY deployed_components
    ADD CONSTRAINT deployed_components_tool_type_id_fkey
    FOREIGN KEY (tool_type_id)
    REFERENCES tool_types(id);

--
-- Foreign key constraint for the tool_type_id field of the
-- tool_type_property_type table.
--
ALTER TABLE ONLY tool_type_property_type
    ADD CONSTRAINT tool_type_property_type_tool_type_id_fkey
    FOREIGN KEY (tool_type_id)
    REFERENCES tool_types(id);

--
-- Foreign key constraint for the property_type_id field of the
-- tool_type_property_type table.
--
ALTER TABLE ONLY tool_type_property_type
    ADD CONSTRAINT tool_type_property_type_property_type_fkey
    FOREIGN KEY (property_type_id)
    REFERENCES property_type(hid);

--
-- Foreign key constraint for the requestor_id field of the
-- tool_requests table.
--
ALTER TABLE ONLY tool_requests
    ADD CONSTRAINT tool_requests_requestor_id_fkey
    FOREIGN KEY (requestor_id)
    REFERENCES users(id);

--
-- Foreign key constraint for the deployed_component_id field of the
-- tool_requests table.
--
ALTER TABLE ONLY tool_requests
    ADD CONSTRAINT tool_requests_deployed_component_id_fkey
    FOREIGN KEY (deployed_component_id)
    REFERENCES deployed_components(hid);

--
-- Foreign key constraint for the updater_id field of the tool_request_statuses
-- table.
--
ALTER TABLE ONLY tool_request_statuses
    ADD CONSTRAINT tool_request_statuses_updater_id_fkey
    FOREIGN KEY (updater_id)
    REFERENCES users(id);

--
-- Foreign key constraint for the user_id field of the logins table.
--
ALTER TABLE ONLY logins
    ADD CONSTRAINT logins_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id);

--
-- Foreign key constraint for the user_id field of the jobs table.
--
ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id);