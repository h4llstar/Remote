-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-04-10 02:16:13
-- Luau version 6, Types version 3
-- Time taken: 0.020852 seconds

local module = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Flamework_upvr = module.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local any_import_result1_2 = module.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local MathExtras_upvr = any_import_result1_2.MathExtras
local SoundManager_upvr = any_import_result1_2.SoundManager
local any_import_result1_5 = module.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local KnitClient_upvr_2 = any_import_result1_5.KnitClient
local KnitClient_upvr = any_import_result1_5.KnitClient
local any_import_result1_3_upvr = module.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local any_import_result1_upvr = module.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local any_import_result1_4 = module.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local Players_upvr = any_import_result1_4.Players
local ReplicatedStorage_upvr = any_import_result1_4.ReplicatedStorage
local RunService_upvr = any_import_result1_4.RunService
local Workspace_upvr = any_import_result1_4.Workspace
local AbilityId_upvr = module.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local BedwarsKitSkinMeta_upvr = module.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local BedwarsKit_upvr = module.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local any_import_result1 = module.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "summoner", "summoner-kit-util")
local summoner_getPlayerSpellLevel_upvr = any_import_result1.summoner_getPlayerSpellLevel
local summoner_getTotalCastTimeRequired_upvr = any_import_result1.summoner_getTotalCastTimeRequired
local HalloweenAbilityType_upvr = module.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-ability-type").HalloweenAbilityType
local HalloweenAbilityUtil_upvr = module.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-ability-util").HalloweenAbilityUtil
local HalloweenBalanceConfig_upvr = module.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-balance-config").HalloweenBalanceConfig
local BedwarsImageId_upvr = module.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local GameSound_upvr = module.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local validatePlayerKit_upvr = module.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").validatePlayerKit
local BaseKitController_upvr = module.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local setmetatable_result1_2_upvw = setmetatable({}, {
	__tostring = function() -- Line 48, Named "__tostring"
		return "SummonerKitController"
	end;
	__index = BaseKitController_upvr;
})
setmetatable_result1_2_upvw.__index = setmetatable_result1_2_upvw
function setmetatable_result1_2_upvw.new(...) -- Line 54
	--[[ Upvalues[1]:
		[1]: setmetatable_result1_2_upvw (read and write)
	]]
	local setmetatable_result1 = setmetatable({}, setmetatable_result1_2_upvw)
	return setmetatable_result1:constructor(...) or setmetatable_result1
end
function setmetatable_result1_2_upvw.constructor(arg1) -- Line 58
	--[[ Upvalues[4]:
		[1]: BaseKitController_upvr (readonly)
		[2]: BedwarsKit_upvr (readonly)
		[3]: GameSound_upvr (readonly)
		[4]: any_import_result1_3_upvr (readonly)
	]]
	BaseKitController_upvr.constructor(arg1, BedwarsKit_upvr.SUMMONER, {
		sounds = {GameSound_upvr.SUMMONER_SUMMON_CHANNEL_LOOP, GameSound_upvr.SUMMONER_SUMMON_FINISH, GameSound_upvr.SUMMONER_CLAW_ATTACK_1, GameSound_upvr.SUMMONER_CLAW_ATTACK_2, GameSound_upvr.SUMMONER_CLAW_ATTACK_3, GameSound_upvr.SUMMONER_CLAW_ATTACK_4};
	})
	arg1.Name = "SummonerKitController"
	arg1.localChargingMaid = any_import_result1_3_upvr.new()
	arg1.levelUpUiMaid = any_import_result1_3_upvr.new()
	arg1.initializedUI = false
	arg1.playerCastingDataMap = {}
	arg1.debugging = false
end
function setmetatable_result1_2_upvw.KnitStart(arg1) -- Line 69
	--[[ Upvalues[1]:
		[1]: BaseKitController_upvr (readonly)
	]]
	BaseKitController_upvr.KnitStart(arg1)
end
local ClientSyncEvents_upvr = module.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local EntityUtil_upvr = module.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local MatchState_upvr = module.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local WatchCharacter_upvr = any_import_result1_2.WatchCharacter
function setmetatable_result1_2_upvw.onKitLocalActivated(arg1, arg2) -- Line 72
	--[[ Upvalues[9]:
		[1]: ClientSyncEvents_upvr (readonly)
		[2]: AbilityId_upvr (readonly)
		[3]: EntityUtil_upvr (readonly)
		[4]: validatePlayerKit_upvr (readonly)
		[5]: BedwarsKit_upvr (readonly)
		[6]: KnitClient_upvr_2 (readonly)
		[7]: MatchState_upvr (readonly)
		[8]: WatchCharacter_upvr (readonly)
		[9]: Players_upvr (readonly)
	]]
	arg2:GiveTask(ClientSyncEvents_upvr.CanUseLocalAbility:connect(function(arg1_2) -- Line 73
		--[[ Upvalues[6]:
			[1]: AbilityId_upvr (copied, readonly)
			[2]: EntityUtil_upvr (copied, readonly)
			[3]: validatePlayerKit_upvr (copied, readonly)
			[4]: BedwarsKit_upvr (copied, readonly)
			[5]: KnitClient_upvr_2 (copied, readonly)
			[6]: MatchState_upvr (copied, readonly)
		]]
		if arg1_2.ability == AbilityId_upvr.SUMMONER_START_CHARGING or arg1_2.ability == AbilityId_upvr.SUMMONER_FINISH_CHARGING then
			local any_getPlayerFromEntityInstance_result1 = EntityUtil_upvr:getPlayerFromEntityInstance(arg1_2.userCharacter)
			if not any_getPlayerFromEntityInstance_result1 then
				arg1_2:setCancelled(true)
				return nil
			end
			if not validatePlayerKit_upvr(any_getPlayerFromEntityInstance_result1, BedwarsKit_upvr.SUMMONER) then
				arg1_2:setCancelled(true)
				return nil
			end
			local any_getEntity_result1 = EntityUtil_upvr:getEntity(arg1_2.userCharacter)
			if not any_getEntity_result1 then
				arg1_2:setCancelled(true)
				return nil
			end
			if not any_getEntity_result1:isAlive() then
				arg1_2:setCancelled(true)
				return nil
			end
			if KnitClient_upvr_2.Controllers.MatchController:getMatchState() ~= MatchState_upvr.RUNNING then
				arg1_2:setCancelled(true)
				return nil
			end
		end
	end))
	arg2:GiveTask(WatchCharacter_upvr(function(arg1_3, arg2_2, arg3) -- Line 104
		--[[ Upvalues[4]:
			[1]: Players_upvr (copied, readonly)
			[2]: validatePlayerKit_upvr (copied, readonly)
			[3]: BedwarsKit_upvr (copied, readonly)
			[4]: arg1 (readonly)
		]]
		if arg1_3 ~= Players_upvr.LocalPlayer then
			return nil
		end
		if not validatePlayerKit_upvr(arg1_3, BedwarsKit_upvr.SUMMONER) then
			return nil
		end
		arg1:initializePlayer()
	end))
end
function setmetatable_result1_2_upvw.onKitLocalDeactivated(arg1) -- Line 114
	--[[ Upvalues[1]:
		[1]: Players_upvr (readonly)
	]]
	arg1.levelUpUiMaid:DoCleaning()
	arg1.playerCastingDataMap[Players_upvr.LocalPlayer] = nil
	local abilityRef = arg1.abilityRef
	if abilityRef ~= nil then
		abilityRef.Destroy()
	end
	arg1.abilityRef = nil
	arg1.localChargingMaid:DoCleaning()
	arg1.initializedUI = false
end
local default_upvr = module.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
function setmetatable_result1_2_upvw.onKitReplicationActivated(arg1, arg2) -- Line 127
	--[[ Upvalues[1]:
		[1]: default_upvr (readonly)
	]]
	arg2:GiveTask(default_upvr.Client:Get("SummonerStartSummonSpellFromServer"):Connect(function(arg1_4) -- Line 129
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1:startChargingSummon(arg1_4.player, arg1_4.startTime)
	end))
	arg2:GiveTask(default_upvr.Client:Get("SummonerFinishSummonSpellFromServer"):Connect(function(arg1_5) -- Line 133
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1:finishChargingSummon(arg1_5.player, arg1_5.tier)
	end))
	arg2:GiveTask(default_upvr.Client:Get("SummonerDeath"):Connect(function(arg1_6) -- Line 137
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		return arg1:cancelSummon(arg1_6.player)
	end))
	arg2:GiveTask(default_upvr.Client:Get("SummonerCancelSummon"):Connect(function(arg1_7) -- Line 141
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)īīī
		]]
		return arg1:cancelSummon(arg1_7.player)
	end))
end
function setmetatable_result1_2_upvw.onKitReplicationDeactivated(arg1) -- Line 145
end
function setmetatable_result1_2_upvw.onInnateAbilityEnabled(arg1, arg2, arg3) -- Line 147
end
function setmetatable_result1_2_upvw.onAbilityUsed(arg1, arg2, arg3) -- Line 149
end
local SummonerKitLevelUI_upvr = module.import(script, script.Parent, "ui", "summoner-kit-level-ui").SummonerKitLevelUI
function setmetatable_result1_2_upvw.initializePlayer(arg1) -- Line 151
	--[[ Upvalues[3]:
		[1]: Flamework_upvr (readonly)
		[2]: any_import_result1_upvr (readonly)
		[3]: SummonerKitLevelUI_upvr (readonly)
	]]
	arg1.localChargingMaid:DoCleaning()
	arg1:enableStartChargingAbility()
	if not arg1.initializedUI then
		arg1.initializedUI = true
		arg1.levelUpUiMaid:GiveTask(Flamework_upvr.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(any_import_result1_upvr.createElement(SummonerKitLevelUI_upvr)))
	end
end
local ActionUtil_upvr = module.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "util", "action-util").ActionUtil
local SummonerKitCastBarUI_upvr = module.import(script, script.Parent, "ui", "summoner-kit-cast-bar-ui").SummonerKitCastBarUI
function setmetatable_result1_2_upvw.startChargingSummon(arg1, arg2, arg3) -- Line 160
	--[[ Upvalues[10]:
		[1]: Players_upvr (readonly)
		[2]: KnitClient_upvr (readonly)
		[3]: KnitClient_upvr_2 (readonly)
		[4]: ActionUtil_upvr (readonly)
		[5]: AbilityId_upvr (readonly)
		[6]: summoner_getPlayerSpellLevel_upvr (readonly)
		[7]: Flamework_upvr (readonly)
		[8]: any_import_result1_upvr (readonly)
		[9]: SummonerKitCastBarUI_upvr (readonly)
		[10]: summoner_getTotalCastTimeRequired_upvr (readonly)
	]]
	if arg2 == Players_upvr.LocalPlayer then
		local any_addModifier_result1_upvr = KnitClient_upvr.Controllers.SprintController:getMovementStatusModifier():addModifier({
			blockSprint = false;
			moveSpeedMultiplier = 0.85;
		})
		local any_addModifier_result1_upvr_2 = KnitClient_upvr_2.Controllers.JumpHeightController:getJumpModifier():addModifier({
			jumpHeightMultiplier = 0;
		})
		arg1.localChargingMaid:GiveTask(function() -- Line 172
			--[[ Upvalues[2]:
				[1]: any_addModifier_result1_upvr (readonly)
				[2]: any_addModifier_result1_upvr_2 (readonly)
			]]
			any_addModifier_result1_upvr.Destroy()
			any_addModifier_result1_upvr_2.Destroy()
		end)
		local tbl_3 = {}
		tbl_3.player = arg2
		tbl_3.disableSword = true
		tbl_3.disableAbilities = true
		tbl_3.enabledAbilityOverrides = {AbilityId_upvr.SUMMONER_FINISH_CHARGING}
		tbl_3.disableBlockPlacement = true
		tbl_3.disableBlockBreaking = true
		tbl_3.disableAiming = true
		tbl_3.disableConsumingItems = true
		arg1.localChargingMaid:GiveTask(ActionUtil_upvr:disableActions(tbl_3))
		task.delay(0.25, function() -- Line 188
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:enableFinishChargingAbility()
		end)
		local var20_result1 = summoner_getPlayerSpellLevel_upvr(arg2)
		if var20_result1 == nil then
			var20_result1 = 1
		end
		local var60 = var20_result1
		local tbl_8 = {
			Size = UDim2.fromScale(var60 / 4, 0.03);
		}
		tbl_8.StartTime = arg3
		tbl_8.EndTime = arg3 + summoner_getTotalCastTimeRequired_upvr(var60)
		tbl_8.HideOnComplete = true
		tbl_8.ProgressBarConfig = {
			Flip = false;
			BarGradient = ColorSequence.new(Color3.fromRGB(74, 20, 92), Color3.fromRGB(140, 36, 120));
			GradientRotation = 0;
		}
		tbl_8.PlayerSpellLevel = var60
		arg1.localChargingMaid:GiveTask(Flamework_upvr.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(any_import_result1_upvr.createElement(SummonerKitCastBarUI_upvr, tbl_8)))
	end
	any_addModifier_result1_upvr = arg1:createExpandingMagicCircle
	any_addModifier_result1_upvr(arg2, arg3)
end
local summoner_getPlayerSpellData_upvr = any_import_result1.summoner_getPlayerSpellData
local SummonerKitBalance_upvr = module.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "summoner", "summoner-kit-balance").SummonerKitBalance
function setmetatable_result1_2_upvw.createExpandingMagicCircle(arg1, arg2, arg3) -- Line 216
	--[[ Upvalues[17]:
		[1]: ReplicatedStorage_upvr (readonly)
		[2]: KnitClient_upvr_2 (readonly)
		[3]: BedwarsKitSkinMeta_upvr (readonly)
		[4]: Workspace_upvr (readonly)
		[5]: KnitClient_upvr (readonly)
		[6]: RunService_upvr (readonly)
		[7]: summoner_getPlayerSpellData_upvr (readonly)
		[8]: summoner_getPlayerSpellLevel_upvr (readonly)
		[9]: summoner_getTotalCastTimeRequired_upvr (readonly)
		[10]: SummonerKitBalance_upvr (readonly)
		[11]: HalloweenAbilityUtil_upvr (readonly)
		[12]: HalloweenAbilityType_upvr (readonly)
		[13]: HalloweenBalanceConfig_upvr (readonly)
		[14]: MathExtras_upvr (readonly)
		[15]: any_import_result1_3_upvr (readonly)
		[16]: SoundManager_upvr (readonly)
		[17]: GameSound_upvr (readonly)
	]]
	local Character_4 = arg2.Character
	if Character_4 ~= nil then
		Character_4 = Character_4.PrimaryPart
	end
	local var93_upvr = Character_4
	if not var93_upvr then
		return nil
	end
	local Summoner_SummonCircle_2 = ReplicatedStorage_upvr.Assets.Misc.Kaida.Summoner_SummonCircle
	local Character_2 = arg2.Character
	if Character_2 then
		local kaida_3 = BedwarsKitSkinMeta_upvr[KnitClient_upvr_2.Controllers.KitSkinController:getKitSkin(Character_2)].kaida
		if kaida_3 ~= nil then
			kaida_3 = kaida_3.dragon_head
		end
		if kaida_3 then
			Summoner_SummonCircle_2 = ReplicatedStorage_upvr.Assets.Misc.Kaida.Witch_Summoner_SummonCircle
		end
	end
	local clone_upvr_2 = Summoner_SummonCircle_2:Clone()
	clone_upvr_2.Parent = Workspace_upvr
	if KnitClient_upvr.Controllers.SummonerKitSkinController:isPrismaticSkin(arg2) then
		KnitClient_upvr_2.Controllers.SummonerKitSkinController:applyCircleRGB(clone_upvr_2)
	end
	if RunService_upvr:IsStudio() and arg1.debugging then
		clone_upvr_2.Pivot.DebugCircle.Transparency = 0
	end
	local var98 = arg1.playerCastingDataMap[arg2]
	if var98 then
		var98.castingMaid:DoCleaning()
		arg1.playerCastingDataMap[arg2] = nil
	end
	local cframe_upvw_2 = CFrame.new(var93_upvr.Position - Vector3.new(0, 3, 0))
	clone_upvr_2:PivotTo(cframe_upvw_2)
	local var20_result1_2 = summoner_getPlayerSpellLevel_upvr(arg2)
	if var20_result1_2 == nil then
		var20_result1_2 = 1
	end
	local maxRadius_upvw = summoner_getPlayerSpellData_upvr(arg2).maxRadius
	if HalloweenAbilityUtil_upvr:matchIsHalloweenEvent() then
		local any_getAbilityStacks_result1 = HalloweenAbilityUtil_upvr:getAbilityStacks(arg2, HalloweenAbilityType_upvr.KAIDA_RADIUS)
		if 0 < any_getAbilityStacks_result1 then
			maxRadius_upvw += (SummonerKitBalance_upvr.SPELL_TIER_1_DATA.maxRadius) * (any_getAbilityStacks_result1 * HalloweenBalanceConfig_upvr.KAIDA_EXPANSION_PERCENT / 100)
		end
	end
	local var103_upvw = true
	local var105_upvw
	local summoner_getTotalCastTimeRequired_upvr_result1_upvr = summoner_getTotalCastTimeRequired_upvr(var20_result1_2)
	local CIRCLE_MIN_RADIUS_upvr_2 = SummonerKitBalance_upvr.CIRCLE_MIN_RADIUS
	local var108_upvw = 0
	var105_upvw = RunService_upvr.Heartbeat:Connect(function(arg1_9) -- Line 287
		--[[ Upvalues[12]:
			[1]: clone_upvr_2 (readonly)
			[2]: var105_upvw (read and write)
			[3]: var103_upvw (read and write)
			[4]: Workspace_upvr (copied, readonly)
			[5]: arg3 (readonly)
			[6]: summoner_getTotalCastTimeRequired_upvr_result1_upvr (readonly)
			[7]: MathExtras_upvr (copied, readonly)
			[8]: CIRCLE_MIN_RADIUS_upvr_2 (readonly)
			[9]: maxRadius_upvw (read and write)
			[10]: var93_upvr (readonly)
			[11]: cframe_upvw_2 (read and write)
			[12]: var108_upvw (read and write)
		]]
		local var109 = not clone_upvr_2
		if not var109 then
			local var110 = clone_upvr_2
			if var110 ~= nil then
				var110 = var110.Parent
			end
			if not var110 ~= nil then
				var109 = false
			else
				var109 = true
			end
		end
		if var109 then
			var105_upvw:Disconnect()
			return nil
		end
		if var103_upvw then
			cframe_upvw_2 = CFrame.new(var93_upvr.Position - Vector3.new(0, 3, 0))
			clone_upvr_2:PivotTo(cframe_upvw_2)
			clone_upvr_2:ScaleTo(MathExtras_upvr:lerp(CIRCLE_MIN_RADIUS_upvr_2, maxRadius_upvw, math.clamp((Workspace_upvr:GetServerTimeNow() - arg3) / summoner_getTotalCastTimeRequired_upvr_result1_upvr, 0, 1)) * 2)
		end
		var108_upvw += arg1_9
		local var111 = clone_upvr_2
		if var111 ~= nil then
			var111 = var111.Pivot
		end
		if var111 then
			clone_upvr_2.Pivot.Ring1.CFrame = cframe_upvw_2 * CFrame.Angles(0, math.rad(var108_upvw * 60), 0)
			clone_upvr_2.Pivot.Ring2.CFrame = cframe_upvw_2 * CFrame.Angles(0, math.rad(var108_upvw * 10), 0)
			clone_upvr_2.Pivot.Ring3.CFrame = cframe_upvw_2 * CFrame.Angles(0, math.rad(-var108_upvw * 80), 0)
			clone_upvr_2.Pivot.PortalBottom.CFrame = cframe_upvw_2 * CFrame.Angles(0, math.rad(var108_upvw * 30), 0)
			clone_upvr_2.Pivot.PortalTop.CFrame = cframe_upvw_2 * CFrame.Angles(0, math.rad(var108_upvw * -30), 0)
		end
	end)
	local any_new_result1_4 = any_import_result1_3_upvr.new()
	local any_new_result1 = any_import_result1_3_upvr.new()
	any_new_result1:GiveTask(var105_upvw)
	arg1.playerCastingDataMap[arg2] = {
		castingMaid = any_new_result1_4;
		summonMaid = any_new_result1;
		finishedCasting = false;
		circleParent = clone_upvr_2;
	}
	any_new_result1_4:GiveTask(function() -- Line 348
		--[[ Upvalues[4]:
			[1]: var103_upvw (read and write)
			[2]: arg1 (readonly)
			[3]: arg2 (readonly)
			[4]: clone_upvr_2 (readonly)
		]]
		var103_upvw = false
		local var116 = arg1.playerCastingDataMap[arg2]
		if var116 and not var116.finishedCasting and clone_upvr_2 then
			clone_upvr_2:Destroy()
		end
	end)
	local tbl_12 = {
		looped = true;
		parent = clone_upvr_2.PrimaryPart;
	}
	local PrimaryPart = clone_upvr_2.PrimaryPart
	if PrimaryPart ~= nil then
		PrimaryPart = PrimaryPart.Position
	end
	tbl_12.position = PrimaryPart
	any_new_result1_4:GiveTask(SoundManager_upvr:playSound(GameSound_upvr.SUMMONER_SUMMON_CHANNEL_LOOP, tbl_12))
end
local AnimationUtil_upvr = any_import_result1_2.AnimationUtil
local GameAnimationUtil_upvr = module.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local AnimationType_upvr = module.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local TweenService_upvr = any_import_result1_4.TweenService
function setmetatable_result1_2_upvw.finishChargingSummon(arg1, arg2, arg3) -- Line 393
	--[[ Upvalues[17]:
		[1]: Players_upvr (readonly)
		[2]: SoundManager_upvr (readonly)
		[3]: GameSound_upvr (readonly)
		[4]: ReplicatedStorage_upvr (readonly)
		[5]: KnitClient_upvr_2 (readonly)
		[6]: BedwarsKitSkinMeta_upvr (readonly)
		[7]: KnitClient_upvr (readonly)
		[8]: Workspace_upvr (readonly)
		[9]: AnimationUtil_upvr (readonly)
		[10]: GameAnimationUtil_upvr (readonly)
		[11]: AnimationType_upvr (readonly)
		[12]: RunService_upvr (readonly)
		[13]: HalloweenAbilityUtil_upvr (readonly)
		[14]: HalloweenAbilityType_upvr (readonly)
		[15]: TweenService_upvr (readonly)
		[16]: HalloweenBalanceConfig_upvr (readonly)
		[17]: MathExtras_upvr (readonly)
	]]
	local var131
	if arg2 == Players_upvr.LocalPlayer then
		arg1.localChargingMaid:DoCleaning()
		arg1:enableStartChargingAbility()
	end
	local var132_upvr = arg1.playerCastingDataMap[arg2]
	if not var132_upvr then
		return nil
	end
	var132_upvr.finishedCasting = true
	var132_upvr.castingMaid:DoCleaning()
	local circleParent_upvr = var132_upvr.circleParent
	SoundManager_upvr:playSound(GameSound_upvr.SUMMONER_SUMMON_FINISH, {
		position = circleParent_upvr.Pivot.Position;
	})
	local Summoner_DragonHead = ReplicatedStorage_upvr.Assets.Misc.Kaida.Summoner_DragonHead
	local Character = arg2.Character
	if Character then
		local kaida = BedwarsKitSkinMeta_upvr[KnitClient_upvr_2.Controllers.KitSkinController:getKitSkin(Character)].kaida
		if kaida ~= nil then
			kaida = kaida.dragon_head
		end
		if kaida then
			Summoner_DragonHead = ReplicatedStorage_upvr.Assets.Misc.Kaida.Witch_Summoner_DragonHead
		end
	end
	local clone_upvw = Summoner_DragonHead:Clone()
	if KnitClient_upvr.Controllers.SummonerKitSkinController:isPrismaticSkin(arg2) then
		KnitClient_upvr.Controllers.SummonerKitSkinController:applyDragonHeadRGB(clone_upvw)
	end
	local var139 = Workspace_upvr
	clone_upvw.Parent = var139
	if KnitClient_upvr_2.Controllers.CameraPerspectiveController:getCameraPerspective() ~= 0 then
		var139 = false
	else
		var139 = true
	end
	if var139 then
		local function _(arg1_10) -- Line 442
			if arg1_10:IsA("MeshPart") then
				arg1_10.Transparency = 0.6
			end
		end
		for _, v in clone_upvw:GetChildren(), nil do
			if v:IsA("MeshPart") then
				v.Transparency = 0.6
			end
		end
	end
	var132_upvr.summonMaid:GiveTask(clone_upvw)
	var132_upvr.summonMaid:GiveTask(function() -- Line 453
		--[[ Upvalues[1]:
			[1]: circleParent_upvr (readonly)
		]]
		circleParent_upvr:Destroy()
	end)
	local LookVector = clone_upvw.PrimaryPart.CFrame.LookVector
	if arg2.Character then
		LookVector = Vector3.new(arg2.Character.PrimaryPart.CFrame.LookVector.X, 0, arg2.Character.PrimaryPart.CFrame.LookVector.Z).Unit
	end
	clone_upvw:PivotTo(CFrame.new(circleParent_upvr:GetPivot().Position - Vector3.new(0, 13, 0)))
	local any_playAnimation_result1_upvr = AnimationUtil_upvr:playAnimation(clone_upvw.AnimationController.Animator, GameAnimationUtil_upvr:getAssetId(AnimationType_upvr.SUMMONER_DRAGON_ATTACK), {
		looped = false;
		speed = 1.2;
	})
	if any_playAnimation_result1_upvr then
		local var146_upvw = false
		local any_Connect_result1_upvr = RunService_upvr.Heartbeat:Connect(function() -- Line 476
			--[[ Upvalues[4]:
				[1]: any_playAnimation_result1_upvr (readonly)
				[2]: var146_upvw (read and write)
				[3]: circleParent_upvr (readonly)
				[4]: clone_upvw (read and write)
			]]
			if 0.1 < any_playAnimation_result1_upvr.TimePosition and not var146_upvw then
				clone_upvw:PivotTo(CFrame.new(circleParent_upvr:GetPivot().Position - Vector3.new(0, 0, 0)))
				var146_upvw = true
			end
		end)
		any_playAnimation_result1_upvr.Stopped:Connect(function() -- Line 485
			--[[ Upvalues[2]:
				[1]: any_Connect_result1_upvr (readonly)
				[2]: clone_upvw (read and write)
			]]
			any_Connect_result1_upvr:Disconnect()
			clone_upvw:Destroy()
		end)
	end
	if HalloweenAbilityUtil_upvr:matchIsHalloweenEvent() and HalloweenAbilityUtil_upvr:isActive(arg2, HalloweenAbilityType_upvr.KAIDA_UNIQUE_FIRE) then
	end
	local tbl_4_upvr = {circleParent_upvr.Pivot.ParticleCircle.Fire1, circleParent_upvr.Pivot.ParticleCircle.Fire2, circleParent_upvr.Pivot.ParticleCircle.Fire3}
	local function _(arg1_11) -- Line 498
		arg1_11.Enabled = true
	end
	for i_2, v_2 in tbl_4_upvr do
		v_2.Enabled = true
	end
	if not true then
		task.delay(0.3, function() -- Line 506
			--[[ Upvalues[1]:
				[1]: tbl_4_upvr (readonly)
			]]
			local function _(arg1_12) -- Line 507
				arg1_12.Enabled = false
			end
			for _, v_3 in tbl_4_upvr do
				v_3.Enabled = false
			end
		end)
	end
	task.wait(2.2)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	if true then
		task.spawn(function() -- Line 521
			--[[ Upvalues[6]:
				[1]: TweenService_upvr (copied, readonly)
				[2]: circleParent_upvr (readonly)
				[3]: HalloweenBalanceConfig_upvr (copied, readonly)
				[4]: var132_upvr (readonly)
				[5]: RunService_upvr (copied, readonly)
				[6]: MathExtras_upvr (copied, readonly)
			]]
			-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
			local Color3_fromRGB_result1_2 = Color3.fromRGB(117, 20, 23)
			local PortalRing1_2 = circleParent_upvr.Pivot.PortalBottom:FindFirstChild("PortalRing1")
			if PortalRing1_2 ~= nil then
				PortalRing1_2 = PortalRing1_2:FindFirstChild("UI")
				if PortalRing1_2 ~= nil then
					PortalRing1_2 = PortalRing1_2:FindFirstChild("Logo")
				end
			end
			TweenService_upvr:Create(PortalRing1_2, TweenInfo.new(1, Enum.EasingStyle.Linear), {
				ImageColor3 = Color3_fromRGB_result1_2;
			}):Play()
			local UI_7 = circleParent_upvr.Pivot.PortalBottom:FindFirstChild("UI")
			if UI_7 ~= nil then
				UI_7 = UI_7:FindFirstChild("Logo")
			end
			TweenService_upvr:Create(UI_7, TweenInfo.new(1, Enum.EasingStyle.Linear), {
				ImageColor3 = Color3_fromRGB_result1_2;
			}):Play()
			local PortalWhite = circleParent_upvr.Pivot.PortalTop:FindFirstChild("PortalWhite")
			if PortalWhite ~= nil then
				PortalWhite = PortalWhite:FindFirstChild("UI")
				if PortalWhite ~= nil then
					PortalWhite = PortalWhite:FindFirstChild("Logo")
				end
			end
			TweenService_upvr:Create(PortalWhite, TweenInfo.new(1, Enum.EasingStyle.Linear), {
				ImageColor3 = Color3_fromRGB_result1_2;
			}):Play()
			local UI_6 = circleParent_upvr.Pivot.PortalTop:FindFirstChild("UI")
			if UI_6 ~= nil then
				UI_6 = UI_6:FindFirstChild("Logo")
			end
			TweenService_upvr:Create(UI_6, TweenInfo.new(1, Enum.EasingStyle.Linear), {
				ImageColor3 = Color3_fromRGB_result1_2;
			}):Play()
			local UI = circleParent_upvr.Pivot.Ring1:FindFirstChild("UI")
			if UI ~= nil then
				UI = UI:FindFirstChild("Logo")
			end
			TweenService_upvr:Create(UI, TweenInfo.new(1, Enum.EasingStyle.Linear), {
				ImageColor3 = Color3_fromRGB_result1_2;
			}):Play()
			local UI_2 = circleParent_upvr.Pivot.Ring2:FindFirstChild("UI")
			if UI_2 ~= nil then
				UI_2 = UI_2:FindFirstChild("Logo")
			end
			TweenService_upvr:Create(UI_2, TweenInfo.new(1, Enum.EasingStyle.Linear), {
				ImageColor3 = Color3_fromRGB_result1_2;
			}):Play()
			local UI_3 = circleParent_upvr.Pivot.Ring3:FindFirstChild("UI")
			if UI_3 ~= nil then
			end
			TweenService_upvr:Create(UI_3:FindFirstChild("Logo"), TweenInfo.new(1, Enum.EasingStyle.Linear), {
				ImageColor3 = Color3_fromRGB_result1_2;
			}):Play()
			task.wait(HalloweenBalanceConfig_upvr.KAIDA_UNIQUE_FIRE_DURATION)
			if var132_upvr and var132_upvr.circleParent then
				local var197_upvw = 0
				local any_GetScale_result1_upvr_2 = var132_upvr.circleParent:GetScale()
				local var199_upvw
				var199_upvw = RunService_upvr.Heartbeat:Connect(function(arg1_14) -- Line 596
					--[[ Upvalues[5]:
						[1]: var197_upvw (read and write)
						[2]: MathExtras_upvr (copied, readonly)
						[3]: any_GetScale_result1_upvr_2 (readonly)
						[4]: var132_upvr (copied, readonly)
						[5]: var199_upvw (read and write)
					]]
					var197_upvw += arg1_14
					if var132_upvr ~= nil then
					end
					if 1 <= math.clamp(var197_upvw / 0.75, 0, 1) then
						var199_upvw:Disconnect()
						if var132_upvr ~= nil then
						end
						if var132_upvr ~= nil then
						end
					end
				end)
			end
		end)
	elseif var132_upvr and var132_upvr.circleParent then
		v_2 = RunService_upvr
		i_2 = v_2.Heartbeat
		local var205_upvw = 0
		local any_GetScale_result1_upvr = var132_upvr.circleParent:GetScale()
		local var207_upvw
		i_2 = i_2:Connect(function(arg1_15) -- Line 626
			--[[ Upvalues[5]:
				[1]: var205_upvw (read and write)
				[2]: MathExtras_upvr (copied, readonly)
				[3]: any_GetScale_result1_upvr (readonly)
				[4]: var132_upvr (readonly)
				[5]: var207_upvw (read and write)
			]]
			var205_upvw += arg1_15
			if var132_upvr ~= nil then
			end
			if 1 <= math.clamp(var205_upvw / 0.75, 0, 1) then
				var207_upvw:Disconnect()
				if var132_upvr ~= nil then
				end
				if var132_upvr ~= nil then
				end
			end
		end)
		var207_upvw = i_2
	end
	any_GetScale_result1_upvr = arg1.playerCastingDataMap
	any_GetScale_result1_upvr[arg2] = nil
end
function setmetatable_result1_2_upvw.enableStartChargingAbility(arg1) -- Line 653
	--[[ Upvalues[3]:
		[1]: Flamework_upvr (readonly)
		[2]: AbilityId_upvr (readonly)
		[3]: BedwarsImageId_upvr (readonly)
	]]
	if arg1.abilityRef ~= nil then
		arg1.abilityRef.Destroy()
	end
	task.defer(function() -- Line 657
		--[[ Upvalues[4]:
			[1]: Flamework_upvr (copied, readonly)
			[2]: AbilityId_upvr (copied, readonly)
			[3]: BedwarsImageId_upvr (copied, readonly)
			[4]: arg1 (readonly)
		]]
		Flamework_upvr.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId_upvr.SUMMONER_START_CHARGING, {
			abilityType = "KitPrimary";
			abilityButton = {
				icon = BedwarsImageId_upvr.SUMMONER_SUMMON_START;
			};
		}):andThen(function(arg1_16) -- Line 664
			--[[ Upvalues[1]:
				[1]: arg1 (copied, readonly)
			]]
			arg1.abilityRef = arg1_16
		end)
	end)
end
function setmetatable_result1_2_upvw.enableFinishChargingAbility(arg1) -- Line 670
	--[[ Upvalues[3]:
		[1]: Flamework_upvr (readonly)
		[2]: AbilityId_upvr (readonly)
		[3]: BedwarsImageId_upvr (readonly)
	]]
	if arg1.abilityRef ~= nil then
		arg1.abilityRef.Destroy()
	end
	task.defer(function() -- Line 674
		--[[ Upvalues[4]:
			[1]: Flamework_upvr (copied, readonly)
			[2]: AbilityId_upvr (copied, readonly)
			[3]: BedwarsImageId_upvr (copied, readonly)
			[4]: arg1 (readonly)
		]]
		Flamework_upvr.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId_upvr.SUMMONER_FINISH_CHARGING, {
			abilityType = "KitPrimary";
			abilityButton = {
				icon = BedwarsImageId_upvr.SUMMONER_SUMMON_FINISH;
			};
		}):andThen(function(arg1_17) -- Line 681
			--[[ Upvalues[1]:
				[1]: arg1 (copied, readonly)
			]]
			arg1.abilityRef = arg1_17
		end)
	end)
end
function setmetatable_result1_2_upvw.isPlayerCastingSpell(arg1, arg2) -- Line 687
	local var220 = arg1.playerCastingDataMap[arg2]
	if var220 == nil then
		return false
	end
	if var220.finishedCasting then
		return false
	end
	return true
end
function setmetatable_result1_2_upvw.cancelSummon(arg1, arg2) -- Line 699
	--[[ Upvalues[3]:
		[1]: validatePlayerKit_upvr (readonly)
		[2]: BedwarsKit_upvr (readonly)
		[3]: Players_upvr (readonly)
	]]
	if not validatePlayerKit_upvr(arg2, BedwarsKit_upvr.SUMMONER) then
		return nil
	end
	local var221 = arg1.playerCastingDataMap[arg2]
	if var221 then
		var221.castingMaid:DoCleaning()
		arg1.playerCastingDataMap[arg2] = nil
	end
	if arg2 == Players_upvr.LocalPlayer then
		arg1.localChargingMaid:DoCleaning()
	end
end
return nil
