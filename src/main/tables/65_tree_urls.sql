SET search_path = public, pg_catalog;

---
--- A table of tree urls associated with files.
---
CREATE TABLE tree_urls (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    sha1 VARCHAR(40) UNIQUE NOT NULL,
    tree_urls TEXT NOT NULL
);

---
--- Creates an index on the id and sha1 columns
---
CREATE INDEX tree_urls_id
ON tree_urls(id);

CREATE INDEX tree_urls_sha1
ON tree_urls(sha1);
