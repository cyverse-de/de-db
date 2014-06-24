(ns facepalm.c200-2014042401
  (:use [clojure.java.io :only [file reader]]
        [kameleon.sql-reader :only [sql-statements]]
        [korma.core]
        [korma.db :only [with-db]])
  (:require [clojure.tools.logging :as log]
            [facepalm.core :as migrator]
            [me.raynes.fs :as fs])
  (:import [java.util UUID]))

;; TODO template_input, template_output, validator conversions.

(def ^:private version
  "The destination database version."
  "2.0.0:20140424.01")

(defn exec-sql-statement
  "A wrapper around korma.core/exec-raw that logs the statement that is being
   executed if debugging is enabled."
  [& statements]
  (let [statement (clojure.string/join " " statements)]
    (log/debug "executing SQL statement:" statement)
    (exec-raw statement)))

(defn- load-sql-file
  "Loads a single SQL file into the database."
  [sql-file-path]
  (let [sql-file (fs/file sql-file-path)]
    (println (str "\t\t Loading " sql-file-path "..."))
    (with-open [rdr (reader sql-file)]
      (dorun (map exec-sql-statement (sql-statements rdr))))))

(defn- add-uuid-extension
  []
  (println "\t* adding uuid-ossp extension...")
  (with-db @migrator/admin-db-spec
     (load-sql-file "extensions/uuid.sql")))

;; Drop constraints
(defn- drop-all-constraints
  []
  (println "\t* dropping constraints...")
  (exec-sql-statement "
    DO $$DECLARE r record;
    BEGIN
      FOR r IN
        SELECT * FROM pg_constraint
        INNER JOIN pg_class ON conrelid=pg_class.oid
        INNER JOIN pg_namespace ON pg_namespace.oid=pg_class.relnamespace
        ORDER BY CASE WHEN contype='f' THEN 0 ELSE 1 END,contype,nspname,relname,conname
      LOOP
        EXECUTE 'ALTER TABLE ' || quote_ident(r.nspname) || '.' || quote_ident(r.relname) ||
                ' DROP CONSTRAINT ' || quote_ident(r.conname) || ';';
      END LOOP;
    END$$;"))

;; Dropped sequences
;; template_group_id_seq
;; workspace_id_seq
;; deployed_component_id_seq
;; template_id_seq
;; transformation_activity_id_seq
;; transformation_steps_id_seq
;; transformations_id_seq
;; integration_data_id_seq
;; ratings_id_seq
;; data_formats_id_seq
;; dataobjects_id_seq
;; deployed_component_data_files_id_seq
;; info_type_id_seq
;; input_output_mapping_id_seq
;; multiplicity_id_seq
;; notification_id_seq
;; notification_set_id_seq
;; property_id_seq
;; property_group_id_seq
;; property_type_id_seq
;; users_id_seq
;; rule_id_seq
;; rule_subtype_id_seq
;; rule_type_id_seq
;; transformation_activity_references_id_seq
;; transformation_values_id_seq
;; validator_id_seq
;; value_type_id_seq
;; version_id_seq;
;; genome_ref_id_seq;
;; collaborators_id_seq;
;; data_source_id_seq;
;; tool_types_id_seq
;; tool_architectures_id_seq
;; tool_requests_id_seq
;; tool_request_statuses_id_seq
;; tool_request_status_codes_id_seq
;; job_types_id_seq

(defn- drop-views
  []
  (println "\t* dropping old views...")
  (load-sql-file "conversions/c200_2014042401/drop_views.sql"))

;; Rename or add new tables and columns.
(defn- run-table-conversions
  "Loads and runs SQL files containing table and column conversions."
  []
  (println "\t* renaming obsolete tables")
  (load-sql-file "conversions/c200_2014042401/tables/rename_obsolete_tables.sql")
  (println "\t* updating the template_group table to app_categories")
  (load-sql-file "conversions/c200_2014042401/tables/01_app_categories.sql")
  (println "\t* updating the workspace table")
  (load-sql-file "conversions/c200_2014042401/tables/02_workspace.sql")
  (println "\t* updating the deployed_components table to tools")
  (load-sql-file "conversions/c200_2014042401/tables/03_tools.sql")
  (println "\t* updating the template table to tasks")
  (load-sql-file "conversions/c200_2014042401/tables/04_tasks.sql")
  (println "\t* updating the transformation_activity table to apps")
  (load-sql-file "conversions/c200_2014042401/tables/05_apps.sql")
  (println "\t* updating the transformation_task_steps table to app_steps")
  (load-sql-file "conversions/c200_2014042401/tables/07_app_steps.sql")
  (println "\t* updating the integration_data table")
  (load-sql-file "conversions/c200_2014042401/tables/09_integration_data.sql")
  (println "\t* updating the ratings table")
  (load-sql-file "conversions/c200_2014042401/tables/10_ratings.sql")
  (println "\t* updating the template_group_template table to app_category_app")
  (load-sql-file "conversions/c200_2014042401/tables/11_app_category_app.sql")
  (println "\t* updating the data_formats table")
  (load-sql-file "conversions/c200_2014042401/tables/12_data_formats.sql")
  (println "\t* updating the input_output_mapping table to workflow_io_maps")
  (load-sql-file "conversions/c200_2014042401/tables/13_workflow_io_maps.sql")
  (println "\t* updating the dataobject_mapping table to input_output_mapping")
  (load-sql-file "conversions/c200_2014042401/tables/18_input_output_mapping.sql")
  (println "\t* updating the dataobjects table to file_parameters")
  (load-sql-file "conversions/c200_2014042401/tables/14_file_parameters.sql")
  (println "\t* updating the deployed_component_data_files table to tool_test_data_files")
  (load-sql-file "conversions/c200_2014042401/tables/15_tool_test_data_files.sql")
  (println "\t* updating the info_type table")
  (load-sql-file "conversions/c200_2014042401/tables/17_info_type.sql")
  (println "\t* updating the multiplicity table")
  (load-sql-file "conversions/c200_2014042401/tables/19_multiplicity.sql")
  (println "\t* updating the property table to parameters")
  (load-sql-file "conversions/c200_2014042401/tables/24_parameters.sql")
  (println "\t* updating the property_group table to parameter_groups")
  (load-sql-file "conversions/c200_2014042401/tables/25_parameter_groups.sql")
  (println "\t* adding the parameter_values table")
  (load-sql-file "tables/25_parameter_values.sql")
  (println "\t* updating the property_type table to parameter_types")
  (load-sql-file "conversions/c200_2014042401/tables/27_parameter_types.sql")
  (println "\t* updating the users table")
  (load-sql-file "conversions/c200_2014042401/tables/28_users.sql")
  (println "\t* updating the rule table to validation_rules")
  (load-sql-file "conversions/c200_2014042401/tables/29_validation_rules.sql")
  (println "\t* updating the rule_argument table to validation_rule_arguments")
  (load-sql-file "conversions/c200_2014042401/tables/30_validation_rule_arguments.sql")
  (println "\t* updating the rule_subtype table")
  (load-sql-file "conversions/c200_2014042401/tables/31_rule_subtype.sql")
  (println "\t* updating the rule_type table")
  (load-sql-file "conversions/c200_2014042401/tables/32_rule_type.sql")
  (println "\t* updating the rule_type_value_type table")
  (load-sql-file "conversions/c200_2014042401/tables/33_rule_type_value_type.sql")
  (println "\t* updating the suggested_groups table")
  (load-sql-file "conversions/c200_2014042401/tables/34_suggested_groups.sql")
  (println "\t* updating the template_group_group table to app_category_group")
  (load-sql-file "conversions/c200_2014042401/tables/35_app_category_group.sql")
  (println "\t* updating the transformation_activity_references table to app_references")
  (load-sql-file "conversions/c200_2014042401/tables/40_app_references.sql")
  (println "\t* updating the value_type table")
  (load-sql-file "conversions/c200_2014042401/tables/44_value_type.sql")
  (println "\t* updating the version table")
  (load-sql-file "conversions/c200_2014042401/tables/45_version.sql")
  (println "\t* updating the genome_reference table")
  (load-sql-file "conversions/c200_2014042401/tables/46_genome_reference.sql")
  (println "\t* updating the collaborators table")
  (load-sql-file "conversions/c200_2014042401/tables/47_collaborators.sql")
  (println "\t* updating the data_source table")
  (load-sql-file "conversions/c200_2014042401/tables/48_data_source.sql")
  (println "\t* updating the tool_types table")
  (load-sql-file "conversions/c200_2014042401/tables/49_tool_types.sql")
  (println "\t* updating the tool_type_property_type table to tool_type_parameter_type")
  (load-sql-file "conversions/c200_2014042401/tables/50_tool_type_parameter_type.sql")
  (println "\t* updating the tool_request_status_codes table")
  (load-sql-file "conversions/c200_2014042401/tables/51_tool_request_status_codes.sql")
  (println "\t* updating the tool_architectures table")
  (load-sql-file "conversions/c200_2014042401/tables/52_tool_architectures.sql")
  (println "\t* updating the tool_requests table")
  (load-sql-file "conversions/c200_2014042401/tables/53_tool_requests.sql")
  (println "\t* updating the tool_request_statuses table")
  (load-sql-file "conversions/c200_2014042401/tables/54_tool_request_statuses.sql")
  (println "\t* updating the logins table")
  (load-sql-file "conversions/c200_2014042401/tables/55_logins.sql")
  (println "\t* updating the job_types table")
  (load-sql-file "conversions/c200_2014042401/tables/56_job_types.sql")
  (println "\t* updating the jobs table")
  (load-sql-file "conversions/c200_2014042401/tables/57_jobs.sql")
  (println "\t* updating the metadata_value_types table")
  (load-sql-file "conversions/c200_2014042401/tables/58_metadata_value_types.sql")
  (println "\t* updating the metadata_templates table")
  (load-sql-file "conversions/c200_2014042401/tables/59_metadata_templates.sql")
  (println "\t* updating the metadata_attributes table")
  (load-sql-file "conversions/c200_2014042401/tables/60_metadata_attributes.sql")
  (println "\t* updating the user_preferences table")
  (load-sql-file "conversions/c200_2014042401/tables/63_user_preferences.sql")
  (println "\t* updating the user_sessions table")
  (load-sql-file "conversions/c200_2014042401/tables/64_user_sessions.sql")
  (println "\t* updating the tree_urls table")
  (load-sql-file "conversions/c200_2014042401/tables/65_tree_urls.sql")
  (println "\t* updating the user_saved_searches table")
  (load-sql-file "conversions/c200_2014042401/tables/66_user_saved_searches.sql"))


;; Update new UUID columns.
(defn- run-uuid-conversions
  []
  (println "\t* updating app_categories uuid foreign keys...")
  (load-sql-file "conversions/c200_2014042401/uuids/01_app_categories.sql")
  (println "\t* updating workspace uuid foreign keys...")
  (load-sql-file "conversions/c200_2014042401/uuids/02_workspace.sql")
  (println "\t* updating tools uuid foreign keys...")
  (load-sql-file "conversions/c200_2014042401/uuids/03_tools.sql")
  (println "\t* updating tasks uuid foreign keys...")
  (load-sql-file "conversions/c200_2014042401/uuids/04_tasks.sql")
  (println "\t* updating apps uuid foreign keys...")
  (load-sql-file "conversions/c200_2014042401/uuids/05_apps.sql")
  (println "\t* updating app_steps uuid foreign keys...")
  (load-sql-file "conversions/c200_2014042401/uuids/07_app_steps.sql")
  (println "\t* updating integration_data uuid foreign keys...")
  (load-sql-file "conversions/c200_2014042401/uuids/09_integration_data.sql")
  (println "\t* updating data_formats uuid foreign keys...")
  (load-sql-file "conversions/c200_2014042401/uuids/12_data_formats.sql")
  (println "\t* updating workflow_io_maps uuid foreign keys...")
  (load-sql-file "conversions/c200_2014042401/uuids/13_workflow_io_maps.sql")
  (println "\t* updating file_parameters uuid foreign keys...")
  (load-sql-file "conversions/c200_2014042401/uuids/14_file_parameters.sql")
  (println "\t* updating info_type uuid foreign keys...")
  (load-sql-file "conversions/c200_2014042401/uuids/17_info_type.sql")
  (println "\t* updating multiplicity uuid foreign keys...")
  (load-sql-file "conversions/c200_2014042401/uuids/19_multiplicity.sql")
  (println "\t* updating parameters uuid foreign keys (this might take a minute or 2)...")
  (load-sql-file "conversions/c200_2014042401/uuids/24_parameters.sql")
  (println "\t* updating parameter_groups uuid foreign keys...")
  (load-sql-file "conversions/c200_2014042401/uuids/25_parameter_groups.sql")
  (println "\t* updating parameter_types uuid foreign keys...")
  (load-sql-file "conversions/c200_2014042401/uuids/27_parameter_types.sql")
  (println "\t* updating users uuid foreign keys...")
  (load-sql-file "conversions/c200_2014042401/uuids/28_users.sql")
  (println "\t* updating validation_rules uuid foreign keys...")
  (load-sql-file "conversions/c200_2014042401/uuids/29_validation_rules.sql")
  (println "\t* updating rule_subtype uuid foreign keys...")
  (load-sql-file "conversions/c200_2014042401/uuids/31_rule_subtype.sql")
  (println "\t* updating rule_type uuid foreign keys...")
  (load-sql-file "conversions/c200_2014042401/uuids/32_rule_type.sql")
  (println "\t* updating value_type uuid foreign keys...")
  (load-sql-file "conversions/c200_2014042401/uuids/44_value_type.sql")
  (println "\t* updating data_source uuid foreign keys...")
  (load-sql-file "conversions/c200_2014042401/uuids/48_data_source.sql")
  (println "\t* updating tool_types uuid foreign keys...")
  (load-sql-file "conversions/c200_2014042401/uuids/49_tool_types.sql")
  (println "\t* updating tool_architectures uuid foreign keys...")
  (load-sql-file "conversions/c200_2014042401/uuids/52_tool_architectures.sql")
  (println "\t* updating tool_requests uuid foreign keys...")
  (load-sql-file "conversions/c200_2014042401/uuids/53_tool_requests.sql")
  (println "\t* updating job_types uuid foreign keys...")
  (load-sql-file "conversions/c200_2014042401/uuids/56_job_types.sql"))

(defn- drop-obsolete-tables
  []
  (println "\t* dropping empty obsolete tables")
  (load-sql-file "conversions/c200_2014042401/tables/drop_empty_obsolete_tables.sql"))

(defn- re-add-constraints
  []
  (println "\t* re-adding constraints")
  (load-sql-file "tables/99_constraints.sql"))

(defn- add-new-views
  []
  (println "\t* adding app_category_listing view...")
  (load-sql-file "views/01_app_category_listing.sql")
  (println "\t* adding app_job_types view...")
  (load-sql-file "views/02_app_job_types.sql")
  (println "\t* adding app_listing view...")
  (load-sql-file "views/03_app_listing.sql")
  (println "\t* adding tool_listing view...")
  (load-sql-file "views/04_tool_listing.sql")
  (println "\t* adding rating_listing view...")
  (load-sql-file "views/05_rating_listing.sql"))

(defn convert
  "Performs the database conversion."
  []
  (println "Performing the conversion for" version)
  (add-uuid-extension)
  (drop-views)
  (run-table-conversions)
  (run-uuid-conversions)
  (drop-all-constraints)
  (drop-obsolete-tables)
  (re-add-constraints)
  (add-new-views))