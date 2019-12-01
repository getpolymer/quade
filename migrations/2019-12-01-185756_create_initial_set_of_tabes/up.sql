  CREATE TABLE users (
    id UUID PRIMARY KEY NOT NULL,
    created_at TIMESTAMP NOT NULL,
    last_updated_at TIMESTAMP NOT NULL,
    name VARCHAR(256) NOT NULL,
    username VARCHAR(64) NOT NULL,
    password TEXT NOT NULL,
    email VARCHAR(256) NOT NULL,
    is_active BOOLEAN NOT NULL,
    api_key TEXT NOT NULL
  );

  CREATE TABLE paste (
    id UUID PRIMARY KEY NOT NULL,
    user_id UUID NOT NULL,
    created_at TIMESTAMP NOT NULL,
    expiry_timestamp TIMESTAMP NOT NULL,
    title TEXT,
    language TEXT,
    password TEXT,
    contents TEXT NOT NULL ,
    views INTEGER NOT NULL,
    is_public BOOLEAN NOT NULL,
    deletion_hash TEXT NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
  );

  CREATE TABLE attachment (
    id UUID PRIMARY KEY NOT NULL,
    paste_id UUID NOT NULL,
    file_name TEXT,
    file_hash TEXT,
    file_size INTEGER,
    mime_type TEXT,

    FOREIGN KEY (paste_id) REFERENCES paste(id) ON DELETE CASCADE
  );
