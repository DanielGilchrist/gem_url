# typed: strict
# frozen_string_literal: true

DB = SQLite3::Database.new("db/urls.db")
DB.results_as_hash = true

DB.execute <<-SQL
  CREATE TABLE IF NOT EXISTS urls (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    original_url TEXT NOT NULL,
    short_code TEXT NOT NULL UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
  )
SQL
