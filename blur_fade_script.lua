-- Create a blur effect that is active when joining and fades out after 3 seconds without a black screen.

local Player = game.Players.LocalPlayer
local BlurEffect = Instance.new('BlurEffect', game.Lighting)
BlurEffect.Size = 0 -- Start with no blur

-- Function to set the blur effect
local function setBlurEffect() 
    BlurEffect.Size = 10 -- Maximum blur
    wait(3) -- Wait for 3 seconds
    BlurEffect.Size = 0 -- Fade out the blur
end

-- Trigger the blur effect when the player joins
Player.CharacterAdded:Connect(setBlurEffect)