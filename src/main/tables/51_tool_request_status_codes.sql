SET search_path = public, pg_catalog;

--
-- A table defining the set of available tool request status codes.
--
CREATE TABLE tool_request_status_codes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(64) NOT NULL,
    description TEXT NOT NULL,
    email_template VARCHAR(64)
);

--
-- All tool request status code names should be unique.
--
CREATE UNIQUE INDEX tool_request_status_codes_name_index
    on tool_request_status_codes (name);

