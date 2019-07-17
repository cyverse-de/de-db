SET search_path = public, pg_catalog;

--
-- webhooks table
--
CREATE TABLE webhooks (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL,
  url text NOT NULL,
  type_id uuid NOT NULL
);
