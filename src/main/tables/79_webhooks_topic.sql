SET search_path = public, pg_catalog;

--
-- webhooks topic table
--
CREATE TABLE webhooks_topic (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  topic varchar(1024) NOT NULL
);
