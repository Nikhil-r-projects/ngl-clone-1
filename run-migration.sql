-- Run this SQL in your Supabase Dashboard SQL Editor
-- This will properly set up the is_read and is_shared columns

-- Drop existing columns if they exist (to ensure clean state)
ALTER TABLE public.messages DROP COLUMN IF EXISTS is_read;
ALTER TABLE public.messages DROP COLUMN IF EXISTS is_shared;

-- Re-create is_read column with proper defaults and constraints
ALTER TABLE public.messages 
ADD COLUMN is_read BOOLEAN NOT NULL DEFAULT FALSE;

-- Re-create is_shared column with proper defaults and constraints  
ALTER TABLE public.messages 
ADD COLUMN is_shared BOOLEAN NOT NULL DEFAULT FALSE;

-- Add comments to document the purpose of these columns
COMMENT ON COLUMN public.messages.is_read IS 'Indicates if the message has been viewed/opened by the recipient';
COMMENT ON COLUMN public.messages.is_shared IS 'Indicates if the message has been shared to Instagram by the recipient';

-- Verify the changes
SELECT column_name, data_type, is_nullable, column_default 
FROM information_schema.columns 
WHERE table_name = 'messages' 
AND column_name IN ('is_read', 'is_shared'); 