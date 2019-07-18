SET search_path = public, pg_catalog;

--
-- validation_rule_argument_definitions table
--
CREATE TABLE validation_rule_argument_definitions (
    id uuid PRIMARY KEY default gen_random_uuid(),
    rule_type_id uuid NOT NULL,
    argument_index integer NOT NULL,
    name character varying(64) NOT NULL,
    description text NOT NULL,
    argument_type_id uuid NOT NULL
);

CREATE INDEX ON validation_rule_argument_definitions (rule_type_id);
CREATE INDEX ON validation_rule_argument_definitions (argument_type_id);
