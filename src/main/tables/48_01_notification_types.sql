SET search_path = public, pg_catalog;

--
-- The available notification types.
--
CREATE TABLE notification_types (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    name varchar(64) UNIQUE NOT NULL
);