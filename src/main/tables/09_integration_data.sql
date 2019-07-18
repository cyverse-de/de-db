SET search_path = public, pg_catalog;

--
-- integration_data table
--
CREATE TABLE integration_data (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    integrator_name character varying(255) NOT NULL CHECK (integrator_name ~ '\S'),
    integrator_email character varying(255) NOT NULL CHECK (integrator_email ~ '\S'),
    user_id uuid
);

CREATE INDEX ON integration_data (user_id);
