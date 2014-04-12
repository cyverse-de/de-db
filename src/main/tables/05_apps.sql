SET search_path = public, pg_catalog;

--
-- apps table
--
CREATE TABLE apps (
    id character varying(255) NOT NULL,
    name character varying(255),
    description character varying(255),
    workspace_id bigint NOT NULL,
    type character varying(255),
    deleted boolean,
    integration_data_id bigint NOT NULL,
    wikiurl character varying(1024),
    integration_date timestamp without time zone,
    disabled boolean DEFAULT false NOT NULL,
    edited_date timestamp without time zone
);