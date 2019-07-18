SET search_path = public, pg_catalog;

--
-- validation_rules table
--
CREATE TABLE validation_rules (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    parameter_id uuid NOT NULL,
    rule_type uuid NOT NULL
);

CREATE INDEX ON validation_rules (parameter_id);

