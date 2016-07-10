-------------------------------------------------------------------------------
-- Localized Lua globals.
-------------------------------------------------------------------------------
local _G = getfenv(0)

-------------------------------------------------------------------------------
-- Module namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private = ...

local addon = private.addon
if not addon then
	return
end

local constants = addon.constants
local module = addon:GetModule(private.module_name)

local Z = constants.ZONE_NAMES

-----------------------------------------------------------------------
-- What we _really_ came here to see...
-----------------------------------------------------------------------
function module:InitializeQuests()
	local function AddQuest(questID, zoneName, coordX, coordY, faction)
		addon.AcquireTypes.Quest:AddEntity(module, {
			coord_x = coordX,
			coord_y = coordY,
			faction = faction,
			identifier = questID,
			item_list = {},
			location = zoneName,
			name = nil, -- Handled by memoizing table in the core.
		})
	end

	AddQuest(39175,		Z.FROSTWALL,		42.0,	55.0,	"Horde")
	AddQuest(39195,		Z.LUNARFALL,		32.0,	31.4,	"Alliance")
	AddQuest(40532,		Z.DALARAN_BROKENISLES,	0.0,	0.0,	"Neutral") -- Needs updating

	self.InitializeQuests = nil
end
