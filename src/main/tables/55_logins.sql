SET search_path = public, pg_catalog;

--
-- A record of each login.
--
CREATE TABLE logins (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid NOT NULL,
    ip_address varchar(15) NOT NULL,
    user_agent text,
    login_time timestamp NOT NULL DEFAULT now(),
    logout_time timestamp
);

CREATE INDEX ON logins (user_id);
