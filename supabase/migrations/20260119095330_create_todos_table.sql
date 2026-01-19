/*
  # Create todos table

  1. New Tables
    - `todos`
      - `id` (uuid, primary key) - Unique identifier for each todo
      - `text` (text) - The todo item text
      - `completed` (boolean) - Whether the todo is completed
      - `created_at` (timestamptz) - Timestamp when todo was created
  
  2. Security
    - Enable RLS on `todos` table
    - Add policy for anyone to read todos (simple app, no auth)
    - Add policy for anyone to insert todos
    - Add policy for anyone to update todos
    - Add policy for anyone to delete todos
*/

CREATE TABLE IF NOT EXISTS todos (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  text text NOT NULL,
  completed boolean DEFAULT false,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE todos ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can view todos"
  ON todos FOR SELECT
  TO anon
  USING (true);

CREATE POLICY "Anyone can insert todos"
  ON todos FOR INSERT
  TO anon
  WITH CHECK (true);

CREATE POLICY "Anyone can update todos"
  ON todos FOR UPDATE
  TO anon
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Anyone can delete todos"
  ON todos FOR DELETE
  TO anon
  USING (true);