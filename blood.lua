local _, Zylla = ...
local unpack = _G.unpack
local NeP = _G.NeP
local Mythic_Plus = _G.Mythic_Plus

local GUI = {
--	unpack(Zylla.Logo_GUI),
	-- Header
	{type = 'header',  	size = 14, text = 'Keybinds', align = 'left'},
	{type = 'checkbox',	text = 'Left Shift: '..Zylla.ClassColor..'Pause|r',	align = 'left',	key = 'lshift',	default = true},
	{type = 'checkbox',	text = 'Left Ctrl: '..Zylla.ClassColor..'Death and Decay|r', align = 'left', key = 'lcontrol',	default = false},
	{type = 'checkbox',	text = 'Left Alt: '..Zylla.ClassColor..'|r',	align = 'left', key = 'lalt', default = false},
	{type = 'checkbox',	text = 'Right Alt: '..Zylla.ClassColor..'|r',align = 'left', key = 'ralt', default = false},
	-- {type = 'spacer'},
-- --{type = 'checkbox', text = 'Enable Chatoverlay', 																			key = 'chat', 				width = 55, 			default = true, desc = Zylla.ClassColor..'This will enable some messages as an overlay!|r'},
	-- unpack(Zylla.PayPal_GUI),
	-- {type = 'spacer'},
	-- unpack(Zylla.PayPal_IMG),
	{type = 'ruler'},
	-- Settings
	{type = 'header', size = 14, text = 'General Settings', align = 'Left'},
	{type = 'checkbox', text = 'Enable DBM Integration', key = 'kDBM', default = false},
	{type = 'checkbox', text = 'Enable \'pre-potting\', flasks and Legion-rune', key = 'prepot', 	default = false},
	{type = 'combo', default = '1',	key = 'list', list = Zylla.prepots,	width = 175},
	{type = 'spacer'},
	{type = 'checkspin', text = 'Light\'s Judgment - Units', key = 'LJ', spin = 4, step = 1, max = 20, check = false,	desc = Zylla.ClassColor..'World Spell usable on Argus.|r'},
	{type = 'checkbox', text = 'Use Trinket #1', key = 'trinket1',	default = false},
	{type = 'checkbox', text = 'Use Trinket #2', key = 'trinket2', default = false},
	{type = 'checkspin', text = 'Kil\'Jaeden\'s Burning Wish - Units', key = 'kj', align = 'left', width = 55, step = 1, shiftStep = 2, spin = 4, max = 20, min = 1, check = false, desc = Zylla.ClassColor..'KJBW used only on X units|r'},
	{type = 'header', size = 14, text = 'Class Settings', align = 'Left'},
	{type = 'checkbox', text = 'Wraithwalk out of Root', key = 'wraithroot', default = true},
	{type = 'checkbox', text = 'Use Asphyxiate as backup Interrupt', key = 'ASPInt',	default = false},
	{type = 'checkbox', text = 'Use Death Grip as backup Interrupt', key = 'DGInt',	default = false},
	{type = 'checkbox', text = 'Use Death Grip as backup Taunt', key = 'DGTaunt', default = false},
	{type = 'checkspin', 	text = 'DnD on Target w/ # Enemies', key = 'dndtarget', spin = 2, step = 1, shiftStep = 1, max = 10, min = 1, check = false},
	{type = 'checkspin', 	text = 'DnD on Player w/ # Enemies', key = 'dndplayer', spin = 2, step = 1, shiftStep = 1, max = 10, min = 1, check = true},
	{type = 'ruler'},
	-- Survival
	{type = 'header', size = 14, text = 'Survival',	align = 'Left',	size = 16},
	{type = 'checkspin', text = 'Blood Mirror', key = 'bm', spin = 50, step = 5, shiftStep = 10, max = 100, min = 1, check = true},
	{type = 'checkspin', text = 'Blooddrinker', key = 'blooddrink', spin = 95, step = 5, shiftStep = 10, max = 100, min = 1, check = true},
	{type = 'checkspin', text = 'Bonestorm # of mobs', key = 'bonestorm', spin = 2, step = 1, shiftStep = 1, max = 10, min = 1, check = true},
	{type = 'checkspin', text = 'Bonestorm runic power', key = 'bonestormrunic', spin = 80, step = 5, shiftStep = 10, max = 100, min = 0, check = false},
	{type = 'checkspin', text = 'Consumption', key = 'artifact', spin = 90, step = 5, shiftStep = 10, max = 100, min = 1, check = true},
	{type = 'checkspin', text = 'Dancing Rune Weapon', key = 'drw', spin = 70, step = 5, shiftStep = 10, max = 100, min = 1, check = false},
	{type = 'checkspin', text = 'Death Strike - Min. HP%', key = 'DSA', spin = 70, step = 5, shiftStep = 10, max = 100, min = 1, check = true},
	{type = 'checkspin', text = 'Death Strike - Runic Power cap', key = 'DSb', spin = 85, step = 5, shiftStep = 10, max = 100, min = 1, check = true},
	{type = 'checkspin', text = 'Icebound Fortitude', key = 'IwF', spin = 30, step = 5, shiftStep = 10, max = 100, min = 1, check = false},
	{type = 'checkspin', text = 'Vampiric Blood', key = 'VB', spin = 50, step = 5, shiftStep = 10, max = 100, min = 1, check = true},
	{type = 'checkspin', text = 'Healthstone', key = 'HS', spin = 45, step = 5, shiftStep = 10, max = 100, min = 1, check = false},
	{type = 'checkspin', text = 'Ancient Healing Potion', key = 'AHP', spin = 45, step = 5, shiftStep = 10, max = 100, min = 1, check = false},
	{type = 'ruler'},
	unpack(Zylla.Mythic_GUI),
}

local exeOnLoad = function()
	Zylla.ExeOnLoad()
	Zylla.AFKCheck()

	print('|cffADFF2F ----------------------------------------------------------------------|r')
	print('|cffADFF2F --- |rDeath-Knight |cffADFF2FBlood |r')
	print('|cffADFF2F --- |rRecommended Talents: 2112133')
	print('|cffADFF2F ----------------------------------------------------------------------|r')
	print('|cffFFFB2F Configuration: |rRight-click MasterToggle and go to Combat Routines Settings!|r')

	NeP.Interface:AddToggle({
		key = 'xIntRandom',
		name = 'Interrupt Anyone',
		text = 'Interrupt all nearby enemies, without targeting them.',
		icon = 'Interface\\Icons\\inv_ammo_arrow_04',
	})

	NeP.Interface:AddToggle({
		key = 'super_taunt',
		name = 'Taunt Lowest Threat',
		text = 'Taunt a nearby enemy in combat, when threat gets low, without targeting it.',
		icon = 'Interface\\Icons\\spell_nature_reincarnation',
	})
	NeP.Interface:AddToggle({
		key = 'dps_rotation',
		name = 'Use DPS rotation',
		text = 'Single target dps rotation.',
		icon = 'Interface\\Icons\\ability_backstab',
	})
end

local PreCombat = {
	{'%pause', 'player.buff(Shadowmeld)'},
	-- Pots
	{'#127844', 'UI(list)==1&item(127844).usable&item(127844).count>0&UI(kDBM)&UI(prepot)&!buff(Potion of the Old War)&dbm(pull in)<3'}, 			--XXX: Potion of the Old War
	{'#127843', 'UI(list)==2&item(127843).usable&item(127843).count>0&UI(kDBM)&UI(prepot)&!buff(Potion of Deadly Grace)&dbm(pull in)<3'}, 		--XXX: Potion of Deadly Grace
	{'#142117', 'UI(list)==3&item(142117).usable&item(142117).count>0&UI(kDBM)&UI(prepot)&!buff(Potion of Prolonged Power)&dbm(pull in)<3'}, 	--XXX: Potion of Prolonged Power
	-- Flasks
	{'#127850', 'item(127850).usable&item(127850).count>0&UI(prepot)&!buff(Flask of Ten Thousand Scars)'},	--XXX: Flask of Ten Thousand Scars
	{'#153023', 'item(153023).usable&item(153023).count>0&UI(prepot)&!buff(Defiled Augmentation)'},					--XXX: Lightforged Augment Rune
}

local Survival = {
	{'Icebound Fortitude', 'UI(IF_check)&player.health<=(IF_spin)'},
	--{'Anti-Magic Shell', 'incdmg(3).magic>health.max*0.50'},
	{'Wraith Walk', 'UI(wraithroot)&player.state(root)'},
	{'#152615', 'item(152615).usable&item(152615).count>0&health<=UI(AHP_spin)&UI(AHP_check)'}, 													--XXX: Astral Healing Potion
	{'#127834', 'item(152615).count==0&item(127834).usable&item(127834).count>0&health<=UI(AHP_spin)&UI(AHP_check)'}, 		--XXX: Ancient Healing Potion
	{'#5512', 'item(5512).usable&item(5512).count>0&health<=UI(HS_spin)&UI(HS_check)'}, 																	--XXX: Health Stone
}

local Keybinds = {
	{'%pause', 'keybind(lshift)&UI(lshift)'},
	{'!Death and Decay', 'keybind(lcontrol)&UI(lcontrol)', 'cursor.ground'},
}

local Cooldowns = {
	{'Dancing Rune Weapon', 'inFront&inMelee&UI(drw_check)&{{player.incdmg(2.5)>player.health.max*0.50}||{player.health<=UI(drw_spin)}}', 'target'},
	{'Vampiric Blood', 'UI(VB_check)&{incdmg(2.5)>health.max*0.50||health<=UI(VB_spin)}', 'player'},
	{'#trinket1', 'UI(trinket1)'},
	{'#trinket2', 'UI(trinket2)'},
	{'Light\'s Judgment', 'advanced&UI(LJ_check)&range<61&area(15).enemies>=UI(LJ_spin)', 'enemies.ground'},
	{'#144259', 'UI(kj_check)&range<=40&area(10).enemies>=UI(kj_spin)&equipped(144259)', 'target'}, --XXX: Kil'jaeden's Burning Wish (Legendary)}
	{'Blood Mirror', 'UI(bm_check)&{incdmg(2.5)>health.max*0.50||health<=UI(bm_spin)}'},
	{'Bonestorm', 'UI(bonestorm_check)&player.runicpower>=UI(bonestormrunic_spin)&player.area(10).enemies>=UI(bonestorm_spin)'},
}

local Interrupts = {
	{'&Mind Freeze', 'inFront&range<=15'},
	{'!Asphyxiate', 'range<=30&inFront&spell(Mind Freeze).cooldown>=gcd&!player.lastgcd(Mind Freeze)'},
	{'!Death Grip', 'UI(DGInt)&range<=30&inFront&spell(Mind Freeze).cooldown>=gcd&spell(Asphyxiate).cooldown>=gcd'},
	{'!Arcane Torrent', 'inMelee&spell(Mind Freeze).cooldown>=gcd&!player.lastgcd(Mind Freeze)'},
}

local xTaunts = {
	{'&Dark Command', 'inMelee&combat&alive&threat<100'},
	{'&Death Grip', 'UI(DGTaunt)&range<=30&combat&alive&threat<100&spell(Dark Command).cooldown>=gcd&!player.lastgcd(Dark Command)'},
}
local dps = {
	{'Death Strike', 'inFront&deficit<=10'},
	{'Death And Decay', 'UI(dndplayer_check)&talent(2,1)&!player.buff(Dancing Rune Weapon)&player.area(10).enemies>=UI(dndtarget_spin)', 'player.ground'},
	{'Death And Decay', 'UI(dndtarget_check)&talent(2,1)&!player.buff(Dancing Rune Weapon)&player.area(10).enemies>=UI(dndtarget_spin)', 'target.ground'},
	{'Bloodrinker', '!player.buff(Dancing Rune Weapon)', 'target'},
	{'Marrowrend', 'player.buff(Bone Shield).duration<=3&inFront'},
	{'Blood Boil', 'player.area(10).enemies >= 1 & {player.area(10).enemies.debuff(Blood Plague)<gcd || spell(Blood Boil).charges>=1.8}'},
	{'Marrowrend', 'player.buff(Bone Shield).count<=5&talent(3,1)&inFront'},
	{'Death Strike', 'inFront&{player.buff(Blood Shield)||deficit<=15||{deficit<=25&player.buff(Dancing Rune Weapon)}}'},
	{'Consumption', 'UI(artifact_check) & player.health <= UI(artifact_spin) & inFront & inMelee'},
	{'Heart Strike', 'player.buff(Dancing Rune Weapon)'},
	{'Death And Decay', 'UI(dndplayer_check)&player.buff(Crimson Scourge)&player.area(10).enemies>=UI(dndtarget_spin)', 'player.ground'},
	{'Death And Decay', 'UI(dndtarget_check)&player.buff(Crimson Scourge)&player.area(10).enemies>=UI(dndtarget_spin)', 'target.ground'},
	{'Blood Boil', 'player.area(10).enemies >= 1'},
	{'Death And Decay', 'UI(dndplayer_check)&player.area(10).enemies>=UI(dndtarget_spin)', 'player.ground'},
	{'Death And Decay', 'UI(dndtarget_check)&player.area(10).enemies>=UI(dndtarget_spin)', 'target.ground'},
	{'Heart Strike', 'player.runes>=3 || player.buff(Bone Shield).count > 6'},
}
local xCombat = {
	{'Death Strike', 'inFront&player.health<=UI(DSA_spin)&UI(DSA_check)'},
	{'Death Strike', 'inFront&player.runicpower>=UI(DSb_spin)&UI(DSb_check)'},
	{'Death And Decay', 'UI(dndplayer_check)&!player.moving&talent(2,1)&!player.buff(Dancing Rune Weapon)&player.area(10).enemies>=UI(dndtarget_spin)', 'player.ground'},
	{'Death And Decay', 'UI(dndtarget_check)&!player.moving&talent(2,1)&!player.buff(Dancing Rune Weapon)&player.area(10).enemies>=UI(dndtarget_spin)', 'target.ground'},	
	{'Blooddrinker', 'UI(blooddrink_check)&player.health <= UI(blooddrink_spin)&inFront&!player.buff(Dancing Rune Weapon)'},
	{'Marrowrend', 'player.buff(Bone Shield).duration<4&inFront'},
	{'Blood Boil', 'player.area(10).enemies >= 1 || {player.area(10).enemies.debuff(Blood Plague)<gcd & spell(Blood Boil).charges>=1.8}'},
	{'Death\'s Caress', 'range > 15 & range<=40&debuff(Blood Plague).remains<3&inFront', 'target'},
	{'Marrowrend', 'player.buff(Bone Shield).count<=5&talent(3,1)&inFront'},
	{'Consumption', 'UI(artifact_check) & player.health <= UI(artifact_spin) & inFront & inMelee'},
	{'Heart Strike', 'player.buff(Dancing Rune Weapon)'},
	{'Death and Decay', 'UI(dndtarget_check)&advanced&range<=30&{{talent(2,1)&player.buff(Crimson Scourge)}||{area(10).enemies>=UI(dndtarget_spin)&player.buff(Crimson Scourge}}', 'target.ground'},
	{'Death and Decay', 'UI(dndtarget_check)&advanced&range<=30&{{talent(2,1)&player.runes>=3}||{area(10).enemies>=UI(dndtarget_spin)}}', 'target.ground'},
	{'Death and Decay', 'UI(dndplayer_check)&!player.moving&{{talent(2,1)&player.buff(Crimson Scourge)}||{player.area(10).enemies>=UI(dndplayer_spin)&player.buff(Crimson Scourge}}', 'player.ground'},
	{'Death and Decay', 'UI(dndplayer_check)&!player.moving&{{talent(2,1)&player.runes>=3}||{player.area(10).enemies>=UI(dndplayer_spin)}}', 'player.ground'},
	{'Blood Boil', 'player.area(10).enemies>=1'},
	{'Death and Decay', 'UI(dndtarget_check)&advanced&!talent(2,1)&range<=30&area(10).enemies>=1&player.buff(Crimson Scourge)', 'target.ground'},
	{'Death and Decay', 'UI(dndplayer_check)&!player.moving&!talent(2,1)&player.area(10).enemies>=1&player.buff(Crimson Scourge)', 'player.ground'},
	{'Death And Decay', 'UI(dndplayer_check)&player.area(10).enemies>=UI(dndtarget_spin)', 'player.ground'},
	{'Death And Decay', 'UI(dndtarget_check)&player.area(10).enemies>=UI(dndtarget_spin)', 'target.ground'},
	{'Heart Strike', 'inFront&{player.runes>=3||player.buff(Bone Shield).count > 6}'},

}

local inCombat = {
	{Keybinds},
	--{'Raise Ally', 'dead', 'player.mouseover'},
	{xTaunts, 'toggle(super_taunt)'},
	{Interrupts, 'toggle(Interrupts)&interruptAt(70)', 'target'},
	{Interrupts, 'toggle(Interrupts)&toggle(xIntRandom)&interruptAt(70)', 'enemies'},
	{Survival},
	{Cooldowns, 'toggle(Cooldowns)'},
	{Mythic_Plus, 'inMelee'},
	{dps, 'toggle(dps_rotation)'},
	{xCombat, '!toggle(dps_rotation)'},

}

local outCombat = {
	{Keybinds},
	{PreCombat}
}

NeP.CR:Add(250, {
	name = Zylla.ClassColor..'[Camby\'s]|r Death-Knight - Blood',
	ic = inCombat,
	ooc = outCombat,
	gui = GUI,
	gui_st = Zylla.GuiSettings,
	ids = Zylla.SpellIDs[Zylla.Class],
	wow_ver = Zylla.wow_ver,
	nep_ver = Zylla.nep_ver,
	load = exeOnLoad
})
