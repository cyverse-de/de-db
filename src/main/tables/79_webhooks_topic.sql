SET search_path = public, pg_catalog;

--
-- webhooks topic table
--
CREATE TABLE webhooks_topic (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  topic varchar(1024) NOT NULL
);
