SET search_path = public, pg_catalog;

--
-- Contains the details about the containers ports.
--
CREATE TABLE container_ports (
  -- primary key
  id uuid UNIQUE NOT NULL DEFAULT uuid_generate_v1(),

  -- foreign key into the container_settings table
  container_settings_id uuid NOT NULL,

  -- The port on the host that should be forwarded to the container.
  host_port integer NOT NULL,

  -- The container exposed port.
  container_port integer NOT NULL,

  unique(container_settings_id, host_port, container_port)
)
