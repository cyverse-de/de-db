SET search_path = public, pg_catalog;

--
-- validation_rule_arguments table
--
CREATE TABLE validation_rule_arguments (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    rule_id uuid NOT NULL,
    ordering integer DEFAULT 0,
    argument_value text
);

CREATE INDEX ON validation_rule_arguments (rule_id);

