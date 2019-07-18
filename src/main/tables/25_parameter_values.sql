SET search_path = public, pg_catalog;

--
-- A table for storing default parameter values and value options (list items).
--
CREATE TABLE parameter_values (
    id uuid PRIMARY KEY DEFAULT (gen_random_uuid()),
    parameter_id uuid NOT NULL,
    parent_id uuid,
    is_default boolean NOT NULL DEFAULT false,
    display_order int NOT NULL DEFAULT 0,
    name character varying(255),
    value character varying(255),
    description text,
    label text
);

CREATE INDEX ON parameter_values (parent_id);
CREATE INDEX ON parameter_values (parameter_id);

