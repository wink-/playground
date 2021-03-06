local _, Zylla = ...
local unpack = _G.unpack
local NeP = _G.NeP
local Mythic_Plus = _G.Mythic_Plus

local GUI = {
	--unpack(Zylla.Logo_GUI),
	-- Header
	{type = 'header', size = 16, text = 'Keybinds', align = 'center'},
	{type = 'checkbox',	text = 'Left Shift: '..Zylla.ClassColor..'Pause|r',	align = 'left', key = 'lshift',	default = true},
	{type = 'checkbox',	text = 'Left Ctrl: '..Zylla.ClassColor..'Infernal Strike|r', align = 'left', key = 'lcontrol', default = false},
	{type = 'checkbox',	text = 'Left Alt: '..Zylla.ClassColor..'Sigil of Flame|r', align = 'left', key = 'lalt', default = false},
	{type = 'checkbox',	text = 'Right Alt: '..Zylla.ClassColor..'|r', align = 'left', key = 'ralt', default = false},
	{type = 'spacer'},
-- --{type = 'checkbox', 	text = 'Enable Chatoverlay', key = 'chat', width = 55, default = true, desc = Zylla.ClassColor..'This will enable some messages as an overlay!|r'},
-- 	--unpack(Zylla.PayPal_GUI),
-- 	{type = 'spacer'},
-- 	--unpack(Zylla.PayPal_IMG),
-- 	{type = 'ruler'}, {type = 'spacer'},
-- 	-- Targetting
-- 	{type = 'header', 	size = 16, text = 'Targetting:',													align = 'center'},
-- 	{type = 'combo', default = 'normal', key = 'target', list = Zylla.faketarget, width = 75},
-- 	{type = 'spacer'},
-- 	{type = 'text', text = Zylla.ClassColor..'Only one can be enabled.\nChose between normal targetting, or hitting the highest/lowest enemy.|r'},
-- 	{type = 'spacer'}, {type = 'ruler'}, {type = 'spacer'},
	-- Settings
	{type = 'header', size = 16, text = 'Settings', align = 'center'},
	{type = 'checkbox', text = 'Enable DBM Integration', key = 'kDBM', default = false},
	{type = 'checkbox',	text = 'Enable \'pre-potting\' and Flasks',	key = 'prepot',	default = false},
	{type = 'combo', default = "1", key = "list", list = Zylla.prepots,	width = 175},
	{type = 'spacer'}, {type = 'spacer'},
	{type = 'checkspin', text = 'Light\'s Judgment - Units', key = 'LJ', spin = 4, max = 20, min = 1, step = 1, shiftStep = 5, check = false, desc = Zylla.ClassColor..'World Spell usable on Argus.|r'},
	{type = 'checkbox', text = 'Use Trinket #1', key = 'trinket1', default = false},
	{type = 'checkbox', text = 'Use Trinket #2', key = 'trinket2', default = false},
	{type = 'checkspin', text = 'Kil\'Jaeden\'s Burning Wish - Units', key = 'kj', align = 'left', width = 55, step = 1, shiftStep = 5, spin = 4, max = 20, min = 1, check = false, desc = Zylla.ClassColor..'Legendary will be used only on selected amount of units!|r'},
	{type = 'checkbox', text = 'Infernal Strike (Flame Crash Talent)', key = 'kIS',	default = true},
	{type = 'checkbox', text = 'Sigil of Flame', key = 'flame',	default = true},
	{type = 'checkbox', text = 'Sigil of Misery', key = 'misery',	default = true},
	{type = 'checkbox', text = 'Sigil of Silence', key = 'silence',	default = true},
	{type = 'ruler'},
	-- Survival
	{type = 'header', text = 'Survival', align = 'center'},
	{type = 'checkspin', text = 'Soul Cleave', key = 'schp', default = 75, max = 100, min = 1, step = 5, shiftStep = 10, check = true},
	{type = 'checkspin', text = 'Demon Spikes Second Charge', key = 'ds2', spin = 70,  max = 100,  min = 1, step = 5, shiftStep = 10,  check = true},
	{type = 'checkspin', text = 'Demon Spikes First Charge', key = 'ds1', spin = 40,  max = 100,  min = 1, step = 5, shiftStep = 10,  check = true},
	{type = 'checkspin', text = 'Empower Wards', key = 'ewards', spin = 70,  max = 100,  min = 1, step = 5, shiftStep = 10,  check = false},
	{type = 'checkspin', text = 'Fiery Brand', key = 'fiery', spin = 70,  max = 100,  min = 1, step = 5, shiftStep = 10,  check = true},
	{type = 'checkspin', text = 'Metamorphosis', key = 'meta', spin = 35,  max = 100,  min = 1, step = 5, shiftStep = 10,  check = true},
	{type = 'checkspin', text = 'Soul Barrier - Soul Fragments', key = 'sb', spin = 4,  max = 10,  min = 1, step = 1, shiftStep = 2,  check = false},
  {type = 'checkspin', text = 'Healthstone', key = 'HS', spin = 45, max = 100, min = 1, step = 5, shiftStep = 10, check = false},
	{type = 'checkspin', text = 'Healing Potion', key = 'AHP', spin = 45, max = 100, min = 1, step = 5, shiftStep = 10, check = false},
	{type = 'ruler'}, {type = 'spacer'},
	unpack(Zylla.Mythic_GUI),
}

local exeOnLoad = function()
	Zylla.ExeOnLoad()
	Zylla.AFKCheck()

	print('|cffADFF2F ----------------------------------------------------------------------|r')
	print('|cffADFF2F --- |rDemon Hunter |cffADFF2FVengeance |r')
	print('|cffADFF2F --- |rRecommended Talents: 1/3 - 2/3 - 3/2 - 4/3 - 5/3 - 6/1 - 7/3')
	print('|cffADFF2F ----------------------------------------------------------------------|r')

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

end

local PreCombat = {
	{'%pause', 'player.buff(Shadowmeld)'},
	-- Pots
	{'#127844', 'UI(list)==1&item(127844).usable&item(127844).count>0&UI(kDBM)&UI(prepot)&!buff(Potion of the Old War)&dbm(pull in)<3', 'player'}, 	--XXX: Potion of the Old War
	{'#127843', 'UI(list)==2&item(127843).usable&item(127843).count>0&UI(kDBM)&UI(prepot)&!buff(Potion of Deadly Grace)&dbm(pull in)<3', 'player'}, 	--XXX: Potion of Deadly Grace
	{'#142117', 'UI(list)==3&item(142117).usable&item(142117).count>0&UI(kDBM)&UI(prepot)&!buff(Potion of Prolonged Power)&dbm(pull in)<3', 'player'}, 	--XXX: Potion of Prolonged Power
	-- Flasks
	{'#127848', 'item(127848).usable&item(127848).count>0&UI(prepot)&!buff(Flask of the Seventh Demon)', 'player'},	--XXX: Flask of the Seventh Demon
}

local Keybinds = {
	{'%pause', 'keybind(lshift)&UI(lshift)'},
	{'Sigil of Flame', 'UI(lalt)&keybind(lalt)', 'cursor.ground'},
	{'Infernal Strike', 'UI(lcontrol)&keybind(lcontrol)', 'cursor.ground'},
}

local Interrupts = {
	{'!Consume Magic', 'target.interruptAt(70)&target.range<=20'},
	{'!Sigil of Misery', 'UI(misery)&advanced&target.interruptAt(1)&target.range<31&spell(Consume Magic).cooldown>gcd&!prev_gcd(Consume Magic)', 'target.ground'},
	{'!Sigil of Silence', 'UI(silence)&advanced&target.interruptAt(5)&target.range<31&spell(Sigil of Misery).cooldown>gcd&spell(Consume Magic).cooldown>gcd&!prev_gcd(Consume Magic)', 'target.ground'},
	{'!Arcane Torrent', 'target.interruptAt(70)&target.inFront&target.inMelee&spell(Consume Magic).cooldown>gcd&!prev_gcd(Consume Magic)'},
}

local Interrupts_Random = {
	{'!Consume Magic', 'interruptAt(70)&toggle(xIntRandom)&toggle(Interrupts)&inFront&range<20', 'enemies'},
--	{'!Sigil of Misery', 'advanced&interruptAt(1)&toggle(xIntRandom)&toggle(Interrupts)&player.spell(Consume Magic).cooldown>gcd&!prev_gcd(Consume Magic)&range<31', 'enemies.ground'},
--	{'!Sigil of Silence', 'advanced&interruptAt(5)&toggle(xIntRandom)&toggle(Interrupts)&player.spell(Sigil of Misery).cooldown>gcd&player.spell(Consume Magic).cooldown>gcd&!prev_gcd(Consume Magic)&range<31', 'enemies.ground'},
	{'!Arcane Torrent', 'interruptAt(70)&toggle(xIntRandom)&toggle(Interrupts)&player.spell(Consume Magic).cooldown>gcd&!prev_gcd(Consume Magic)&inMelee'},
}

local Survival ={
	{'Soul Cleave', 'UI(schp_check) & player.health <= UI(schp_spin)', 'target'},
	{'#152615', 'item(152615).usable&item(152615).count>0&health<=UI(AHP_spin)&UI(AHP_check)', 'player'}, 													--XXX: Astral Healing Potion
	{'#127834', 'item(152615).count==0&item(127834).usable&item(127834).count>0&health<=UI(AHP_spin)&UI(AHP_check)', 'player'}, 		--XXX: Ancient Healing Potion
	{'#5512', 'item(5512).usable&item(5512).count>0&health<=UI(HS_spin)&UI(HS_check)', 'player'}, 																	--XXX: Health Stone
}

local xTaunts = {
	{'Torment', 'combat&alive&threat<100&range<=30', 'enemies'},
	{'Throw Glaive', 'combat&alive&threat<100&range<=30&inFront', 'enemies'},
}

local Mitigations = {
	{'&Metamorphosis', 'toggle(cooldowns)&UI(meta_check)&player.health<=UI(meta_spin)'},
	{'&Fiery Brand', 'toggle(cooldowns)&UI(fiery_check)&player.health<=UI(fiery_spin)', 'target'},
	{'&Demon Spikes', 'UI(ds2_check) & player.health <= UI(ds2_spin) & player.spell(Demon Spikes).charges>=2 & !player.buff(Demon Spikes) & !player.buff(Metamorphosis)'},
	{'&Demon Spikes', 'UI(ds1_check) & player.health <= UI(ds1_spin) & player.spell(Demon Spikes).charges>=0 & player.spell(Demon Spikes).charges < 2 & !player.buff(Demon Spikes) & !player.buff(Metamorphosis)'},
	{'&Empower Wards', 'toggle(cooldowns)&UI(ewards_check)&player.health<=UI(ewards_spin)'},
	{'!Soul Barrier', 'buff(Soul Fragments).count>UI(sb_spin&UI(sb_check))', 'player'},
}

local xCombat = {
	{'#trinket1', 'UI(trinket1)'},
	{'#trinket2', 'UI(trinket2)'},
	{'Light\'s Judgment', 'UI(LJ_check)&range<61&area(15).enemies>UI(LJ_spin)', 'enemies'},
	{'Spirit Bomb', 'count(Frailty).enemies.debuffs==0&player.buff(Soul Fragments).count>0', 'target'},
	--{'Soul Cleave', 'player.pain>69||player.incdmg(1)>=player.health.max*0.25', 'target'},
	{'Spirit Bomb', 'player.buff(Soul Fragments).count>3', 'enemies'},
	{'Soul Carver', 'target.inFront', 'target'},
	{'&Infernal Strike', 'UI(kIS)&target.inMelee&!player.moving&talent(3,2)&target.debuff(Sigil of Flame).duration<3&player.spell(Sigil of Flame).cooldown>gcd*3&player.spell(Sigil of Flame).cooldown<25&player.spell(Infernal Strike).charges==2','player.ground'},
	{'Immolation Aura', 'player.area(9).enemies >=1 & target.range<=9'},
	{'Shear', 'inFront&player.buff(Metamorphosis)&player.pain<90', 'target'},
	{'Sigil of Flame', 'UI(flame)&!talent(5,1)&toggle(aoe)&advanced&range<31&!target.debuff(Sigil of Flame)', 'target.ground'},
	{'Sigil of Flame', 'UI(flame)&{talent(5,1)||!advanced}&area(10).enemies>0&!target.debuff(Sigil of Flame)', 'player.ground'},
	{'Fracture', '{!UI(schp_check) || player.health>UI(schp_spin)}&{player.pain>49||player.buff(Soul Fragments).count<4}', 'target'},
	{'Felblade', 'player.pain<81', 'target'},
	{'Fel Devastation', 'player.incdmg(1)>=player.health.max*0.25'},
	{'Fel Eruption', 'target.inFront', 'target'},
	{'Shear', 'inFront', 'target'},

}

local Ranged = {
	{'Throw Glaive', 'toggle(aoe)&range>10&range<31&inFront', 'target'},
	--{'Sigil of Chains', 'advanced&range<31&area(8).enemies>2&combat', 'enemies.ground'},
}

local inCombat = {
	{Keybinds},
	{Interrupts_Random},
	{Interrupts, 'toggle(Interrupts)'},
	{xTaunts, 'toggle(super_taunt)'},
	{Ranged},
	{Mitigations},
	{Survival},
	{Mythic_Plus, 'inMelee'},
	--{xCombat, 'combat&alive&range<41', (function() return NeP.DSL:Get("UI")(nil, 'target') end)}, --TODO: TEST! ALOT MORE TESTING!}
	{xCombat},
	{'#144259', 'UI(kj_check)&range<41&area(10).enemies>=UI(kj_spin)&equipped(144259)', 'target'}, --XXX: Kil'jaeden's Burning Wish (Legendary)
}

local outCombat = {
	{PreCombat},
	{Keybinds},
	{Interrupts_Random},
	{Interrupts, 'toggle(Interrupts)'},
}

NeP.CR:Add(581, {
	name = '['..Zylla.ClassColor..'Camby\'s|r] Demon Hunter - Vengeance',
	ic = inCombat,
	ooc = outCombat,
	gui = GUI,
	gui_st = Zylla.GuiSettings,
	ids = Zylla.SpellIDs[Zylla.Class],
	wow_ver = Zylla.wow_ver,
	nep_ver = Zylla.nep_ver,
	load = exeOnLoad
})
