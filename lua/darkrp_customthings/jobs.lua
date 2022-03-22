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
    max = 0,
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
    weapons = {"fas2_pp19", "guigui_handcuffs", "stunstick", "fas2_glock20"},
    command = "isec",
    max = 0,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Security",
})


--[[---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------]]
GAMEMODE.DefaultTeam = TEAM_DCLASS
--[[---------------------------------------------------------------------------
Define which teams belong to civil protection
Civil protection can set warrants, make people wanted and do some other police related things
---------------------------------------------------------------------------]]
GAMEMODE.CivilProtection = {
}
--[[---------------------------------------------------------------------------
Jobs that are hitmen (enables the hitman menu)
---------------------------------------------------------------------------]]
