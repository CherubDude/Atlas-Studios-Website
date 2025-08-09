-- Atlas Studios Website - Supabase Database Setup
-- Run this script in your Supabase SQL Editor to create all necessary tables

-- 1. Create home_content table for homepage content
CREATE TABLE IF NOT EXISTS home_content (
    id SERIAL PRIMARY KEY,
    hero_title TEXT DEFAULT 'Atlas Studios.',
    hero_subtitle TEXT DEFAULT 'Ground Works Simulations',
    features_title TEXT DEFAULT 'Main Features',
    features_subtitle TEXT DEFAULT 'What we produce and offer. All this just for you!',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. Create games_content table for games information
CREATE TABLE IF NOT EXISTS games_content (
    id SERIAL PRIMARY KEY,
    featured_game_title TEXT DEFAULT 'Ground Works Simulations',
    featured_game_status TEXT DEFAULT 'coming-soon',
    featured_game_description TEXT DEFAULT 'Experience the most realistic ground crew simulation on Roblox. Manage aircraft operations, coordinate ground services, and build your aviation career in this immersive simulation.',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 3. Create information_content table for studio information
CREATE TABLE IF NOT EXISTS information_content (
    id SERIAL PRIMARY KEY,
    about_text TEXT DEFAULT 'Atlas Studios is a professional Roblox game development studio specializing in realistic simulation experiences. Founded with a passion for aviation and ground operations, we create immersive, high-quality games that push the boundaries of what''s possible on the Roblox platform.',
    years_experience TEXT DEFAULT '2+',
    custom_assets TEXT DEFAULT '100%',
    discord_url TEXT DEFAULT 'https://discord.gg/WgRm5Kx3FM',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 4. Create gallery_content table for image gallery
CREATE TABLE IF NOT EXISTS gallery_content (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT,
    image_url TEXT,
    category TEXT DEFAULT 'screenshots',
    is_featured BOOLEAN DEFAULT FALSE,
    display_order INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 5. Create games table for all games (replaces projects)
CREATE TABLE IF NOT EXISTS games (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT,
    status TEXT DEFAULT 'planning' CHECK (status IN ('planning', 'in-development', 'coming-soon', 'released')),
    image_url TEXT,
    roblox_url TEXT,
    is_featured BOOLEAN DEFAULT FALSE,
    display_order INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 6. Create projects table for backward compatibility (deprecated - use games table)
CREATE TABLE IF NOT EXISTS projects (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    status TEXT DEFAULT 'planning',
    display_order INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 7. Create team_members table for team information
CREATE TABLE IF NOT EXISTS team_members (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    role TEXT NOT NULL,
    bio TEXT,
    avatar_url TEXT,
    display_order INTEGER DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 8. Create website_settings table for general site settings
CREATE TABLE IF NOT EXISTS website_settings (
    id SERIAL PRIMARY KEY,
    site_title TEXT DEFAULT 'Atlas Studios - Ground Works Simulations',
    meta_description TEXT DEFAULT 'Atlas Studios - Professional Roblox game development studio specializing in Ground Works Simulations. Unique assets, A.I systems, and premium gaming experiences.',
    contact_email TEXT,
    maintenance_mode BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Insert default data
INSERT INTO home_content (id) VALUES (1) ON CONFLICT (id) DO NOTHING;
INSERT INTO games_content (id) VALUES (1) ON CONFLICT (id) DO NOTHING;
INSERT INTO information_content (id) VALUES (1) ON CONFLICT (id) DO NOTHING;
INSERT INTO website_settings (id) VALUES (1) ON CONFLICT (id) DO NOTHING;

-- Insert default gallery items
INSERT INTO gallery_content (title, description, image_url, category, is_featured, display_order) VALUES
('Ground Works Simulations', 'Featured game screenshot', '../assets/game-screenshot.png', 'featured', TRUE, 1),
('Aircraft Servicing', 'Ground crew operations', '', 'screenshots', FALSE, 2),
('Airport Environment', 'Realistic airport setting', '', 'screenshots', FALSE, 3),
('Vehicle Fleet', 'Ground support equipment', '', 'screenshots', FALSE, 4),
('Terminal Operations', 'Passenger and cargo handling', '', 'screenshots', FALSE, 5),
('Weather Systems', 'Dynamic weather conditions', '', 'screenshots', FALSE, 6),
('Night Operations', 'After-hours ground operations', '', 'screenshots', FALSE, 7),
('Safety Procedures', 'Realistic safety protocols', '', 'screenshots', FALSE, 8),
('Training Scenarios', 'Educational gameplay modes', '', 'screenshots', FALSE, 9)
ON CONFLICT DO NOTHING;

-- Insert default games
INSERT INTO games (title, description, status, image_url, is_featured, display_order) VALUES
('Ground Works Simulations', 'Experience the most realistic ground crew simulation on Roblox. Manage aircraft operations, coordinate ground services, and build your aviation career in this immersive simulation.', 'coming-soon', '../assets/game-screenshot.png', TRUE, 1),
('Airport Tycoon', 'Build and manage your own international airport with realistic operations and management systems.', 'in-development', '', FALSE, 2),
('Flight Training Academy', 'Learn to fly with our comprehensive flight training simulation featuring realistic aircraft and weather systems.', 'planning', '', FALSE, 3)
ON CONFLICT DO NOTHING;

-- Insert default project (for backward compatibility)
INSERT INTO projects (name, description, status, display_order) VALUES
('Airport Tycoon', 'Build and manage your own international airport', 'in-development', 1)
ON CONFLICT DO NOTHING;

-- Insert default team member
INSERT INTO team_members (name, role, bio, display_order) VALUES
('Lead Developer', 'Founder & CEO', 'Passionate about aviation and game development with extensive Roblox experience.', 1)
ON CONFLICT DO NOTHING;

-- Enable Row Level Security (RLS) for better security
ALTER TABLE home_content ENABLE ROW LEVEL SECURITY;
ALTER TABLE games_content ENABLE ROW LEVEL SECURITY;
ALTER TABLE information_content ENABLE ROW LEVEL SECURITY;
ALTER TABLE gallery_content ENABLE ROW LEVEL SECURITY;
ALTER TABLE games ENABLE ROW LEVEL SECURITY;
ALTER TABLE projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE team_members ENABLE ROW LEVEL SECURITY;
ALTER TABLE website_settings ENABLE ROW LEVEL SECURITY;

-- Create policies to allow public read access and authenticated write access
-- (You can adjust these policies based on your security requirements)

-- Public read policies
CREATE POLICY "Allow public read access" ON home_content FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON games_content FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON information_content FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON gallery_content FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON games FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON projects FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON team_members FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON website_settings FOR SELECT USING (true);

-- Allow anonymous users to update content (for dashboard functionality)
-- In production, you might want to restrict this to authenticated admin users
CREATE POLICY "Allow anonymous updates" ON home_content FOR ALL USING (true);
CREATE POLICY "Allow anonymous updates" ON games_content FOR ALL USING (true);
CREATE POLICY "Allow anonymous updates" ON information_content FOR ALL USING (true);
CREATE POLICY "Allow anonymous updates" ON gallery_content FOR ALL USING (true);
CREATE POLICY "Allow anonymous updates" ON games FOR ALL USING (true);
CREATE POLICY "Allow anonymous updates" ON projects FOR ALL USING (true);
CREATE POLICY "Allow anonymous updates" ON team_members FOR ALL USING (true);
CREATE POLICY "Allow anonymous updates" ON website_settings FOR ALL USING (true);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_gallery_content_featured ON gallery_content(is_featured);
CREATE INDEX IF NOT EXISTS idx_gallery_content_order ON gallery_content(display_order);
CREATE INDEX IF NOT EXISTS idx_games_featured ON games(is_featured);
CREATE INDEX IF NOT EXISTS idx_games_status ON games(status);
CREATE INDEX IF NOT EXISTS idx_games_order ON games(display_order);
CREATE INDEX IF NOT EXISTS idx_projects_status ON projects(status);
CREATE INDEX IF NOT EXISTS idx_projects_order ON projects(display_order);
CREATE INDEX IF NOT EXISTS idx_team_members_active ON team_members(is_active);
CREATE INDEX IF NOT EXISTS idx_team_members_order ON team_members(display_order);

-- Success message
DO $$
BEGIN
    RAISE NOTICE 'Atlas Studios database setup completed successfully!';
    RAISE NOTICE 'All tables created with default data.';
    RAISE NOTICE 'Your admin dashboard is now ready to use.';
END $$;
