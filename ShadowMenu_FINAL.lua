-- Shadow Menu [PVP] - Roblox LocalScript
-- VERSÃO UNIFICADA: Aimbot + ESP funcionais

local Players    = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui  = LocalPlayer:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local UIS        = game:GetService("UserInputService")
local Camera     = workspace.CurrentCamera

-- ══════════════════════════════════════════
-- STATE
-- ══════════════════════════════════════════
local state = {
    currentTab = "AIMBOT",
    toggles = {
        AIMLOCK  = false,
        WALLCK   = false,
        SHOWFOV  = false,
        ESP_NAME  = false,
        ESP_BOX   = false,
        ESP_TRACE = false,
        ESP_RAGE  = false,
        ESP_LIFE  = false,
        ESP_HEAD  = false,
    },
    fov          = 70,
    fovColor     = "#FFFFFF",
    espColor     = "#00FF00",
    firelockPart = "Head",
}

-- ══════════════════════════════════════════
-- SCREEN GUI
-- ══════════════════════════════════════════
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ShadowMenu"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

-- ══════════════════════════════════════════
-- MAIN FRAME
-- ══════════════════════════════════════════
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 520, 0, 310)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -155)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

-- ══════════════════════════════════════════
-- HEADER BAR
-- ══════════════════════════════════════════
local HeaderBar = Instance.new("Frame")
HeaderBar.Size = UDim2.new(1, 0, 0, 52)
HeaderBar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
HeaderBar.BorderSizePixel = 0
HeaderBar.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(0, 220, 1, 0)
TitleLabel.Position = UDim2.new(0, 18, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "SHADOW MENU  [PVP]"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 17
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = HeaderBar

local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(0, 190, 1, 0)
TabContainer.Position = UDim2.new(1, -200, 0, 0)
TabContainer.BackgroundTransparency = 1
TabContainer.Parent = HeaderBar

local BtnESP = Instance.new("TextButton")
BtnESP.Size = UDim2.new(0, 80, 1, 0)
BtnESP.BackgroundTransparency = 1
BtnESP.Text = "ESP"
BtnESP.TextSize = 18
BtnESP.Font = Enum.Font.GothamBold
BtnESP.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnESP.Parent = TabContainer

local BtnAIMBOT = Instance.new("TextButton")
BtnAIMBOT.Size = UDim2.new(0, 100, 1, 0)
BtnAIMBOT.Position = UDim2.new(0, 85, 0, 0)
BtnAIMBOT.BackgroundTransparency = 1
BtnAIMBOT.Text = "AIMBOT"
BtnAIMBOT.TextSize = 18
BtnAIMBOT.Font = Enum.Font.GothamBold
BtnAIMBOT.TextColor3 = Color3.fromRGB(170, 80, 255)
BtnAIMBOT.Parent = TabContainer

local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(1, 0, 0, 1)
Divider.Position = UDim2.new(0, 0, 0, 52)
Divider.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
Divider.BorderSizePixel = 0
Divider.Parent = MainFrame

-- ══════════════════════════════════════════
-- CONTENT AREA
-- ══════════════════════════════════════════
local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, 0, 1, -53)
ContentArea.Position = UDim2.new(0, 0, 0, 53)
ContentArea.BackgroundTransparency = 1
ContentArea.Parent = MainFrame

-- ══════════════════════════════════════════
-- HELPER: TOGGLE
-- ══════════════════════════════════════════
local function createToggle(parent, labelText, yPos, toggleKey)
    local Row = Instance.new("Frame")
    Row.Size = UDim2.new(1, -40, 0, 30)
    Row.Position = UDim2.new(0, 20, 0, yPos)
    Row.BackgroundTransparency = 1
    Row.Parent = parent

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0, 140, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = labelText
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextSize = 16
    Label.Font = Enum.Font.GothamBold
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Row

    local ToggleBG = Instance.new("Frame")
    ToggleBG.Size = UDim2.new(0, 52, 0, 26)
    ToggleBG.Position = UDim2.new(0, 148, 0.5, -13)
    ToggleBG.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    ToggleBG.BorderSizePixel = 0
    ToggleBG.Parent = Row
    Instance.new("UICorner", ToggleBG).CornerRadius = UDim.new(1, 0)

    local Knob = Instance.new("Frame")
    Knob.Size = UDim2.new(0, 20, 0, 20)
    Knob.Position = UDim2.new(0, 3, 0.5, -10)
    Knob.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    Knob.BorderSizePixel = 0
    Knob.Parent = ToggleBG
    Instance.new("UICorner", Knob).CornerRadius = UDim.new(1, 0)

    local ClickBtn = Instance.new("TextButton")
    ClickBtn.Size = UDim2.new(1, 0, 1, 0)
    ClickBtn.BackgroundTransparency = 1
    ClickBtn.Text = ""
    ClickBtn.Parent = Row

    local function refresh()
        if state.toggles[toggleKey] then
            ToggleBG.BackgroundColor3 = Color3.fromRGB(120, 60, 220)
            Knob.Position = UDim2.new(0, 29, 0.5, -10)
            Knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        else
            ToggleBG.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            Knob.Position = UDim2.new(0, 3, 0.5, -10)
            Knob.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        end
    end

    ClickBtn.MouseButton1Click:Connect(function()
        state.toggles[toggleKey] = not state.toggles[toggleKey]
        refresh()
    end)
    refresh()
end

-- ══════════════════════════════════════════
-- AIMBOT TAB
-- ══════════════════════════════════════════
local AimbotTab = Instance.new("Frame")
AimbotTab.Size = UDim2.new(1, 0, 1, 0)
AimbotTab.BackgroundTransparency = 1
AimbotTab.Visible = true
AimbotTab.Parent = ContentArea

createToggle(AimbotTab, "AIMLOCK",  15,  "AIMLOCK")
createToggle(AimbotTab, "WALLCK",   60,  "WALLCK")
createToggle(AimbotTab, "SHOWFOV", 105,  "SHOWFOV")

-- FOV Label
local FovLabel = Instance.new("TextLabel")
FovLabel.Size = UDim2.new(0, 200, 0, 20)
FovLabel.Position = UDim2.new(0, 20, 0, 152)
FovLabel.BackgroundTransparency = 1
FovLabel.Text = "FOV CONFIG"
FovLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
FovLabel.TextSize = 17
FovLabel.Font = Enum.Font.GothamBold
FovLabel.TextXAlignment = Enum.TextXAlignment.Left
FovLabel.Parent = AimbotTab

-- FOV valor atual
local FovValueLabel = Instance.new("TextLabel")
FovValueLabel.Size = UDim2.new(0, 60, 0, 20)
FovValueLabel.Position = UDim2.new(0, 260, 0, 152)
FovValueLabel.BackgroundTransparency = 1
FovValueLabel.Text = tostring(state.fov)
FovValueLabel.TextColor3 = Color3.fromRGB(170, 80, 255)
FovValueLabel.TextSize = 15
FovValueLabel.Font = Enum.Font.GothamBold
FovValueLabel.Parent = AimbotTab

-- FOV Slider track
local SliderTrack = Instance.new("Frame")
SliderTrack.Size = UDim2.new(0, 300, 0, 6)
SliderTrack.Position = UDim2.new(0, 20, 0, 182)
SliderTrack.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
SliderTrack.BorderSizePixel = 0
SliderTrack.Parent = AimbotTab
Instance.new("UICorner", SliderTrack).CornerRadius = UDim.new(1, 0)

local SliderFill = Instance.new("Frame")
SliderFill.Size = UDim2.new(state.fov / 400, 0, 1, 0)
SliderFill.BackgroundColor3 = Color3.fromRGB(120, 60, 220)
SliderFill.BorderSizePixel = 0
SliderFill.Parent = SliderTrack
Instance.new("UICorner", SliderFill).CornerRadius = UDim.new(1, 0)

-- Slider drag
local sliderDragging = false
SliderTrack.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or
       input.UserInputType == Enum.UserInputType.Touch then
        sliderDragging = true
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or
       input.UserInputType == Enum.UserInputType.Touch then
        sliderDragging = false
    end
end)
UIS.InputChanged:Connect(function(input)
    if sliderDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or
       input.UserInputType == Enum.UserInputType.Touch) then
        local pos = SliderTrack.AbsolutePosition
        local size = SliderTrack.AbsoluteSize
        local ratio = math.clamp((input.Position.X - pos.X) / size.X, 0, 1)
        state.fov = math.floor(ratio * 400)  -- 0 a 400 pixels de raio
        SliderFill.Size = UDim2.new(ratio, 0, 1, 0)
        FovValueLabel.Text = tostring(state.fov)
    end
end)

-- FOVCOLOR
local FovColorRow = Instance.new("Frame")
FovColorRow.Size = UDim2.new(0, 220, 0, 30)
FovColorRow.Position = UDim2.new(0, 260, 0, 15)
FovColorRow.BackgroundTransparency = 1
FovColorRow.Parent = AimbotTab

local FovColorLabel = Instance.new("TextLabel")
FovColorLabel.Size = UDim2.new(0, 100, 1, 0)
FovColorLabel.BackgroundTransparency = 1
FovColorLabel.Text = "FOVCOLOR"
FovColorLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
FovColorLabel.TextSize = 15
FovColorLabel.Font = Enum.Font.GothamBold
FovColorLabel.TextXAlignment = Enum.TextXAlignment.Left
FovColorLabel.Parent = FovColorRow

local FovColorPreview = Instance.new("Frame")
FovColorPreview.Size = UDim2.new(0, 52, 0, 24)
FovColorPreview.Position = UDim2.new(0, 108, 0.5, -12)
FovColorPreview.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FovColorPreview.BorderSizePixel = 0
FovColorPreview.Parent = FovColorRow
Instance.new("UICorner", FovColorPreview).CornerRadius = UDim.new(0, 4)

local FovHexBox = Instance.new("TextBox")
FovHexBox.Size = UDim2.new(0, 90, 0, 22)
FovHexBox.Position = UDim2.new(0, 108, 0.5, -11)
FovHexBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
FovHexBox.BorderSizePixel = 0
FovHexBox.Text = "#FFFFFF"
FovHexBox.TextColor3 = Color3.fromRGB(255, 255, 255)
FovHexBox.TextSize = 12
FovHexBox.Font = Enum.Font.GothamBold
FovHexBox.ClearTextOnFocus = false
FovHexBox.Visible = false
FovHexBox.ZIndex = 10
FovHexBox.Parent = FovColorRow
Instance.new("UICorner", FovHexBox).CornerRadius = UDim.new(0, 4)

local function hexToColor3(hex)
    hex = hex:gsub("#", "")
    if #hex ~= 6 then return nil end
    local r = tonumber(hex:sub(1,2), 16)
    local g = tonumber(hex:sub(3,4), 16)
    local b = tonumber(hex:sub(5,6), 16)
    if not (r and g and b) then return nil end
    return Color3.fromRGB(r, g, b)
end

FovHexBox.FocusLost:Connect(function()
    local c = hexToColor3(FovHexBox.Text)
    if c then
        FovColorPreview.BackgroundColor3 = c
        state.fovColor = FovHexBox.Text
    else
        FovHexBox.Text = state.fovColor
    end
    FovHexBox.Visible = false
    FovColorPreview.Visible = true
end)
FovColorPreview.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        FovColorPreview.Visible = false
        FovHexBox.Visible = true
        FovHexBox:CaptureFocus()
    end
end)

-- FIRELOCK
local FireLockRow = Instance.new("Frame")
FireLockRow.Size = UDim2.new(0, 220, 0, 30)
FireLockRow.Position = UDim2.new(0, 260, 0, 60)
FireLockRow.BackgroundTransparency = 1
FireLockRow.Parent = AimbotTab

local FireLockLabel = Instance.new("TextLabel")
FireLockLabel.Size = UDim2.new(0, 100, 1, 0)
FireLockLabel.BackgroundTransparency = 1
FireLockLabel.Text = "FIRELOCK"
FireLockLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
FireLockLabel.TextSize = 15
FireLockLabel.Font = Enum.Font.GothamBold
FireLockLabel.TextXAlignment = Enum.TextXAlignment.Left
FireLockLabel.Parent = FireLockRow

local bodyParts = {"Head", "Torso", "Foot"}
local selectedPart = 1

local PartSelectorBG = Instance.new("Frame")
PartSelectorBG.Size = UDim2.new(0, 120, 0, 26)
PartSelectorBG.Position = UDim2.new(0, 108, 0.5, -13)
PartSelectorBG.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
PartSelectorBG.BorderSizePixel = 0
PartSelectorBG.Parent = FireLockRow
Instance.new("UICorner", PartSelectorBG).CornerRadius = UDim.new(1, 0)

local PartLayout = Instance.new("UIListLayout")
PartLayout.FillDirection = Enum.FillDirection.Horizontal
PartLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
PartLayout.VerticalAlignment = Enum.VerticalAlignment.Center
PartLayout.Padding = UDim.new(0, 2)
PartLayout.Parent = PartSelectorBG

local partButtons = {}
local function refreshPartButtons()
    for i, btn in ipairs(partButtons) do
        btn.TextColor3 = (i == selectedPart)
            and Color3.fromRGB(170, 80, 255)
            or  Color3.fromRGB(180, 180, 180)
        btn.Font = (i == selectedPart) and Enum.Font.GothamBold or Enum.Font.Gotham
    end
end
for i, partName in ipairs(bodyParts) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 36, 0, 22)
    btn.BackgroundTransparency = 1
    btn.Text = partName
    btn.TextSize = 10
    btn.Font = Enum.Font.Gotham
    btn.TextColor3 = Color3.fromRGB(180, 180, 180)
    btn.Parent = PartSelectorBG
    local idx = i
    btn.MouseButton1Click:Connect(function()
        selectedPart = idx
        state.firelockPart = partName
        refreshPartButtons()
    end)
    table.insert(partButtons, btn)
end
state.firelockPart = "Head"
refreshPartButtons()

-- ══════════════════════════════════════════
-- ESP TAB
-- ══════════════════════════════════════════
local EspTab = Instance.new("Frame")
EspTab.Size = UDim2.new(1, 0, 1, 0)
EspTab.BackgroundTransparency = 1
EspTab.Visible = false
EspTab.Parent = ContentArea

-- Coluna esquerda
local espLeftItems = {
    {label="ESP NAME",  key="ESP_NAME",  y=15 },
    {label="ESP BOX",   key="ESP_BOX",   y=60 },
    {label="ESP TRACE", key="ESP_TRACE", y=105},
    {label="ESP RAGE",  key="ESP_RAGE",  y=150},
    {label="ESP LIFE",  key="ESP_LIFE",  y=195},
}
for _, item in ipairs(espLeftItems) do
    createToggle(EspTab, item.label, item.y, item.key)
end

-- Coluna direita (ESP HEAD)
local function createToggleRight(parent, labelText, yPos, toggleKey)
    local Row = Instance.new("Frame")
    Row.Size = UDim2.new(0, 220, 0, 30)
    Row.Position = UDim2.new(0, 260, 0, yPos)
    Row.BackgroundTransparency = 1
    Row.Parent = parent

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0, 110, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = labelText
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextSize = 16
    Label.Font = Enum.Font.GothamBold
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Row

    local ToggleBG = Instance.new("Frame")
    ToggleBG.Size = UDim2.new(0, 52, 0, 26)
    ToggleBG.Position = UDim2.new(0, 115, 0.5, -13)
    ToggleBG.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    ToggleBG.BorderSizePixel = 0
    ToggleBG.Parent = Row
    Instance.new("UICorner", ToggleBG).CornerRadius = UDim.new(1, 0)

    local Knob = Instance.new("Frame")
    Knob.Size = UDim2.new(0, 20, 0, 20)
    Knob.Position = UDim2.new(0, 3, 0.5, -10)
    Knob.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    Knob.BorderSizePixel = 0
    Knob.Parent = ToggleBG
    Instance.new("UICorner", Knob).CornerRadius = UDim.new(1, 0)

    local ClickBtn = Instance.new("TextButton")
    ClickBtn.Size = UDim2.new(1, 0, 1, 0)
    ClickBtn.BackgroundTransparency = 1
    ClickBtn.Text = ""
    ClickBtn.Parent = Row

    local function refresh()
        if state.toggles[toggleKey] then
            ToggleBG.BackgroundColor3 = Color3.fromRGB(120, 60, 220)
            Knob.Position = UDim2.new(0, 29, 0.5, -10)
            Knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        else
            ToggleBG.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            Knob.Position = UDim2.new(0, 3, 0.5, -10)
            Knob.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        end
    end
    ClickBtn.MouseButton1Click:Connect(function()
        state.toggles[toggleKey] = not state.toggles[toggleKey]
        refresh()
    end)
    refresh()
end

createToggleRight(EspTab, "ESP HEAD", 15, "ESP_HEAD")

-- ESP COLOR
local EspColorRow = Instance.new("Frame")
EspColorRow.Size = UDim2.new(0, 220, 0, 30)
EspColorRow.Position = UDim2.new(0, 260, 0, 60)
EspColorRow.BackgroundTransparency = 1
EspColorRow.Parent = EspTab

local EspColorLabel = Instance.new("TextLabel")
EspColorLabel.Size = UDim2.new(0, 100, 1, 0)
EspColorLabel.BackgroundTransparency = 1
EspColorLabel.Text = "ESP COLOR"
EspColorLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
EspColorLabel.TextSize = 15
EspColorLabel.Font = Enum.Font.GothamBold
EspColorLabel.TextXAlignment = Enum.TextXAlignment.Left
EspColorLabel.Parent = EspColorRow

local EspColorPreview = Instance.new("Frame")
EspColorPreview.Size = UDim2.new(0, 52, 0, 24)
EspColorPreview.Position = UDim2.new(0, 108, 0.5, -12)
EspColorPreview.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
EspColorPreview.BorderSizePixel = 0
EspColorPreview.Parent = EspColorRow
Instance.new("UICorner", EspColorPreview).CornerRadius = UDim.new(0, 4)

local EspHexBox = Instance.new("TextBox")
EspHexBox.Size = UDim2.new(0, 90, 0, 22)
EspHexBox.Position = UDim2.new(0, 108, 0.5, -11)
EspHexBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
EspHexBox.BorderSizePixel = 0
EspHexBox.Text = "#00FF00"
EspHexBox.TextColor3 = Color3.fromRGB(255, 255, 255)
EspHexBox.TextSize = 12
EspHexBox.Font = Enum.Font.GothamBold
EspHexBox.ClearTextOnFocus = false
EspHexBox.Visible = false
EspHexBox.ZIndex = 10
EspHexBox.Parent = EspColorRow
Instance.new("UICorner", EspHexBox).CornerRadius = UDim.new(0, 4)

EspHexBox.FocusLost:Connect(function()
    local c = hexToColor3(EspHexBox.Text)
    if c then
        EspColorPreview.BackgroundColor3 = c
        state.espColor = EspHexBox.Text
    else
        EspHexBox.Text = state.espColor
    end
    EspHexBox.Visible = false
    EspColorPreview.Visible = true
end)
EspColorPreview.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        EspColorPreview.Visible = false
        EspHexBox.Visible = true
        EspHexBox:CaptureFocus()
    end
end)

-- ══════════════════════════════════════════
-- TAB SWITCHING
-- ══════════════════════════════════════════
local function switchTab(tab)
    state.currentTab = tab
    if tab == "ESP" then
        EspTab.Visible = true
        AimbotTab.Visible = false
        BtnESP.TextColor3    = Color3.fromRGB(170, 80, 255)
        BtnAIMBOT.TextColor3 = Color3.fromRGB(255, 255, 255)
    else
        EspTab.Visible = false
        AimbotTab.Visible = true
        BtnAIMBOT.TextColor3 = Color3.fromRGB(170, 80, 255)
        BtnESP.TextColor3    = Color3.fromRGB(255, 255, 255)
    end
end
BtnESP.MouseButton1Click:Connect(function() switchTab("ESP") end)
BtnAIMBOT.MouseButton1Click:Connect(function() switchTab("AIMBOT") end)

-- INSERT para mostrar/esconder
UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.Insert then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

-- ══════════════════════════════════════════════════════════════════
-- AIMBOT — extraído da versão funcional (.txt)
-- ══════════════════════════════════════════════════════════════════

-- FOV Circle (sempre existe, só aparece com SHOWFOV)
local fovCircle = nil
pcall(function()
    fovCircle = Drawing.new("Circle")
    fovCircle.Visible      = false
    fovCircle.Thickness    = 2
    fovCircle.Filled       = false
    fovCircle.Transparency = 1
    fovCircle.Color        = Color3.fromRGB(255, 255, 255)
end)

local function getFovColor()
    local hex = (state.fovColor or "#FFFFFF"):gsub("#","")
    local r = tonumber(hex:sub(1,2),16) or 255
    local g = tonumber(hex:sub(3,4),16) or 255
    local b = tonumber(hex:sub(5,6),16) or 255
    return Color3.fromRGB(r, g, b)
end

-- Alvo mais próximo dentro do FOV, respeitando WALLCK e FIRELOCK
local function getClosestTargetInFOV()
    local myChar = LocalPlayer.Character
    local myHRP  = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end

    local cam          = workspace.CurrentCamera
    local screenCenter = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)
    -- state.fov = raio em pixels (igual ao círculo desenhado)
    local fovRadius    = state.fov

    local closestDist = math.huge
    local target      = nil

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr == LocalPlayer then continue end
        local char = plr.Character
        if not char then continue end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hum or hum.Health <= 0 then continue end

        local targetPart = char:FindFirstChild(state.firelockPart)
            or char:FindFirstChild("HumanoidRootPart")
        if not targetPart then continue end

        -- WALLCK: ignora quem tem parede na frente
        if state.toggles.WALLCK then
            local params = RaycastParams.new()
            params.FilterDescendantsInstances = {myChar, char}
            params.FilterType = Enum.RaycastFilterType.Exclude
            local dir = targetPart.Position - myHRP.Position
            if workspace:Raycast(myHRP.Position, dir, params) then continue end
        end

        local sp, onScreen = cam:WorldToViewportPoint(targetPart.Position)
        if not onScreen or sp.Z <= 0 then continue end

        local dist2D = (Vector2.new(sp.X, sp.Y) - screenCenter).Magnitude
        if dist2D <= fovRadius and dist2D < closestDist then
            closestDist = dist2D
            target = plr
        end
    end

    return target
end

-- Loop do aimbot
RunService.RenderStepped:Connect(function()
    local cam = workspace.CurrentCamera

    -- FOV Circle: raio = state.fov em pixels diretos
    if fovCircle then
        fovCircle.Visible  = state.toggles.SHOWFOV
        fovCircle.Position = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)
        fovCircle.Radius   = state.fov
        fovCircle.Color    = getFovColor()
    end

    -- AIMLOCK
    if state.toggles.AIMLOCK then
        local target = getClosestTargetInFOV()
        if target and target.Character then
            local char = target.Character
            local targetPart = char:FindFirstChild(state.firelockPart)
                or char:FindFirstChild("HumanoidRootPart")
            local myChar = LocalPlayer.Character
            local myHRP  = myChar and myChar:FindFirstChild("HumanoidRootPart")
            if targetPart and myHRP then
                local targetPos = targetPart.Position + Vector3.new(0, 1.5, 0)
                -- 1. Camera mira no alvo
                cam.CFrame = CFrame.new(cam.CFrame.Position, targetPos)
                -- 2. Corpo do player olha para o alvo (horizontal)
                myHRP.CFrame = CFrame.new(myHRP.Position,
                    Vector3.new(targetPos.X, myHRP.Position.Y, targetPos.Z))
                -- 3. Arma aponta para o alvo
                for _, tool in ipairs(myChar:GetChildren()) do
                    if tool:IsA("Tool") then
                        local handle = tool:FindFirstChild("Handle")
                        if handle then
                            handle.CFrame = CFrame.new(handle.Position, targetPos)
                        end
                    end
                end
            end
        end
    end
end)

-- ══════════════════════════════════════════════════════════════════
-- ESP — extraído da versão funcional (CENTRAL.lua)
-- ══════════════════════════════════════════════════════════════════

-- Configurações de escala
local DIST_PERTO = 10
local DIST_LONGE = 400
local ESCALA_MAX = 1.0
local ESCALA_MIN = 0.25

local BB_NAME_W  = 120
local BB_NAME_H  = 20
local BB_RAGE_W  = 100
local BB_RAGE_H  = 16
local OFF_NAME_Y = 2.2
local OFF_RAGE_Y = 3.2

local function getScale(dist)
    local t = 1 - math.clamp((dist - DIST_PERTO) / (DIST_LONGE - DIST_PERTO), 0, 1)
    return ESCALA_MIN + t * (ESCALA_MAX - ESCALA_MIN)
end

local function getEspColor()
    local hex = (state.espColor or "#00FF00"):gsub("#","")
    local r = tonumber(hex:sub(1,2),16) or 0
    local g = tonumber(hex:sub(3,4),16) or 255
    local b = tonumber(hex:sub(5,6),16) or 0
    return Color3.fromRGB(r, g, b)
end

local function hasLOS(fromPos, toPos)
    local params = RaycastParams.new()
    params.FilterDescendantsInstances = {LocalPlayer.Character}
    params.FilterType = Enum.RaycastFilterType.Exclude
    return workspace:Raycast(fromPos, toPos - fromPos, params) == nil
end

local function getCharParts(char)
    if not char then return nil, nil, nil end
    local hrp  = char:FindFirstChild("HumanoidRootPart")
    local head = char:FindFirstChild("Head")
    local hum  = char:FindFirstChildOfClass("Humanoid")
    if not (hrp and head and hum) then return nil, nil, nil end
    return hrp, head, hum
end

local function randName()
    local c = "abcdefghijklmnopqrstuvwxyz"
    local s = ""
    for i = 1, math.random(6,12) do s = s .. c:sub(math.random(1,#c), math.random(1,#c)) end
    return s
end

local function makeBB(adornee, offset, w, h)
    local bb = Instance.new("BillboardGui")
    bb.Name           = randName()
    bb.Adornee        = adornee
    bb.Size           = UDim2.new(0, w, 0, h)
    bb.StudsOffset    = offset
    bb.AlwaysOnTop    = true
    bb.LightInfluence = 0
    bb.ResetOnSpawn   = false
    bb.Parent         = PlayerGui  -- no nosso PlayerGui, não no inimigo
    return bb
end

-- Frame linha 2D para TRACE
local EspContainer = Instance.new("Frame")
EspContainer.Size = UDim2.new(1,0,1,0)
EspContainer.BackgroundTransparency = 1
EspContainer.ZIndex = 1
EspContainer.Parent = ScreenGui

local function drawLine2D(frame, p1, p2, thick)
    local dx = p2.X - p1.X
    local dy = p2.Y - p1.Y
    local len = math.sqrt(dx*dx + dy*dy)
    frame.Position = UDim2.new(0, (p1.X+p2.X)/2 - len/2, 0, (p1.Y+p2.Y)/2 - thick/2)
    frame.Size     = UDim2.new(0, len, 0, thick)
    frame.Rotation = math.deg(math.atan2(dy, dx))
end

local espObjects = {}

local function createEspForPlayer(plr)
    if plr == LocalPlayer then return end
    if espObjects[plr] then return end
    local char = plr.Character
    local hrp, head, hum = getCharParts(char)
    if not hrp then return end

    local obj = {}
    local col = getEspColor()

    -- NAME
    local nameBB = makeBB(head, Vector3.new(0, OFF_NAME_Y, 0), BB_NAME_W, BB_NAME_H)
    local nameLbl = Instance.new("TextLabel")
    nameLbl.Size = UDim2.new(1,0,1,0)
    nameLbl.BackgroundTransparency = 1
    nameLbl.Text = plr.Name
    nameLbl.TextColor3 = Color3.fromRGB(255,255,255)
    nameLbl.TextStrokeTransparency = 0.5
    nameLbl.TextStrokeColor3 = Color3.fromRGB(0,0,0)
    nameLbl.Font = Enum.Font.GothamBold
    nameLbl.TextScaled = true
    nameLbl.Visible = false
    nameLbl.Parent = nameBB
    obj.nameBB = nameBB
    obj.nameLbl = nameLbl

    -- RAGE
    local rageBB = makeBB(head, Vector3.new(0, OFF_RAGE_Y, 0), BB_RAGE_W, BB_RAGE_H)
    local rageLbl = Instance.new("TextLabel")
    rageLbl.Size = UDim2.new(1,0,1,0)
    rageLbl.BackgroundTransparency = 1
    rageLbl.Text = "0m"
    rageLbl.TextColor3 = Color3.fromRGB(255,220,50)
    rageLbl.TextStrokeTransparency = 0.5
    rageLbl.TextStrokeColor3 = Color3.fromRGB(0,0,0)
    rageLbl.Font = Enum.Font.Gotham
    rageLbl.TextScaled = true
    rageLbl.Visible = false
    rageLbl.Parent = rageBB
    obj.rageBB = rageBB
    obj.rageLbl = rageLbl

    -- BOX — Drawing.Quad 4 cantos 3D reais
    local box = Drawing.new("Quad")
    box.Visible = false
    box.Thickness = 1.5
    box.Transparency = 1
    box.Filled = false
    box.Color = col
    obj.box = box

    -- TRACE — Drawing.Line
    local trace = Drawing.new("Line")
    trace.Visible      = false
    trace.Thickness    = 1.2
    trace.Transparency = 1
    trace.ZIndex       = 2
    trace.Color        = col
    obj.trace = trace

    -- LIFE — Drawing.Square
    local lifeBack = Drawing.new("Square")
    lifeBack.Visible   = false
    lifeBack.Thickness = 0
    lifeBack.Filled    = true
    lifeBack.Color     = Color3.fromRGB(15,15,15)
    local lifeBar = Drawing.new("Square")
    lifeBar.Visible   = false
    lifeBar.Thickness = 0
    lifeBar.Filled    = true
    lifeBar.Color     = Color3.fromRGB(30,255,30)
    local lifeText = Drawing.new("Text")
    lifeText.Visible  = false
    lifeText.Center   = true
    lifeText.Outline  = true
    lifeText.Size     = 13
    lifeText.Font     = 2
    lifeText.Color    = Color3.fromRGB(255,255,255)
    obj.lifeBack = lifeBack
    obj.lifeBar  = lifeBar
    obj.lifeText = lifeText

    -- HEAD — Drawing.Circle
    local headCircle = Drawing.new("Circle")
    headCircle.Visible      = false
    headCircle.Thickness    = 1.5
    headCircle.Filled       = true
    headCircle.Transparency = 0.5
    headCircle.Color        = Color3.fromRGB(255,0,0)
    obj.headCircle = headCircle

    espObjects[plr] = obj
end

local function removeEspForPlayer(plr)
    local obj = espObjects[plr]
    if not obj then return end
    pcall(function() obj.nameBB:Destroy()    end)
    pcall(function() obj.rageBB:Destroy()    end)
    pcall(function() obj.box:Remove()        end)
    pcall(function() obj.trace:Remove()      end)
    pcall(function() obj.lifeBack:Remove()   end)
    pcall(function() obj.lifeBar:Remove()    end)
    pcall(function() obj.lifeText:Remove()   end)
    pcall(function() obj.headCircle:Remove() end)
    espObjects[plr] = nil
end

for _, p in ipairs(Players:GetPlayers()) do
    if p ~= LocalPlayer then
        createEspForPlayer(p)
        p.CharacterAdded:Connect(function()
            task.wait(0.3)
            removeEspForPlayer(p)
            createEspForPlayer(p)
        end)
    end
end
Players.PlayerAdded:Connect(function(p)
    p.CharacterAdded:Connect(function()
        task.wait(0.3)
        removeEspForPlayer(p)
        createEspForPlayer(p)
    end)
end)
Players.PlayerRemoving:Connect(removeEspForPlayer)

-- Loop ESP
RunService.RenderStepped:Connect(function()
    local myChar = LocalPlayer.Character
    local myHRP  = myChar and myChar:FindFirstChild("HumanoidRootPart")
    local myPos  = myHRP and myHRP.Position or Vector3.new(0,0,0)

    local anyOn = state.toggles.ESP_NAME  or state.toggles.ESP_BOX  or
                  state.toggles.ESP_TRACE or state.toggles.ESP_RAGE or
                  state.toggles.ESP_LIFE  or state.toggles.ESP_HEAD

    for plr, obj in pairs(espObjects) do
        pcall(function()
            local char = plr.Character
            local hrp, head, hum = getCharParts(char)

            local function hideAll()
                obj.nameLbl.Visible    = false
                obj.rageLbl.Visible    = false
                obj.box.Visible        = false
                obj.trace.Visible      = false
                obj.lifeBack.Visible   = false
                obj.lifeBar.Visible    = false
                obj.lifeText.Visible   = false
                obj.headCircle.Visible = false
            end

            if not anyOn or not hrp or not head or not hum or hum.Health <= 0 then
                hideAll(); return
            end

            local dist  = (hrp.Position - myPos).Magnitude
            local scale = getScale(dist)
            local col   = getEspColor()

            -- NAME
            obj.nameLbl.Visible = state.toggles.ESP_NAME
            if obj.nameLbl.Visible then
                obj.nameBB.Size        = UDim2.new(0, math.max(40, math.floor(BB_NAME_W*scale)), 0, math.max(8, math.floor(BB_NAME_H*scale)))
                obj.nameBB.StudsOffset = Vector3.new(0, OFF_NAME_Y*scale, 0)
                obj.nameLbl.TextColor3 = col
            end

            -- RAGE
            obj.rageLbl.Visible = state.toggles.ESP_RAGE
            if obj.rageLbl.Visible then
                obj.rageBB.Size        = UDim2.new(0, math.max(30, math.floor(BB_RAGE_W*scale)), 0, math.max(6, math.floor(BB_RAGE_H*scale)))
                obj.rageBB.StudsOffset = Vector3.new(0, OFF_RAGE_Y*scale, 0)
                obj.rageLbl.Text       = math.floor(dist) .. "m"
            end

            -- BOX
            if not state.toggles.ESP_BOX then
                obj.box.Visible = false
            else
                local sz  = hrp.Size
                local top = head.Position + Vector3.new(0, head.Size.Y/2, 0)
                local bot = hrp.Position  - Vector3.new(0, sz.Y/2, 0)
                local rx  = sz.X/2
                local rz  = sz.Z/2
                local fwd = hrp.CFrame.LookVector  * rz
                local rgt = hrp.CFrame.RightVector * rx
                local c1  = Camera:WorldToViewportPoint(top + rgt + fwd)
                local c2  = Camera:WorldToViewportPoint(top - rgt + fwd)
                local c3  = Camera:WorldToViewportPoint(bot - rgt - fwd)
                local c4  = Camera:WorldToViewportPoint(bot + rgt - fwd)
                if c1.Z>0 and c2.Z>0 and c3.Z>0 and c4.Z>0 then
                    obj.box.Visible   = true
                    obj.box.Color     = col
                    obj.box.Thickness = math.max(1, 1.5*scale)
                    obj.box.PointA    = Vector2.new(c1.X, c1.Y)
                    obj.box.PointB    = Vector2.new(c2.X, c2.Y)
                    obj.box.PointC    = Vector2.new(c3.X, c3.Y)
                    obj.box.PointD    = Vector2.new(c4.X, c4.Y)
                else
                    obj.box.Visible = false
                end
            end

            -- TRACE — Drawing.Line topo tela → cabeça
            obj.trace.Visible = state.toggles.ESP_TRACE
            if obj.trace.Visible then
                local sp, onScreen = Camera:WorldToViewportPoint(head.Position + Vector3.new(0,0.5,0))
                if onScreen then
                    obj.trace.From      = Vector2.new(Camera.ViewportSize.X/2, 0)
                    obj.trace.To        = Vector2.new(sp.X, sp.Y)
                    obj.trace.Color     = col
                    obj.trace.Thickness = math.max(1, 1.2*scale)
                else
                    obj.trace.Visible = false
                end
            end

            -- LIFE — Drawing.Square com LeftUpperArm como referência
            local lifeOn = state.toggles.ESP_LIFE
            obj.lifeBack.Visible = lifeOn
            obj.lifeBar.Visible  = lifeOn
            obj.lifeText.Visible = lifeOn
            if lifeOn then
                local arm = char:FindFirstChild("LeftUpperArm")
                if arm then
                    local foot2d  = Camera:WorldToViewportPoint(hrp.Position  - Vector3.new(0, hrp.Size.Y/2, 0))
                    local head2d  = Camera:WorldToViewportPoint(head.Position  + Vector3.new(0, head.Size.Y/2, 0))
                    local arm2d, avis = Camera:WorldToViewportPoint(arm.Position)
                    if foot2d.Z > 0 and head2d.Z > 0 and avis then
                        local BAR_W   = math.max(4, math.floor(6*scale))
                        local barX    = arm2d.X + 10
                        local barY1   = head2d.Y
                        local barY2   = foot2d.Y
                        local barH    = barY2 - barY1
                        local percent = math.clamp(hum.Health/hum.MaxHealth, 0, 1)

                        obj.lifeText.Text     = math.floor(percent*100) .. "%"
                        obj.lifeText.Position = Vector2.new(barX + BAR_W/2, barY1 - 18)
                        obj.lifeText.Size     = math.max(8, math.floor(13*scale))

                        obj.lifeBack.Position = Vector2.new(barX, barY1)
                        obj.lifeBack.Size     = Vector2.new(BAR_W, barH)

                        obj.lifeBar.Position  = Vector2.new(barX+2, barY1 + barH*(1-percent))
                        obj.lifeBar.Size      = Vector2.new(BAR_W-4, math.max(0, (barH-4)*percent))
                        local r = math.floor((1-percent)*255)
                        local g = math.floor(percent*220)
                        obj.lifeBar.Color = Color3.fromRGB(r, g, 30)
                    else
                        obj.lifeBack.Visible = false
                        obj.lifeBar.Visible  = false
                        obj.lifeText.Visible = false
                    end
                end
            end

            -- HEAD — Drawing.Circle raio real da cabeça
            obj.headCircle.Visible = state.toggles.ESP_HEAD
            if obj.headCircle.Visible then
                local headSP  = Camera:WorldToViewportPoint(head.Position)
                local headEdge = Camera:WorldToViewportPoint(head.Position + Vector3.new(head.Size.X/2,0,0))
                if headSP.Z > 0 then
                    local radius = math.max(4, math.abs(headEdge.X - headSP.X))
                    obj.headCircle.Position = Vector2.new(headSP.X, headSP.Y)
                    obj.headCircle.Radius   = radius
                    obj.headCircle.Color    = col
                else
                    obj.headCircle.Visible = false
                end
            end
        end)
    end
end)

print("[ShadowMenu] Loaded. INSERT = abrir/fechar")
