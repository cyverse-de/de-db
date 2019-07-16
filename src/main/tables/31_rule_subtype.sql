SET search_path = public, pg_catalog;

--
-- A table to store rule subtypes.
--
CREATE TABLE rule_subtype (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    name character varying(40) NOT NULL,
    description text NOT NULL
);

