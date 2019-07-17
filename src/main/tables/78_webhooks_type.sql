SET search_path = public, pg_catalog;

--
-- webhooks type table
--
CREATE TABLE webhooks_type (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  type varchar(1024) NOT NULL,
  template text NOT NULL
);
