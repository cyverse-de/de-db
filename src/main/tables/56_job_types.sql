SET search_path = public, pg_catalog;

--
-- Stores information about the types of jobs that the DE can submit.
--
CREATE TABLE job_types (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    name character varying(36) NOT NULL,
    system_id character varying(36) NOT NULL
);
