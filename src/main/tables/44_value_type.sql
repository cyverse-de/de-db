SET search_path = public, pg_catalog;

--
-- A table to store value types associated with various parameter types.
--
CREATE TABLE value_type (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    name character varying(40) NOT NULL,
    description text NOT NULL
);

