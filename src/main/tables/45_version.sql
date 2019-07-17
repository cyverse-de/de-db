SET search_path = public, pg_catalog;

--
-- A table to database versions along with the date they were applied.
--
CREATE TABLE version (
    version character varying(20) PRIMARY KEY,
    applied timestamp DEFAULT now()
);
