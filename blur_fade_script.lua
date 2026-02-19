-- Blur Fade Script

local Players = game:GetService('Players')
local StarterGui = game:GetService('StarterGui')

-- Function to blur the screen
local function blurScreen()
    StarterGui:SetCore('ScreenFade', {FadeTime = 1, FadeColor = Color3.new(1, 1, 1)})
    wait(1)
    StarterGui:SetCore('ScreenFade', {FadeTime = 1, FadeColor = Color3.new(0, 0, 0)})
end

-- Connect the function to the PlayerAdded event
Players.PlayerAdded:Connect(function()
    blurScreen()
end)