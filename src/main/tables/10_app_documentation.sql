SET search_path = public, pg_catalog;

--
-- app_documentation table
--
CREATE TABLE app_documentation (
  app_id UUID PRIMARY KEY,
  value TEXT,
  created_on timestamp DEFAULT now() NOT NULL,
  modified_on timestamp DEFAULT now() NOT NULL,
  created_by UUID NOT NULL,
  modified_by UUID NOT NULL
);

CREATE INDEX ON app_documentation (created_by);
CREATE INDEX ON app_documentation (modified_by);
