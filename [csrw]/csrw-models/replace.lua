--[[
	Counter Strike: RenderWare model/texture replace script
]]--

local skins = {
	-- terrorists
	{"tt/1", 101},
	{"tt/2", 102},
	{"tt/3", 103},
	{"tt/4", 104},

	-- counter terrorists
	{"ct/1", 105},
	{"ct/2", 106},
	{"ct/3", 107},
	{"ct/4", 108}

	-- zombies
	--{"zombie/1", 201},
	--{"zombie/2", 202},
	--{"zombie/3", 203},
	--{"zombie/1", 204}
}

local weapons = {
	{"knifecur", 335},
	{"colt45", 346},
	{"desert_eagle", 348},
	{"shotgspa", 351},
	{"micro_uzi", 352},
	{"mp5lng", 353},
	{"tec9", 372}, -- before [?] update replacing this model crashes game
	{"ak47", 355},
	{"m4", 356},
	{"cuntgun", 357},
	{"sniper", 358},
	{"grenade", 342},
	{"teargas", 343}
	--{"molotov", 344}
	--{"portalgun", 359}
}

local other = {
	-- barrels
	{"objects/barrels/barrel1", "objects/barrels/barrel", 1225}, -- explodable
	{"objects/barrels/barrel2", "objects/barrels/barrel", 935}

	-- lights
	--{"lights/LightBeams", "lights/LightBeamWhite", 911},
	--{"lights/LightBeams", "lights/LightBeamRed", 912},
	--{"lights/LightBeams", "lights/LightBeamBlue", 913}
	-- NO
}

addEventHandler("onClientResourceStart", resourceRoot,
	function()
		for k, v in pairs(skins) do
			local txd = engineLoadTXD("skins/" .. v[1] .. ".txd")
			engineImportTXD(txd, v[2])
			local dff = engineLoadDFF("skins/" .. v[1] .. ".dff", v[2])
			engineReplaceModel(dff, v[2])
		end

		for k, v in pairs(weapons) do
			local txd = engineLoadTXD("objects/weapons/" .. v[1] .. ".txd")
			engineImportTXD(txd, v[2])
			local dff = engineLoadDFF("objects/weapons/" .. v[1] .. ".dff", v[2])
			engineReplaceModel(dff, v[2])
		end

		for k, v in pairs(other) do
			local txd = engineLoadTXD(v[1] .. ".txd")
			engineImportTXD(txd, v[3])
			local dff = engineLoadDFF(v[2] .. ".dff", v[3])
			engineReplaceModel(dff, v[3])
		end
		
		-- crosshairs
		local shader_normalCrosshair = dxCreateShader("replaceTexture.fx")
		dxSetShaderValue(shader_normalCrosshair, "shaderTexture", dxCreateTexture("crosshairs/normal.png"))
		engineApplyShaderToWorldTexture(shader_normalCrosshair, "siteM16")
		
		local shader_sniperCrosshair = dxCreateShader("replaceTexture.fx")
		dxSetShaderValue(shader_sniperCrosshair, "shaderTexture", dxCreateTexture("crosshairs/sniper.png"))
		engineApplyShaderToWorldTexture(shader_sniperCrosshair, "SNIPERcrosshair")
		
		-- effects
		local dff = engineLoadDFF("effects/carwashspray.dff", 915)
		engineReplaceModel(dff, 915)

		local shader_smokeEffect = dxCreateShader("replaceTexture.fx")
		dxSetShaderValue(shader_smokeEffect, "shaderTexture", dxCreateTexture("effects/bullethitsmoke.png") ) -- smoke grenade effect
		engineApplyShaderToWorldTexture(shader_smokeEffect, "bullethitsmoke")

		-- other
		local shader_valve = dxCreateShader("replaceTexture.fx")
		dxSetShaderValue(shader_valve, "shaderTexture", dxCreateTexture("objects/valve.png") ) -- valve texture
		engineApplyShaderToWorldTexture(shader_valve, "metalwheel4_128")
	end
)