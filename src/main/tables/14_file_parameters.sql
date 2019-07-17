SET search_path = public, pg_catalog;

--
-- file_parameters table
--
CREATE TABLE file_parameters (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    parameter_id uuid,
    retain boolean DEFAULT false,
    is_implicit boolean DEFAULT false,
    repeat_option_flag boolean DEFAULT true,
    info_type uuid NOT NULL,
    data_format uuid NOT NULL,
    data_source_id uuid NOT NULL
);
