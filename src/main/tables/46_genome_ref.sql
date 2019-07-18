SET search_path = public, pg_catalog;

--
-- genome_reference
--
CREATE TABLE genome_reference (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    name varchar(512) NOT NULL,
    path varchar(1024) NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    created_by uuid NOT NULL,
    created_on timestamp DEFAULT now() NOT NULL,
    last_modified_by uuid NOT NULL,
    last_modified_on timestamp DEFAULT now() NOT NULL
);

CREATE INDEX ON genome_reference (created_by);
CREATE INDEX ON genome_reference (last_modified_by);

