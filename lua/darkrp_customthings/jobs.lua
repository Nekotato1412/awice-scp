--[[---------------------------------------------------------------------------
DarkRP custom jobs
---------------------------------------------------------------------------
This file contains your custom jobs.
This file should also contain jobs from DarkRP that you edited.

Note: If you want to edit a default DarkRP job, first disable it in darkrp_config/disabled_defaults.lua
      Once you've done that, copy and paste the job to this file and edit it.

The default jobs can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/jobrelated.lua

For examples and explanation please visit this wiki page:
https://darkrp.miraheze.org/wiki/DarkRP:CustomJobFields

Add your custom jobs under the following line:
---------------------------------------------------------------------------]]

------
TEAM_CHOOSE = DarkRP.createJob("Choose a Job", {
    color = Color(0, 247, 140, 255),
    model = {
        "models/player/skeleton.mdl"
    },
    description = [[Welcome to the foundation, choose a job.]],
    weapons = {},
    command = "choose",
    max = 0,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Other",
})

TEAM_DCLASS = DarkRP.createJob("Class D", {
    color = Color(0, 247, 140, 255),
    model = {
        "models/player/1000shells/class_d_white.mdl",
        "models/player/1000shells/class_d_black.mdl",
        "models/player/1000shells/class_d_asian.mdl"
    },
    description = [[Class D are death row inmates picked by the foundation for testing. They are also known as Disposables.]],
    weapons = {},
    command = "dclass",
    max = 24,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Personnel",
})

TEAM_ISEC = DarkRP.createJob("Internal Security", {
    color = Color(4, 206, 237, 255),
    model = {
        "models/player/scp_guard.mdl"
    },
    description = [[The guards of the facility. Their job is to manage D Class and ensure SCPs do not escape.]],
    weapons = {"fas2_pp19", "guigui_handcuffs", "stunstick", "fas2_glock20", "guthscp_keycard_lvl_2"},
    command = "isec",
    max = 12,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Security",
    PlayerSpawn = function(ply)
        ply:SetHealth(110)
        ply:SetMaxHealth(110)
    end,
    customCheck = function(ply)
        return ply:GetUserGroup() == "security"
    end,
    CustomCheckFailMsg = "You are not whitelisted.",
})

TEAM_RSEC = DarkRP.createJob("Riot Security", {
  color = Color(0, 0, 0, 255),
  model = {
      "models/player/gacommissions/juggernaut.mdl"
  },
  description = [[The riot guards. They come in when the D Class get out of hand.]],
  weapons = {"riot_shield", "stunstick", "guigui_handcuffs", "swep_smokenade", "guthscp_keycard_lvl_2"},
  command = "rsec",
  max = 6,
  salary = 0,
  admin = 0,
  vote = false,
  hasLicense = false,
  candemote = false,
  category = "Security",
  modelScale = 1.1,
  PlayerSpawn = function(ply)
      ply:SetHealth(125)
      ply:SetMaxHealth(125)
  end,

  customCheck = function(ply)
      return ply:GetUserGroup() == "riot"
  end,
  CustomCheckFailMsg = "You are not whitelisted.",
})

TEAM_ESEC = DarkRP.createJob("External Security", {
    color = Color(4, 206, 237, 255),
    model = {
        "models/acient_pmc_snow.mdl"
    },
    description = [[External Security are Security Guards posing as military to ensure the exterior is secured.]],
    weapons = {"fas2_ak47", "guigui_handcuffs", "fas2_dv2", "fas2_m1911", "guthscp_keycard_lvl_2"},
    command = "esec",
    max = 12,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Security",
    PlayerSpawn = function(ply)
        ply:SetHealth(110)
        ply:SetMaxHealth(110)
    end,

    customCheck = function(ply)
        return ply:GetUserGroup() == "security"
    end,
    CustomCheckFailMsg = "You are not whitelisted.",
})

TEAM_RESEARCHER = DarkRP.createJob("Researcher", {
    color = Color(4, 206, 237, 255),
    model = {
        "models/player/apsci_male_01.mdl",
        "models/player/apsci_male_02.mdl",
        "models/player/apsci_male_03.mdl",
        "models/player/apsci_male_04.mdl",
        "models/player/apsci_male_05.mdl",
        "models/player/apsci_male_06.mdl",
        "models/player/apsci_male_07.mdl",
        "models/player/apsci_male_08.mdl",
        "models/player/apsci_male_09.mdl"
    },
    description = [[Researchers are the backbone of the foundation, they answer questions you may have.]],
    weapons = {"guthscp_keycard_lvl_2"},
    command = "res",
    max = 12,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Research",
    customCheck = function(ply)
        return ply:GetUserGroup() == "research"
    end,
    CustomCheckFailMsg = "You are not whitelisted.",
})

TEAM_TRO = DarkRP.createJob("Tactical Response Officer", {
    color = Color(4, 206, 237, 255),
    model = {
        "models/scp_mtf_russian/mtf_rus_02.mdl"
    },
    description = [[Tactical Response Officers respond to GOI threats or other emergencies.]],
    weapons = {"fas2_sg552", "guigui_handcuffs", "fas2_dv2", "fas2_m1911", "guthscp_keycard_lvl_4"},
    command = "tro",
    max = 24,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Squads",
    PlayerSpawn = function(ply)
        ply:SetHealth(110)
        ply:SetMaxHealth(110)
    end,
    customCheck = function(ply)
        return ply:GetUserGroup() == "tro"
    end,
    CustomCheckFailMsg = "You are not whitelisted.",
})




--[[---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------]]
GAMEMODE.DefaultTeam = TEAM_CHOOSE
--[[---------------------------------------------------------------------------
Define which teams belong to civil protection
Civil protection can set warrants, make people wanted and do some other police related things
---------------------------------------------------------------------------]]
GAMEMODE.CivilProtection = {
}
--[[---------------------------------------------------------------------------
Jobs that are hitmen (enables the hitman menu)
---------------------------------------------------------------------------]]
