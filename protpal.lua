local _, Zylla = ...
local unpack = _G.unpack
local NeP = _G.NeP
local Mythic_Plus = _G.Mythic_Plus

local GUI = {
--	unpack(Zylla.Logo_GUI),

	--unpack(Zylla.PayPal_GUI),
	{type = 'spacer'},
	--unpack(Zylla.PayPal_IMG),
	{type = 'ruler'},
	--TODO: Targetting: Use, or NOT use?! We'll see....
	{type = 'header', size = 16, text = 'Targetting:', align = 'center'},
	{type = 'combo', default = 'normal', key = 'target', list = Zylla.faketarget, width = 75},
	{type = 'spacer'},
	{type = 'text', text = Zylla.ClassColor..'Only one can be enabled.\nChose between normal targetting, or hitting the highest/lowest enemy.|r'},
	{type = 'ruler'},
	-- Settings
	{type = 'header', size = 16, text = 'General Settings',	align = 'center'},
	{type = 'spinner', size = 11, text = 'Interrupt at percentage:', key = 'intat', default = 60,	step = 5, shiftStep = 10,	max = 100, min = 1},
	{type = 'checkbox', text = 'Enable DBM Integration', key = 'kDBM', default = false},
	{type = 'checkbox', text = 'Enable \'pre-potting\', flasks and Legion-rune',	key = 'prepot', default = false},
	{type = 'combo', default = '3',	key = 'list', list = Zylla.prepots, width = 175},
	{type = 'spacer'},
	{type = 'checkspin', text = 'Light\'s Judgment - Units', key = 'LJ',	spin = 4,	step = 1,	max = 20, min = 1,	check = true,	desc = Zylla.ClassColor..'World Spell usable on Argus.|r'},
	{type = 'checkbox', text = 'Use Trinket #1', key = 'trinket1', default = false},
	{type = 'checkbox', text = 'Use Trinket #2', key = 'trinket2', default = false, desc = Zylla.ClassColor..'Trinkets will be used whenever possible!|r'},
	{type = 'checkspin',text = 'Kil\'Jaeden\'s Burning Wish - Units', key = 'kj', align = 'left', width = 55, step = 1, shiftStep = 2, spin = 4, max = 20, min = 1, check = true, desc = Zylla.ClassColor..'Legendary will be used only on selected amount of units!|r'},
	{type = 'ruler'}, {type = 'spacer'},
	-- Defensives
	{type = 'header', size = 16, text = 'Class Settings',	align = 'center'},
	{type = 'checkspin', text = 'Consecration Priority mobs', key = 'consecrationpriority', align = 'left', width = 55, step = 1, shiftStep = 1, spin = 1, max = 10, min = 1, check = true},
	{type = 'checkbox', text = 'Shield of the Righteous Capping', key = 'sotrcap', default = true, desc = Zylla.ClassColor..'Always keep SotR recharging|r'},
	{type = 'checkbox', text = 'Predictive CDs', key = 'predictive', default = true, desc = Zylla.ClassColor..'Predict incoming damage and use any CD available!|r'},
	{type = 'checkspin',text = 'Ardent Defender', key = 'ad', align = 'left', width = 55, step = 5, shiftStep = 10, spin = 50, max = 100, min = 1, check = false},
	{type = 'checkspin',text = 'Eye of Tyr', key = 'eot', align = 'left', width = 55, step = 5, shiftStep = 10, spin = 85, max = 100, min = 1, check = true},
	{type = 'checkspin',text = 'Eye of Tyr # mobs', key = 'eotmobs', align = 'left', width = 55, step = 1, shiftStep = 1, spin = 3, max = 10, min = 1, check = true},
	{type = 'checkspin',text = 'Guardian of Ancient Kings', key = 'goak', align = 'left', width = 55, step = 5, shiftStep = 10, spin = 30, max = 100, min = 1, check = false},
	{type = 'checkspin',text = 'Divine Shield', key = 'dshield', align = 'left', width = 55, step = 5, shiftStep = 10, spin = 10, max = 100, min = 1, check = false},
	{type = 'checkbox', text = 'Avenging Wrath', key = 'aw', default = true},
	{type = 'checkbox', text = 'Seraphim', key = 'sera', default = true},
	-- Survival
	{type = 'header', size = 16, text = 'Survival', align = 'center'},
	{type = 'checkspin',text = 'Flash of Light', key = 'fol', align = 'left', width = 55, step = 5, shiftStep = 10, spin = 20, max = 100, min = 1, check = false},
	{type = 'checkspin',text = 'Flash of Light out of Combat', key = 'folooc', align = 'left', width = 55, step = 5, shiftStep = 10, spin = 70, max = 100, min = 1, check = false},
	{type = 'checkspin',text = 'Hand/Light of the Protector on self', key = 'lotp', align = 'left', width = 55, step = 5, shiftStep = 10, spin = 75, max = 100, min = 1, check = true},
	{type = 'checkspin',text = 'Hand of the Protector on ally', key = 'hotp', align = 'left', width = 55, step = 5, shiftStep = 10, spin = 60, max = 100, min = 1, check = true},
	-- Header
	{type = 'header',  	size = 16, text = 'Keybinds', align = 'center'},
	{type = 'checkbox',	text = 'Left Shift: '..Zylla.ClassColor..'Pause|r',	align = 'left', key = 'lshift', default = true},
	{type = 'checkbox',	text = 'Left Ctrl: '..Zylla.ClassColor..'|r', align = 'left', key = 'lcontrol',	default = false},
	{type = 'checkbox',	text = 'Left Alt: '..Zylla.ClassColor..'|r', align = 'left', key = 'lalt', default = false},
	{type = 'checkbox',	text = 'Right Alt: '..Zylla.ClassColor..'|r', align = 'left', key = 'ralt', default = false},
	--{type = 'checkbox', text = 'Enable Chatoverlay', key = 'chat', width = 55, default = false, desc = Zylla.ClassColor..'This will enable some messages as an overlay!|r'},
	unpack(Zylla.Mythic_GUI),
}

local exeOnLoad = function()
  Zylla.ExeOnLoad()
  Zylla.AFKCheck()

  print('|cffADFF2F ----------------------------------------------------------------------|r')
  print('|cffADFF2F --- |rPALADIN |cffADFF2FProtection |r')
  print('|cffADFF2F --- |rRecommended Talents: 1/2 - 2/1 - 3/1 - 4/2 - 5/1 - 6/2 - 7/1')
  print('|cffADFF2F ----------------------------------------------------------------------|r')

	NeP.Interface:AddToggle({
		key = 'super_taunt',
		name = 'Taunt Lowest Threat',
		text = 'Taunt a nearby enemy in combat, when threat gets low, without targeting it.',
		icon = 'Interface\\Icons\\spell_nature_reincarnation',
	})

	NeP.Interface:AddToggle({
		key = 'xIntRandom',
		name = 'Interrupt Anyone',
		text = 'Interrupt all nearby enemies, without targeting them.',
		icon = 'Interface\\Icons\\inv_ammo_arrow_04',
	})
	NeP.Interface:AddToggle({
		key = 'xDefensives',
		name = 'Defensive Cooldowns',
		text = 'Automatically use defensive cooldowns',
		icon = 'Interface\\Icons\\spell_holy_heroism',
	})
end

local PreCombat ={
	-- Pots
	{'#127844', 'UI(list)==1&item(127844).usable&item(127844).count>0&UI(kDBM)&UI(prepot)&!buff(Potion of the Old War)&dbm(pull in)<3'}, 			--XXX: Potion of the Old War
	{'#127843', 'UI(list)==2&item(127843).usable&item(127843).count>0&UI(kDBM)&UI(prepot)&!buff(Potion of Deadly Grace)&dbm(pull in)<3'}, 		--XXX: Potion of Deadly Grace
	{'#142117', 'UI(list)==3&item(142117).usable&item(142117).count>0&UI(kDBM)&UI(prepot)&!buff(Potion of Prolonged Power)&dbm(pull in)<3'}, 	--XXX: Potion of Prolonged Power
	-- Flasks
	{'#127850', 'item(127850).usable&item(127850).count>0&UI(prepot)&!buff(Flask of Ten Thousand Scars)'},		--XXX: Flask of Ten Thousand Scars
	{'#153023', 'item(153023).usable&item(153023).count>0&UI(prepot)&!buff(Defiled Augmentation)'},						--XXX: Lightforged Augment Rune
}

local Keybinds = {
  {'%pause', 'keybind(lshift)&UI(lshift)'},
  {'Divine Steed', 'keybind(lcontrol)&UI(lcontrol)', 'player'}
}

local Interrupts = {
	{'Avenger\'s Shield', 'inFront'},
	{'&Rebuke'},
	{'!Hammer of Justice', 'cooldown(Rebuke).remains>=gcd'},
	{'!Arcane Torrent', 'inMelee&spell(Rebuke).cooldown>=gcd&!player.lastgcd(Rebuke)'},

}

local xTaunts = {
	{'&Hand of Reckoning', 'inMelee&combat&alive&threat<100'},
	--{'Avenger\'s Shield', 'combat&alive&threat&range<=30&inFront&spell(Hand of Reckoning).cooldown>=gcd&!player.lastgcd(Hand of Reckoning)', 'enemies'},
}
local Survival ={
	{'Lay on Hands', 'health<15', 'player'},
	{'Flash of Light', 'health<=UI(fol_check)&lastmoved>0&UI(fol_spin)'},
	{'&Light of the Protector', 'UI(lotp_check)&health<UI(lotp_spin)'},
	{'&Hand of the Protector', 'talent(5,1) & player.health >= UI(lotp_spin) & health <= UI(hotp_spin)', 'lowest'},
}

local predictive = {
	{'Divine Steed', 'talent(5,2)'},
	{'Eye of Tyr', 'player.area(8).enemies>0'},
	{'Aegis of Light', 'talent(6,1)'},
	{'Guardian of Ancient Kings'},
	{'Ardent Defender'},
	{'Divine Shield'},
}

local defCooldowns = {
	{predictive, 'UI(predictive)&player.incdmg(2.5)>player.health.max*0.40&!{player.buff(Eye of Tyr)||player.buff(Aegis of Light)||player.buff(Ardent Defender)||player.buff(Guardian of Ancient Kings)||player.buff(Divine Shield)}'},
	{'Ardent Defender', 'UI(ad_check) & player.health <= UI(ad_spin) & !target.debuff(Eye of Tyr) & !player.buff(Guardian of Ancient Kings) & !player.buff(Divine Shield)'},
	{'Eye of Tyr', 'UI(eye_check) & player.health <= UI(eye_spin) & !player.buff(Ardent Defender) & target.range <= 8 & !player.buff(Guardian of Ancient Kings) & !player.buff(Divine Shield)'},
	{'Guardian of Ancient Kings', 'UI(goak_check) & player.health <= UI(goak_spin) & !target.debuff(Eye of Tyr) & !player.buff(Ardent Defender) & !player.buff(Divine Shield)'},
	{'Shield of the Righteous', 'player.area(8).enemies.inFront&!{player.buff(Shield of the Righteous)&player.buff(Eye of Tyr)&player.buff(Aegis of Light)&player.buff(Ardent Defender)&player.buff(Guardian of Ancient Kings)&player.buff(Divine Shield)}', 'target'},
}

local Cooldowns = {
	{'&Seraphim', 'talent(7,2) & UI(sera) & spell(Shield of the Righteous).charges >= 2.0'},
	{'Bastion of Light', 'talent(2,2)&spell(Shield of the Righteous).charges<1', 'player'},
	{'Avenging Wrath', 'UI(aw)&range<10'},
	{'#trinket1', 'UI(trinket1)'},
	{'#trinket2', 'UI(trinket2)'},
	{'Light\'s Judgment', 'advanced&UI(LJ_check)&range<61&area(15).enemies>=UI(LJ_spin)', 'enemies.ground'},
	{'&#144259', 'UI(kj_check)&range<=40&area(10).enemies>=UI(kj_spin)&equipped(144259)'}, 	--XXX: Kil'jaeden's Burning Wish (Legendary)
}

local rotation = {
	{'Avenger\'s Shield', 'inFront'},
	{'&Shield of the Righteous', 'UI(sotrcap) & spell(Shield of the Righteous).charges >= 2.5 & inFront & target.range < 8 & !player.buff(Shield of the Righteous)', 'target'},
	{'Consecration', '!player.moving & player.area(8).enemies>=UI(consecrationpriority_spin)'},
	{'Blessed Hammer', '!player.moving & player.area(12).enemies >= 1  & spell(Blessed Hammer).charges >= 3', nil},
	{'Eye of Tyr', 'UI(eotmobs_check) & player.area(8).enemies>=UI(eotmobs_spin)'},
	{'Judgment', 'inFront'},
	{'Consecration', '!player.moving & player.area(8).enemies>0'},
	{'Blessed Hammer','player.area(12).enemies >= 1' ,nil},
	{'Hammer of the Righteous', '!talent(1,2)'},
}

local xCombat = {
	{Interrupts, 'toggle(interrupts)&@Zylla.InterruptAt(intat)'},
	{Interrupts, 'toggle(interrupts)&toggle(xIntRandom)&@Zylla.InterruptAt(intat)', 'enemies'},
	{Cooldowns, 'toggle(Cooldowns)'},
	{rotation},
}

local inCombat = {
	{Keybinds},
	{defCooldowns, 'toggle(defCooldowns)'},
	{Survival, nil, 'player'},
	{xTaunts, 'toggle(super_taunt)'},
	{xCombat, 'UI(target)==normal', 'target'},
	{xCombat, 'combat&alive&inMelee&UI(target)==highest', 'highestenemy'},
	{xCombat, 'combat&alive&inMelee&UI(target)==lowest', 'lowestenemy'},
	{xCombat, 'combat&alive&inMelee&UI(target)==nearest', 'nearestenemy'},
	{xCombat, 'combat&alive&inMelee&UI(target)==furthest', 'furthestenemy'},
	{Mythic_Plus, 'inMelee'},
}

local outCombat = {
	{Keybinds},
	{'Flash of Light', 'health<=UI(folooc_spin)&lastmoved>0.3&UI(folooc_check)', 'player'},
	{PreCombat, nil, 'player'}
}

NeP.CR:Add(66, {
  name = '['..Zylla.ClassColor..'cZylla\'s|r] Paladin - Protection',
	ic = inCombat,
	ooc = outCombat,
	gui = GUI,
	gui_st = Zylla.GuiSettings,
	ids = Zylla.SpellIDs[Zylla.Class],
	wow_ver = Zylla.wow_ver,
	nep_ver = Zylla.nep_ver,
	load = exeOnLoad
})
