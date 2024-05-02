local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
function update(text)
    local args = {
        [1] = "Update",
        [2] = {
            ["DescriptionText"] = tostring(text),
        }
    }
    game:GetService("ReplicatedStorage").CustomiseBooth:FireServer(unpack(args))
end
function updateimg(id)
    local args = {
        [1] = "Update",
        [2] = {
            ["ImageId"] = tonumber(id)
        }
    }
    game:GetService("ReplicatedStorage").CustomiseBooth:FireServer(unpack(args))
end
local Window = OrionLib:MakeWindow({Name = "Rate My Avatar (By huntingwall8910 on GitHub)", IntroText = "Welcome (__MODIFIED__): "..game:GetService("Players").LocalPlayer.Name, HidePremium = false, SaveConfig = false, ConfigFolder = "RateMyAvatar"})
local Tab = Window:MakeTab({
	Name = "Tools",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Essentials"
})

function randomString()
	local length = math.random(7,7)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

for i,v in pairs(game.Workspace:GetChildren()) do
    if v:IsA("Model") then
        local d0RR = v:GetAttribute("TenantUsername")
        if d0RR == game.Players.LocalPlayer.Name then
            local ThingBruh = v
            print("Found Booth...")
            wait(0.2)
            print(v)
            wait(0.2)
            if ThingBruh.Banner.SurfaceGui.Frame.Description.Text == "#######" then
                warn("Hashtags Detected!")
                wait(0.1)
                ThingBruh.Banner.SurfaceGui.Frame.Description.Text = "Message Detected As Hashtags"
            else
                print("No Hashtags")
            end
        end
    end
end

Tab:AddTextbox({
	Name = "Change Booth Text",
	Default = tostring("Enter Booth Text"),
	TextDisappear = false,
	Callback = function(Value)
	update(Value)
end})
Tab:AddToggle({
	Name = "Auto Change Booth Text",
	Default = false,
	Callback = function(ezToggle)
    if ezToggle then
    getgenv().AutoText = true
    while getgenv().AutoText == true do
    wait()
    local args = {
        [1] = "Update",
        [2] = {
            ["DescriptionText"] = randomString(),
        }
    }
    game:GetService("ReplicatedStorage").CustomiseBooth:FireServer(unpack(args))
    end
else
    getgenv().AutoText = false
    wait()
    getgenv().AutoText = false
    wait()
    getgenv().AutoText = false
end
for i,v in pairs(game.Workspace:GetChildren()) do
    if v:IsA("Model") then
        local d0RR = v:GetAttribute("TenantUsername")
        if d0RR == game.Players.LocalPlayer.Name then
            local ThingBruh = v
            print("Found Booth...")
            wait(0.2)
            print(v)
            wait(0.2)
            if ThingBruh.Banner.SurfaceGui.Frame.Description.Text == "#######" then
                warn("Hashtags Detected!")
                wait(0.1)
                ThingBruh.Banner.SurfaceGui.Frame.Description.Text = "Message Detected As Hashtags"
            else
                print("No Hashtags")
            end
        end
    end
end
end})
Tab:AddTextbox({
	Name = "Change Image (ID)",
	Default = "0",
	TextDisappear = false,
	Callback = function(idValue)
	updateimg(idValue)
end})
OrionLib:Init()
