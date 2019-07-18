SET search_path = public, pg_catalog;

--
-- app_references table
--
CREATE TABLE app_references (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    app_id uuid NOT NULL,
    reference_text text NOT NULL
);

CREATE INDEX ON app_references (app_id);

