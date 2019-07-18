SET search_path = public, pg_catalog;

---
--- A table for storing authorization request state information.
---
CREATE TABLE authorization_requests (
    id UUID PRIMARY KEY NOT NULL,
    user_id UUID UNIQUE NOT NULL,
    state_info TEXT NOT NULL
);

CREATE INDEX ON authorization_requests (user_id);
