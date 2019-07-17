SET search_path = public, pg_catalog;

--
-- ratings table
--
CREATE TABLE ratings (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid NOT NULL,
    app_id uuid NOT NULL,
    rating integer NOT NULL,
    comment_id bigint
);

