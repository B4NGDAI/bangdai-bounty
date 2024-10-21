Config = {}

Config.Debug = false


--bountyhunter
Config.Price = math.random(15, 55)

Config.LocationsB = {
	{ name = 'Bounty Hunter 1', coords = vector3(-767.144, -1261.2151, 43.6312),    showblip = true }, --st denis
	{ name = 'Bounty Hunter 2', coords = vector3(1361.6379, -1302.7885, 77.9819),   showblip = true }, -- river
	{ name = 'Bounty Hunter 3', coords = vector3(2506.6553, -1308.7885, 49.1537),   showblip = true }, -- river
	{ name = 'Bounty Hunter 4', coords = vector3(-3623.2725, -2602.3633, -13.1425), showblip = true }, -- river
	{ name = 'Bounty Hunter 5', coords = vector3(-5531.356, -2930.1831, -1.1609),   showblip = true }, -- river
	{ name = 'Bounty Hunter 6', coords = vector3(-1808.9441, -349.0126, 164.8494),  showblip = true }, -- river
	{ name = 'Bounty Hunter 7', coords = vector3(-2205.23, 712.50, 122.92),         showblip = true }, -- river
	{ name = 'Bounty Hunter 8', coords = vector3(2908.1873, 1312.6338, 45.1383),    showblip = true }, -- river
	{ name = 'Bounty Hunter 9', coords = vector3(-272.51, 804.88, 119.32),          showblip = true }, -- river
}

Config.BlipBounty = {
    blipName = 'Bounty Hunter', -- Config.Blip.blipName
    blipScale = 0.2 -- Config.Blip.blipScale
}

Config.BountyLocation = {
    coords = {
        vec3(-30.77, 1226.8, 172.92),
        vec3(-44.28, 1227.53, 172.14),
        vec3(-19.86, 1233.89, 173.16),
        vec3(-24.39,  1228.36, 173.12),
    },
    coords2 = {
        vec3(489.53, 619.81, 111.7),
        vec3(516.53, 621.81, 111.7),
    },
    coords3 = {
        vec3(-423.75, 1736.52, 216.56),
        vec3(-397.92, 1726.46, 216.43),
    },
}

Config.weapons = {
	{hash = 0x772C8DD6},
	{hash = 0x169F59F7},
	{hash = 0xDB21AC8C},
	{hash = 0x6DFA071B},
	{hash = 0xF5175BA1},
	{hash = 0xD2718D48},
	{hash = 0x797FBF5},
	{hash = 0x772C8DD6},
	{hash = 0x7BBD1FF6},
	{hash = 0x63F46DE6},
	{hash = 0xA84762EC},
	{hash = 0xDDF7BC1E},
	{hash = 0x20D13FF},
	{hash = 0x1765A8F8},
	{hash = 0x657065D6},
	{hash = 0x8580C63E},
	{hash = 0x95B24592},
	{hash = 0x31B7B9FE},
	{hash = 0x88A8505C},
	{hash = 0x1C02870C},
	{hash = 0x28950C71},
	{hash = 0x6DFA071B},
}

Config.models = {
	{hash = "U_M_M_HtlRancherBounty_01"},
	{hash = "U_M_M_NbxBankerBounty_01"},
	{hash = "U_M_M_UniExConfedsBounty_01"},
	{hash = "A_M_M_BlWLaborer_01"},
	{hash = "A_M_M_BynSurvivalist_01"},
	{hash = "A_M_M_GriSurvivalist_01"},
	{hash = "A_M_M_huntertravelers_cool_01"},
	{hash = "A_M_M_NbxLaborers_01"},
	{hash = "A_M_M_RkrFancyTravellers_01"},
	{hash = "A_M_M_SDChinatown_01"},
	{hash = "A_M_M_SkpPrisoner_01"},
	{hash = "A_M_M_SmHThug_01"},
	{hash = "G_M_M_UniAfricanAmericanGang_01"},
	{hash = "G_M_M_UniBanditos_01"},
	{hash = "G_M_M_UniCriminals_01"},
	{hash = "u_m_m_bht_banditoshack"},
	{hash = "MP_LBM_CARMELA_BANDITOS_01"},
	{hash = "u_m_m_bht_banditomine"},
	{hash = "MP_G_M_M_UniBanditos_01"},
}