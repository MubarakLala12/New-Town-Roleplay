resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

description 'CTRP:Ignore'

server_scripts {
	"server/main.lua",
	"server/trunk.lua",
	"server/consumables.lua",
	"server/hostage.lua",
	"server/sv_slashtires.lua",
	"server/sv_yoga.lua",
	"server/sv_vape.lua",
	"server/sv_logout.lua",
	--"server/sv_seize.lua",
	"config.lua",
}

client_scripts {
	"config.lua",
	"client/main.lua",
	"client/fireworks.lua",
	"client/binoculars.lua",
	"client/ignore.lua",
	"client/density.lua",
	"client/weapdraw.lua",
	"client/hudcomponents.lua",
	"client/seatbelt.lua",
	"client/cruise.lua",
	"client/recoil.lua",
	"client/removeentities.lua",
	"client/crouchprone.lua",
	"client/tackle.lua",
	"client/consumables.lua",
	"client/discord.lua",
	"client/point.lua",
	'client/engine.lua',
	"client/drift.lua",
	"client/teleports.lua",
	"client/nos.lua",
	"client/hostage.lua",
	"client/scaleform.lua",
	"client/cl_slashtires.lua",
	"client/virus.lua",
	"client/givecash.lua",
	"client/server_name.lua",
	"client/cl_weapons-on-back.lua",
	"client/cl_yoga.lua",
	"client/cl_vape.lua",
	"client/cl_logout.lua",
	--"client/cl_seize.lua",
	"client/cl_securitycam.lua",
	"client/gym_cl.lua",
	--"client/taxes.lua",
	"client/cayo_perico.lua",
	"client/tazereffect.lua",
	"client/driveby.lua",
}

--[[data_file 'FIVEM_LOVES_YOU_4B38E96CC036038F' 'events.meta'
data_file 'FIVEM_LOVES_YOU_341B23A2F0E0F131' 'popgroups.ymt'

files {
	'events.meta',
	'popgroups.ymt',
	'relationships.dat',
}]]

exports {
	'HasHarness'
}