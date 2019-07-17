SET search_path = public, pg_catalog;

--
-- app_categories table
--
CREATE TABLE app_categories (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    name character varying(255),
    description text,
    workspace_id uuid NOT NULL
);

