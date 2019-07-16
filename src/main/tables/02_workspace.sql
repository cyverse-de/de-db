SET search_path = public, pg_catalog;

--
-- workspace table
--
CREATE TABLE workspace (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    root_category_id uuid,
    is_public boolean DEFAULT false,
    user_id uuid NOT NULL
);

