SET search_path = public, pg_catalog;

--
-- app_steps table
--
CREATE TABLE app_steps (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    app_id uuid NOT NULL,
    task_id uuid NOT NULL,
    step integer NOT NULL
);

