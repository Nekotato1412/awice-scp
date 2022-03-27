local hideHUDElements = {
    -- if you DarkRP_HUD this to true, ALL of DarkRP's HUD will be disabled. That is the health bar and stuff,
    -- but also the agenda, the voice chat icons, lockdown text, player arrested text and the names above players' heads
    ["DarkRP_HUD"] = false,

    -- DarkRP_EntityDisplay is the text that is drawn above a player when you look at them.
    -- This also draws the information on doors and vehicles
    ["DarkRP_EntityDisplay"] = false,

    -- This is the one you're most likely to replace first
    -- DarkRP_LocalPlayerHUD is the default HUD you see on the bottom left of the screen
    -- It shows your health, job, salary and wallet, but NOT hunger (if you have hungermod enabled)
    ["DarkRP_LocalPlayerHUD"] = true,

    -- If you have hungermod enabled, you will see a hunger bar in the DarkRP_LocalPlayerHUD
    -- This does not get disabled with DarkRP_LocalPlayerHUD so you will need to disable DarkRP_Hungermod too
    ["DarkRP_Hungermod"] = false,

    -- Drawing the DarkRP agenda
    ["DarkRP_Agenda"] = false,

    -- Lockdown info on the HUD
    ["DarkRP_LockdownHUD"] = false,

    -- Arrested HUD
    ["DarkRP_ArrestedHUD"] = false,

    -- Chat receivers box when you open chat or speak over the microphone
    ["DarkRP_ChatReceivers"] = false,

    ["CHudHealth"] = true,
    ["CHudBattery"] = true,
    ["CHudSuitPower"] = true
}

local textOpacity = 155

local HealthStatus = {
  {
    ["text"] = "Mildly Injured",
    ["color"] = Color(252, 240, 22, textOpacity)
  },
  {
    ["text"] = "Moderately Injured",
    ["color"] = Color(252, 127, 22, textOpacity)
  },
  {
    ["text"] = "Severely Injured",
    ["color"] = Color(252, 22, 22, textOpacity)
  },
  {
    ["text"] = "Near Death",
    ["color"] = Color(30, 0, 0, textOpacity)
  },
}

-- local ArmorStatus = {
--   "Mildly Damaged",
--   "Moderately Damaged",
--   "Severely Damaged",
--   "Ineffective"
-- }

-- this is the code that actually disables the drawing.
hook.Add("HUDShouldDraw", "HideDarkRPHUD", function(name)
    if hideHUDElements[name] then return false end
end)

local x, y = 4, ScrH() - 20
local health = 0

function DrawHealth()
    surface.SetFont("DermaLarge")
    local lplr = LocalPlayer()
    local status = false
    health = lplr:Health()

    if health < 100 and health > 75 then status = HealthStatus[1]
    elseif health < 100 and health <= 75 and health > 50 then status = HealthStatus[2]
    elseif health < 100 and health <= 50 and health > 25 then status = HealthStatus[3]
    elseif health <= 25 then status = HealthStatus[4] end

    if status ~= false then
        surface.SetTextColor(status.color)
        local tw, th = surface.GetTextSize(status.text)
        surface.SetTextPos(x + tw / 4, y - th)
        surface.DrawText(status.text)
    end
end

hook.Add("HUDPaint", "ScpContextualHealth", DrawHealth)
