SET search_path = public, pg_catalog;

---
--- A table for storing a user's saved searches
---
CREATE TABLE user_saved_searches (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    saved_searches TEXT NOT NULL
);

CREATE INDEX ON user_saved_searches (user_id);

