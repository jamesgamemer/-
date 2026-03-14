-- ============================================================
-- 7DS ORIGIN - Community Tables Migration
-- Run this in Supabase SQL Editor
-- ============================================================

-- ── Community Tier Lists ──
CREATE TABLE IF NOT EXISTS community_tier_lists (
  id          UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  author_name TEXT NOT NULL DEFAULT 'Anonymous',
  title       TEXT NOT NULL DEFAULT 'My Tier List',
  description TEXT DEFAULT '',
  tiers       JSONB NOT NULL,         -- { "S": ["Meliodas",...], "A": [...], ... }
  votes       INT DEFAULT 0,
  created_at  TIMESTAMPTZ DEFAULT now(),
  updated_at  TIMESTAMPTZ DEFAULT now()
);

-- Enable RLS
ALTER TABLE community_tier_lists ENABLE ROW LEVEL SECURITY;

-- Anyone can read
CREATE POLICY "Anyone can read tier lists"
  ON community_tier_lists FOR SELECT
  USING (true);

-- Anyone can insert (anonymous posting)
CREATE POLICY "Anyone can insert tier lists"
  ON community_tier_lists FOR INSERT
  WITH CHECK (true);

-- Anyone can update votes
CREATE POLICY "Anyone can update tier list votes"
  ON community_tier_lists FOR UPDATE
  USING (true)
  WITH CHECK (true);


-- ── Community Builds (Team Builder) ──
CREATE TABLE IF NOT EXISTS community_builds (
  id          UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  author_name TEXT NOT NULL DEFAULT 'Anonymous',
  title       TEXT NOT NULL DEFAULT 'My Build',
  description TEXT DEFAULT '',
  tag         TEXT DEFAULT 'GENERAL',   -- META, MAGIC, TANK, DPS, GENERAL
  build_data  JSONB NOT NULL,           -- serialized build (nodes, edges, weapons)
  char_names  TEXT[] DEFAULT '{}',      -- array of character names for preview
  char_count  INT DEFAULT 0,
  char_images TEXT[] DEFAULT '{}',      -- array of character image URLs for preview
  votes       INT DEFAULT 0,
  created_at  TIMESTAMPTZ DEFAULT now(),
  updated_at  TIMESTAMPTZ DEFAULT now()
);

-- Enable RLS
ALTER TABLE community_builds ENABLE ROW LEVEL SECURITY;

-- Anyone can read
CREATE POLICY "Anyone can read community builds"
  ON community_builds FOR SELECT
  USING (true);

-- Anyone can insert
CREATE POLICY "Anyone can insert community builds"
  ON community_builds FOR INSERT
  WITH CHECK (true);

-- Anyone can update votes
CREATE POLICY "Anyone can update community build votes"
  ON community_builds FOR UPDATE
  USING (true)
  WITH CHECK (true);

-- Anyone can delete (for now; later restrict to author)
CREATE POLICY "Anyone can delete community builds"
  ON community_builds FOR DELETE
  USING (true);
