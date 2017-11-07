local _, Zylla = ...
local unpack = _G.unpack
local NeP = _G.NeP
local Mythic_Plus = _G.Mythic_Plus

local GUI = {
	--unpack(Zylla.Logo_GUI),
	-- Header
	{type = 'header',  	size = 16, text = 'Keybinds',	 														align = 'center'},
	{type = 'checkbox',	text = 'Left Shift: '..Zylla.ClassColor..'Pause|r',				align = 'left', 			key = 'lshift', 	default = true},
	{type = 'checkbox',	text = 'Left Ctrl: '..Zylla.ClassColor..'Sindragosa\'s Fury|r',	align = 'left', key = 'lcontrol', default = true},
	{type = 'checkbox',	text = 'Left Alt: '..Zylla.ClassColor..'|r',							align = 'left', 			key = 'lalt', 		default = false},
	{type = 'checkbox',	text = 'Right Alt: '..Zylla.ClassColor..'|r',							align = 'left', 			key = 'ralt', 		default = false},
	{type = 'spacer'},
--{type = 'checkbox', text = 'Enable Chatoverlay', key = 'chat', width = 55, default = true, desc = Zylla.ClassColor..'This will enable some messages as an overlay!|r'},
--unpack(Zylla.PayPal_GUI),
	--{type = 'spacer'},
	--unpack(Zylla.PayPal_IMG),
	--{type = 'ruler'},	 	{type = 'spacer'},
	-- Settings
	{type = 'header', size = 16, text = 'Settings',	align = 'center',	size = 16},
	{type = 'ruler'}, {type = 'spacer'},
	-- Class Settings
	{type = 'checkbox', text = 'Use Death Grip as backup Interrupt', key = 'DGInt', default = false},
	{type = 'checkbox', text = 'Wraithwalk out of Root', key = 'wraithroot', default = false},
	{type = 'checkbox', text = 'Obliteration', key = 'oblit', default = true},
	{type = 'checkbox', text = 'Pillar of Frost', key = 'pof', default = true},
	{type = 'checkbox', text = 'Sindragosa\'s Fury', key = 'sf', default = true},

		-- Survival
	{type = 'header', 		size = 16, text = 'Survival',	align = 'center',	size = 16},
	{type = 'checkbox',		text = 'Anti-Magic Shell',	align = 'left', key = 'ams', default = false},
	{type = 'checkspin', 	text = 'Icebound Fortitude', key = 'ibf', spin = 45, step = 5, shiftStep = 10, max = 100, min = 1, check = true},
	{type = 'checkspin',	text = 'Healthstone', 	key = 'HS', spin = 45, step = 5, shiftStep = 10, max = 100, min = 1, check = false},
	{type = 'checkspin',	text = 'Ancient Healing Potion', key = 'AHP', spin = 45, step = 5, shiftStep = 10, max = 100, min = 1, check = false},
	{type = 'spinner', 		text = 'Death Strike', 	key = 'ds',	default_spin = 45},
	{type = 'ruler'},{type = 'spacer'},
	unpack(Zylla.Mythic_GUI),
}

local exeOnLoad = function()
	Zylla.ExeOnLoad()
	Zylla.AFKCheck()

	print('|cffADFF2F ---------------------------------------------------------------------------|r')
	print('|cffADFF2F --- |rDEATH KNIGHT |cffADFF2FFrost  BoS not currently supported|r')
	print('|cffADFF2F --- |rRecommended Talents:  1/3 - 2/2 - 3/1 - 4/X - 5/X - 6/3 - 7/1')
	print('|cffADFF2F ---------------------------------------------------------------------------|r')
	NeP.Interface:AddToggle({
		key = 'xIntRandom',
		name = 'Interrupt Anyone',
		text = 'Interrupt all nearby enemies, without targeting them.',
		icon = 'Interface\\Icons\\inv_ammo_arrow_04',
	})

end

local PreCombat = {

}

local Keybinds = {
	-- Pause
	{'%pause', 'keybind(lshift)&UI(lshift)'},
	{'Sindragosa\'s Fury', 'UI(lcontrol)&keybind(lcontrol)'},
}

local Interrupts = {
	{'!Mind Freeze', 'inFront&range<=15'},
	{'!Death Grip', 'UI(DGInt)&range<=30&inFront&spell(Mind Freeze).cooldown>=gcd'},
	{'!Arcane Torrent', 'inMelee&spell(Mind Freeze).cooldown>=gcd&!player.lastgcd(Mind Freeze)'},
}

local Survival = {
	{'Death Strike', 'player.health <= 75 & player.buff(Dark Succor)', 'target'},
	{'Death Strike', 'player.health <= UI(ds) & player.runicpower > = 45', 'target'},
	{'Icebound Fortitude', 'UI(ibf_check)&player.health<=UI(ibf_spin)'},
	{'Anti-Magic Shell', 'incdmg(2.5).magic>health.max*0.70 & UI(ams)'},
	{'Wraith Walk', 'state(root) & UI(wraithroot)'},
	{'#152615', 'item(152615).usable&item(152615).count>0&health<=UI(AHP_spin)&UI(AHP_check)'}, 													--XXX: Astral Healing Potion
	{'#127834', 'item(152615).count==0&item(127834).usable&item(127834).count>0&health<=UI(AHP_spin)&UI(AHP_check)'}, 		--XXX: Ancient Healing Potion
	{'#5512', 'item(5512).usable&item(5512).count>0&health<=UI(HS_spin)&UI(HS_check)'},
}
local Cooldowns = {
	{'Blood Fury', '!talent(7,2)||target.dot(Breath of Sindragosa).ticking'},
	{'Berserking', 'player.buff(Pillar of Frost)'},
    -- actions.standard+=/sindragosas_fury,if=(equipped.consorts_cold_core|buff.pillar_of_frost.up)&buff.unholy_strength.up&debuff.razorice.stack=5
	{'Sindragosa\'s Fury', 'UI(sf)&{equipped(144293) || player.buff(Pillar of Frost)} & player.buff(Unholy Strength) & debuff(Razorice).count = 5', 'target'},
	-- # Pillar of frost conditions
	-- actions.cds+=/pillar_of_frost,if=talent.obliteration.enabled&(cooldown.obliteration.remains>20|cooldown.obliteration.remains<10|!talent.icecap.enabled)
	{'Pillar of Frost', 'UI(pof)&talent(7,1) & {cooldown(Obliteration).remains > 20 || cooldown(Obliteration).remains < 10 || !talent(3,1)}'},
	-- actions.cds+=/pillar_of_frost,if=talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.ready&runic_power>50
	-- actions.cds+=/pillar_of_frost,if=talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains>40
	-- actions.cds+=/pillar_of_frost,if=talent.hungering_rune_weapon.enabled
	{'Pillar of Frost', 'UI(pof)&talent(7,3)'},
	-- actions.cds+=/breath_of_sindragosa,if=buff.pillar_of_frost.up
	-- actions.cds+=/call_action_list,name=cold_heart,if=equipped.cold_heart&((buff.cold_heart.stack>=10&!buff.obliteration.up)|target.time_to_die<=gcd)
	--actions.cds+=/obliteration,if=rune>=1&runic_power>=20&(!talent.frozen_pulse.enabled|rune<2|buff.pillar_of_frost.remains<=12)&(!talent.gathering_storm.enabled|!cooldown.remorseless_winter.ready)&(buff.pillar_of_frost.up|!talent.icecap.enabled)
	{'Obliteration', 'UI(oblit)&{player.buff(Pillar of Frost) || cooldown(Pillar of Frost).remains > 10}'},
	-- actions.cds+=/hungering_rune_weapon,if=!buff.hungering_rune_weapon.up&rune.time_to_2>gcd&runic_power<40

}

local obliteration = {
-- #Obliteration rotation
-- actions.obliteration=remorseless_winter,if=talent.gathering_storm.enabled
	{'Remorseless Winter', 'talent(6,3)&target.range<10'},
-- actions.obliteration+=/frostscythe,if=buff.killing_machine.up&spell_targets.frostscythe>1
	{'Frostscythe', 'toggle(aoe) & player.buff(Killing Machine) & player.area(9).enemies.inFront>=1', 'target'},
-- actions.obliteration+=/obliterate,if=buff.killing_machine.up|(spell_targets.howling_blast>=3&!buff.rime.up)
	{'Obliterate', 'player.buff(Killing Machine) || {!player.buff(Rime) & target.area(10).enemies >= 3}', 'target'},
-- actions.obliteration+=/howling_blast,if=buff.rime.up&spell_targets.howling_blast>1
	{'Howling Blast', 'player.buff(Rime) & target.area(10).enemies > 1', 'target'},
-- actions.obliteration+=/howling_blast,if=!buff.rime.up&spell_targets.howling_blast>2&rune>3&talent.freezing_fog.enabled&talent.gathering_storm.enabled
	{'Howling Blast', '!player.buff(Rime) & target.area(10).enemies > 2 & runes > 3 & talent(2,1) & talent(6,3)', 'target'},
-- actions.obliteration+=/frost_strike,if=!buff.rime.up|rune.time_to_1>=gcd|runic_power.deficit<20
	{'Frost Strike', 'player.health > UI(ds) & {!player.buff(Rime) || player.runes < 1 || deficit < 20}', 'target'},
-- actions.obliteration+=/howling_blast,if=buff.rime.up
	{'Howling Blast', 'player.buff(Rime)', 'target'},
-- actions.obliteration+=/obliterate
	{'Obliterate'},
}
local standard1 = {
	{'Remorseless Winter', 'player.area(10).enemies>0'},
	{'Obliterate', 'player.runes >= 4', 'target'},
	{'Frost Strike', 'player.health > UI(ds) & {!talent(1,1) || debuff(Razorice).count < 5} & deficit <= 10', 'target'},
	{'Howling Blast', 'player.buff(Rime)', 'target'},
	{'Frostscythe', 'toggle(aoe) & talent(6,1) & player.buff(Killing Machine) & {!equipped(132366) || player.area(9).enemies.inFront >= 1}'},
	{'Obliterate', 'player.buff(Killing Machine)&{!toggle(aoe)||player.area(9).enemies.inFront<2}', 'target'},
	{'Frostscythe', 'toggle(aoe) & talent(6,1) & player.area(9).enemies.infront >= 3'},
	{'Frost Strike', 'player.health > UI(ds) & {!talent(1,1) || debuff(Razorice).count < 5} & deficit <= 20', 'target'},
	{'Obliterate'},
	{'Frost Strike', 'player.health > UI(ds)'},
	{'Empowered Rune Weapon'},


}
local standard = {
-- # Standard rotation
-- actions.standard=frost_strike,if=talent.icy_talons.enabled&buff.icy_talons.remains<=gcd
	{'Frost Strike', 'player.health > UI(ds) & talent(1,2) & player.buff(Icy Talons).remains < gcd', 'target'},
-- actions.standard+=/frost_strike,if=talent.shattering_strikes.enabled&debuff.razorice.stack=5&buff.gathering_storm.stack<2&!buff.rime.up
	{'Frost Strike', 'player.health > UI(ds) & talent(1,1) & debuff(Razorice).count>=5 & player.buff(Gathering Storm).stack < 2 & !player.buff(Rime)', 'target'},
-- actions.standard+=/remorseless_winter,if=(buff.rime.react&equipped.perseverance_of_the_ebon_martyr)|talent.gathering_storm.enabled
	{'Remorseless Winter', '{equipped(132459) & player.buff(Rime)} || talent(6,3) ', 'target'},
-- actions.standard+=/obliterate,if=(equipped.koltiras_newfound_will&talent.frozen_pulse.enabled&set_bonus.tier19_2pc=1)|rune.time_to_4<gcd&buff.hungering_rune_weapon.up
	{'Obliterate', 'player.runes >= 4 & player.buff(Hungering Rune Weapon)', 'target'},
-- actions.standard+=/frost_strike,if=(!talent.shattering_strikes.enabled|debuff.razorice.stack<5)&runic_power.deficit<10
	{'Frost Strike', '{!talent(1,1) || debuff(Razorice).count < 5} & deficit < 10 & player.health > UI(ds)', 'target'},
-- actions.standard+=/howling_blast,if=buff.rime.react
	{'Howling Blast', 'player.buff(Rime)', 'target'},
-- actions.standard+=/obliterate,if=(equipped.koltiras_newfound_will&talent.frozen_pulse.enabled&set_bonus.tier19_2pc=1)|rune.time_to_5<gcd
	{'Obliterate', 'player.runes > 4', 'target'},

-- actions.standard+=/frost_strike,if=runic_power.deficit<10&!buff.hungering_rune_weapon.up
	{'Frost Strike', 'player.health > UI(ds)& !player.buff(Hungering Rune Weapon) & player.deficit < 10', 'target'},
-- actions.standard+=/frostscythe,if=buff.killing_machine.up&(!equipped.koltiras_newfound_will|spell_targets.frostscythe>=2)
	{'Frostscythe', 'toggle(aoe) & talent(6,1) & player.buff(Killing Machine) & {!equipped(132366) || player.area(9).enemies.infront >= 2}', 'target'},
-- actions.standard+=/obliterate,if=buff.killing_machine.react
	{'Obliterate', 'player.buff(Killing Machine)', 'target'},
-- actions.standard+=/frost_strike,if=runic_power.deficit<20
	{'Frost Strike', 'player.health > UI(ds) & deficit < 20', 'target'},
-- actions.standard+=/remorseless_winter,if=spell_targets.remorseless_winter>=2
	{'Remorseless Winter', 'player.area(9).enemies >= 2', 'target'},
-- actions.standard+=/glacial_advance,if=spell_targets.glacial_advance>=2
	{'Glacial Advance', 'talent(3,2) & player.area(30).enemies.inFront >= 2'},
-- actions.standard+=/frostscythe,if=spell_targets.frostscythe>=3
	{'Frostscythe', 'toggle(aoe) & talent(6,1) & player.area(9).enemies.inFront >= 3'},
-- actions.standard+=/obliterate,if=!talent.gathering_storm.enabled|cooldown.remorseless_winter.remains>(gcd*2)
	{'Obliterate', '!talent(6,3) || cooldown(Remorseless Winter).remains > 3', 'target'},
-- actions.standard+=/horn_of_winter,if=!buff.hungering_rune_weapon.up&(rune.time_to_2>gcd|!talent.frozen_pulse.enabled)
	{'Horn of Winter', '!player.buff(Hungering Rune Weapon) & {player.runes > 2 || !talent(6,2)}'},
-- actions.standard+=/frost_strike,if=!(runic_power<50&talent.obliteration.enabled&cooldown.obliteration.remains<=gcd)
	{'Frost Strike', 'player.health > UI(ds) & !{player.runicpower < 50 & talent(7,1) & cooldown(Obliteration).remains <= gcd}', 'target'},
-- actions.standard+=/obliterate,if=!talent.gathering_storm.enabled|talent.icy_talons.enabled
	{'Obliterate', '!talent(6,3) || talent(1,2)', 'target'},
-- actions.standard+=/empower_rune_weapon,if=!talent.breath_of_sindragosa.enabled|target.time_to_die<cooldown.breath_of_sindragosa.remains
	{'Empower Rune Weapon', 'toggle(cooldowns) & {!talent(7,3) || ttd < cooldown(Breath of Sindragosa).remains}'},
}


local xCombat = {
	{obliteration, 'player.buff(Obliteration)'},
	{standard1},
}

local inCombat = {
	{Keybinds},
	{Interrupts, 'toggle(Interrupts)&interruptAt(70)', 'target'},
	{Interrupts, 'toggle(Interrupts)&toggle(xIntRandom)&interruptAt(70)', 'enemies'},
	{Survival, 'player.health<100'},
	{Cooldowns, 'toggle(Cooldowns)&target.inMelee'},
	{xCombat},
	{Mythic_Plus, 'inMelee'}
}

local outCombat = {
	{Keybinds},
	{PreCombat},
}
NeP.CR:Add(251, {
	name = Zylla.ClassColor..'[Camby\'s] Death Knight - Frost',
	ic = inCombat,
	ooc = outCombat,
	gui = GUI,
	gui_st = Zylla.GuiSettings,
	ids = Zylla.SpellIDs[Zylla.Class],
	wow_ver = Zylla.wow_ver,
	nep_ver = Zylla.nep_ver,
	load = exeOnLoad
})
