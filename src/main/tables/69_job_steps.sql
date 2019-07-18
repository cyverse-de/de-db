SET search_path = public, pg_catalog;

--
-- Records individual steps of jobs that the user has submitted.
--
CREATE TABLE job_steps (
    job_id uuid NOT NULL,
    step_number integer NOT NULL,
    external_id character varying(64),
    start_date timestamp,
    end_date timestamp,
    status character varying(64) NOT NULL,
    job_type_id uuid NOT NULL,
    app_step_number integer NOT NULL,
    
    PRIMARY KEY (job_id, step_number)
);

CREATE INDEX ON job_steps (external_id);
CREATE INDEX ON job_steps (job_type_id);
