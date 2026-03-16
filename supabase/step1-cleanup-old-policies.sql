-- ============================================================
-- STEP 1: ลบ POLICIES เก่าที่อาจมีปัญหา
-- ============================================================
-- รันไฟล์นี้ก่อนเป็นอันดับแรก
-- จะลบ policies เก่าออกทั้งหมดเพื่อสร้างใหม่ให้ถูกต้อง
-- ============================================================

-- ── user_builds ──
DROP POLICY IF EXISTS "Users can view own builds" ON user_builds;
DROP POLICY IF EXISTS "Users can insert own builds" ON user_builds;
DROP POLICY IF EXISTS "Users can update own builds" ON user_builds;
DROP POLICY IF EXISTS "Users can delete own builds" ON user_builds;

-- ── user_profiles ──
DROP POLICY IF EXISTS "Users can view own profile" ON user_profiles;
DROP POLICY IF EXISTS "Users can update own profile" ON user_profiles;

-- ── community_builds ──
DROP POLICY IF EXISTS "Anyone can view community builds" ON community_builds;
DROP POLICY IF EXISTS "Authenticated users can insert community builds" ON community_builds;

-- ── build_votes ──
DROP POLICY IF EXISTS "Users can view own votes" ON build_votes;
DROP POLICY IF EXISTS "Users can insert own votes" ON build_votes;
DROP POLICY IF EXISTS "Users can update own votes" ON build_votes;
DROP POLICY IF EXISTS "Users can delete own votes" ON build_votes;

-- ── community_tier_lists ──
DROP POLICY IF EXISTS "Anyone can view community tier lists" ON community_tier_lists;
DROP POLICY IF EXISTS "Authenticated users can insert community tier lists" ON community_tier_lists;
DROP POLICY IF EXISTS "Authenticated users can update community tier lists" ON community_tier_lists;

-- ── translation_cache ──
DROP POLICY IF EXISTS "Anyone can read translation cache" ON translation_cache;
DROP POLICY IF EXISTS "Authenticated can read translation cache" ON translation_cache;
DROP POLICY IF EXISTS "Authenticated can insert translation cache" ON translation_cache;
DROP POLICY IF EXISTS "Authenticated can upsert translation cache" ON translation_cache;

-- ── characters (ลบ policies เก่าที่ให้ authenticated ทุกคนแก้ไขได้) ──
DROP POLICY IF EXISTS "Anyone can read characters" ON characters;
DROP POLICY IF EXISTS "Authenticated users can insert characters" ON characters;
DROP POLICY IF EXISTS "Authenticated users can update characters" ON characters;
DROP POLICY IF EXISTS "Authenticated users can delete characters" ON characters;

-- ── events ──
DROP POLICY IF EXISTS "Anyone can read events" ON events;
DROP POLICY IF EXISTS "Authenticated users can insert events" ON events;
DROP POLICY IF EXISTS "Authenticated users can update events" ON events;
DROP POLICY IF EXISTS "Authenticated users can delete events" ON events;

-- ── guides ──
DROP POLICY IF EXISTS "Anyone can read published guides" ON guides;
DROP POLICY IF EXISTS "Authenticated can read all guides" ON guides;
DROP POLICY IF EXISTS "Authenticated can insert guides" ON guides;
DROP POLICY IF EXISTS "Authenticated can update guides" ON guides;
DROP POLICY IF EXISTS "Authenticated can delete guides" ON guides;

-- ── guide_blocks ──
DROP POLICY IF EXISTS "Anyone can read guide blocks" ON guide_blocks;
DROP POLICY IF EXISTS "Authenticated can insert guide blocks" ON guide_blocks;
DROP POLICY IF EXISTS "Authenticated can update guide blocks" ON guide_blocks;
DROP POLICY IF EXISTS "Authenticated can delete guide blocks" ON guide_blocks;

-- ── media ──
DROP POLICY IF EXISTS "Anyone can read media" ON media;
DROP POLICY IF EXISTS "Authenticated can insert media" ON media;
DROP POLICY IF EXISTS "Authenticated can update media" ON media;
DROP POLICY IF EXISTS "Authenticated can delete media" ON media;

-- ── weapons ──
DROP POLICY IF EXISTS "Anyone can read weapons" ON weapons;
DROP POLICY IF EXISTS "Authenticated users can insert weapons" ON weapons;
DROP POLICY IF EXISTS "Authenticated users can update weapons" ON weapons;
DROP POLICY IF EXISTS "Authenticated users can delete weapons" ON weapons;

-- ── weapon_characters ──
DROP POLICY IF EXISTS "Anyone can read weapon_characters" ON weapon_characters;
DROP POLICY IF EXISTS "Authenticated users can insert weapon_characters" ON weapon_characters;
DROP POLICY IF EXISTS "Authenticated users can update weapon_characters" ON weapon_characters;
DROP POLICY IF EXISTS "Authenticated users can delete weapon_characters" ON weapon_characters;

SELECT 'Step 1 Complete: Old policies removed' AS status;
