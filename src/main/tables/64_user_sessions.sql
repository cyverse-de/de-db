SET search_path = public, pg_catalog;

---
--- A table containing user sessions
---
CREATE TABLE user_sessions (
    id UUID DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    session TEXT NOT NULL
);

