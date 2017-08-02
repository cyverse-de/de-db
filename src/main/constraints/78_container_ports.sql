SET search_path = public, pg_catalog;

--
-- Foreign key constraints on the container_ports table against the
-- container_settings table.
--
ALTER TABLE ONLY container_ports
    ADD CONSTRAINT container_ports_container_settings_id_fkey
    FOREIGN KEY(container_settings_id)
    REFERENCES container_settings(id) ON DELETE CASCADE; 
