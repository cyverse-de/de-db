SET search_path = public, pg_catalog;

--
-- validation_rule_argument_types table
--
CREATE TABLE validation_rule_argument_types (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    name character varying(64) NOT NULL
);
