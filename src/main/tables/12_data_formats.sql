SET search_path = public, pg_catalog;

--
-- A table for data object file formats.
--
CREATE TABLE data_formats (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    name character varying(64) NOT NULL,
    label character varying(255),
    display_order integer DEFAULT 999
);

