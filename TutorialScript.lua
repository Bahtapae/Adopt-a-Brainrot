local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")

local tutorialDataStore = DataStoreService:GetDataStore("TutorialData")

local function onPlayerAdded(player)
    -- Check if the player has seen the tutorial before
    local hasSeenTutorial = tutorialDataStore:GetAsync(player.UserId)
    if not hasSeenTutorial then
        local screenGui = Instance.new("ScreenGui")
        local textLabel = Instance.new("TextLabel")
        
        textLabel.Parent = screenGui
        textLabel.Text = "Welcome to the game! Here are some tips..."
        textLabel.Size = UDim2.new(0.5, 0, 0.1, 0)
        textLabel.Position = UDim2.new(0.25, 0, 0.45, 0)
        textLabel.BackgroundColor3 = Color3.new(0, 0, 0)
        textLabel.TextColor3 = Color3.new(1, 1, 1)

        screenGui.Parent = player:WaitForChild("PlayerGui")
        
        -- Show the tutorial text for 5 seconds
        textLabel.Visible = true
        wait(5)
        textLabel.Visible = false
        wait(5)
        textLabel.Visible = true
        wait(5)
        textLabel.Visible = false
        
        -- Save to DataStore that the player has seen the tutorial
        tutorialDataStore:SetAsync(player.UserId, true)
        
        -- Clean up
        screenGui:Destroy()
    end
end

Players.PlayerAdded:Connect(onPlayerAdded)