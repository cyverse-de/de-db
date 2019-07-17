SET search_path = public, pg_catalog;

--
-- A table listing the types of tools that are currently available.
--
CREATE TABLE tool_types (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    name varchar(50) UNIQUE NOT NULL,
    label varchar(128) NOT NULL,
    description text,
    hidden boolean NOT NULL DEFAULT FALSE,
    notification_type_id uuid NOT NULL
);
