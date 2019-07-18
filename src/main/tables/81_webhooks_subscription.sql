SET search_path = public, pg_catalog;

--
-- webhooks_subscription table
--
CREATE TABLE webhooks_subscription (
  webhook_id uuid NOT NULL,
  topic_id uuid NOT NULL,

  PRIMARY KEY (webhook_id, topic_id)
);

CREATE INDEX ON webhooks_subscription (topic_id);
CREATE INDEX ON webhooks_subscription (webhook_id);


