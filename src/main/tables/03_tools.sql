SET search_path = public, pg_catalog;

--
-- tools table
--
CREATE TABLE tools (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    name character varying(255) NOT NULL,
    location character varying(255),
    tool_type_id uuid NOT NULL,
    description text,
    version character varying(255) NOT NULL,
    attribution text,
    integration_data_id uuid NOT NULL,
    container_images_id uuid,
    time_limit_seconds integer NOT NULL DEFAULT 0,
    restricted boolean NOT NULL DEFAULT FALSE,
    interactive boolean NOT NULL DEFAULT FALSE
);

CREATE INDEX ON tools (tool_type_id);
CREATE INDEX ON tools (integration_data_id);
CREATE INDEX ON tools (container_images_id);
