SET search_path = public, pg_catalog;

--
-- parameters table
--
CREATE TABLE parameters (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    parameter_group_id uuid NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    label text,
    is_visible boolean DEFAULT true,
    ordering integer DEFAULT 0,
    display_order int NOT NULL DEFAULT 0,
    parameter_type uuid NOT NULL,
    required boolean DEFAULT false,
    omit_if_blank boolean DEFAULT true
);

CREATE INDEX ON parameters (parameter_group_id);
CREATE INDEX ON parameters (parameter_type);

