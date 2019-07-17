SET search_path = public, pg_catalog;

-- Contains additional information to be added to htcondor jobs for special cases.

CREATE TABLE apps_htcondor_extra (
  -- primary key
  apps_id uuid PRIMARY KEY,
  extra_requirements text NOT NULL
);
