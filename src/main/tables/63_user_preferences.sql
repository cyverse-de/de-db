SET search_path = public, pg_catalog;

--
-- A table containing user preferences.
--
CREATE TABLE user_preferences (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL,
  preferences TEXT NOT NULL
);

