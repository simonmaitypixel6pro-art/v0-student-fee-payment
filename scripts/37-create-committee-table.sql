-- Create committee users table for managing committee members
CREATE TABLE IF NOT EXISTS committee (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create index for faster lookups
CREATE INDEX IF NOT EXISTS idx_committee_username ON committee(username);
CREATE INDEX IF NOT EXISTS idx_committee_email ON committee(email);
CREATE INDEX IF NOT EXISTS idx_committee_is_active ON committee(is_active);

-- Add comment for documentation
COMMENT ON TABLE committee IS 'Committee members who have administrative access to manage various institutional functions';
COMMENT ON COLUMN committee.id IS 'Unique identifier for committee member';
COMMENT ON COLUMN committee.name IS 'Full name of committee member';
COMMENT ON COLUMN committee.email IS 'Unique email address';
COMMENT ON COLUMN committee.username IS 'Unique username for login';
COMMENT ON COLUMN committee.password IS 'Hashed password for authentication';
COMMENT ON COLUMN committee.is_active IS 'Flag to activate/deactivate committee member access';
COMMENT ON COLUMN committee.created_at IS 'Timestamp when the record was created';
COMMENT ON COLUMN committee.updated_at IS 'Timestamp when the record was last updated';
