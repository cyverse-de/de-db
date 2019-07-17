--
-- Taken from https://github.com/voxpelli/node-connect-pg-simple/blob/HEAD/table.sql
--
CREATE TABLE "session" (
	"sid" varchar PRIMARY KEY,
	"sess" json NOT NULL,
	"expire" timestamp NOT NULL
);
