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
    notification_type STRING check (
        notification_type='apps' or
        notification_type='tool_request' or
        notification_type='team' or
        notification_type='data' or
        notification_type='analysis' or
        notification_type='tools' or
        notification_type='permanent_id_request'
    ) NOT NULL
);
