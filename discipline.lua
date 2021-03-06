local _, Zylla = ...
local unpack = _G.unpack
local NeP = _G.NeP
local Mythic_Plus = _G.Mythic_Plus

local GUI = {
	--unpack(Zylla.Logo_GUI),
	-- Header
	{type = 'header',  	size = 16, text = 'Keybinds',	 														align = 'center'},
	{type = 'checkbox',	text = 'Left Shift: '..Zylla.ClassColor..'Pause|r',				align = 'left', 			key = 'lshift', 	default = true},
	{type = 'checkbox',	text = 'Left Ctrl: '..Zylla.ClassColor..'|r',							align = 'left', 			key = 'lcontrol',	default = true},
	{type = 'checkbox',	text = 'Left Alt: '..Zylla.ClassColor..'|r',							align = 'left', 			key = 'lalt', 		default = true},
	{type = 'checkbox',	text = 'Right Alt: '..Zylla.ClassColor..'|r',							align = 'left', 			key = 'ralt', 		default = true},
	{type = 'spacer'},
--{type = 'checkbox', text = 'Enable Chatoverlay', 															key = 'chat', 				width = 55, 			default = true, desc = Zylla.ClassColor..'This will enable some messages as an overlay!|r'},
	--unpack(Zylla.PayPal_GUI),
	--{type = 'spacer'},
	--unpack(Zylla.PayPal_IMG),
	--{type = 'ruler'},	 	{type = 'spacer'},
	-- Settings
	{type = 'checkbox', text = 'Mass Dispel enabled', 														key = 'kMD', 					default = false},
	{type = 'checkbox', text = 'Power Word: Barrier enabled', 										key = 'kPWB', 				default = false},
	{type = 'ruler'},		{type = 'spacer'},
	unpack(Zylla.Mythic_GUI),
}

local exeOnLoad = function()
	Zylla.ExeOnLoad()
	Zylla.AFKCheck()

	print('|cffADFF2F ---------------------------------------------------------------------------|r')
	print('|cffADFF2F --- |PRIEST |cffADFF2FDiscipline|r')
	print('|cffADFF2F --- |rRecommended Talents: Not ready yet.')
	print('|cffADFF2F ---------------------------------------------------------------------------|r')

end

local Keybinds = {
	{'%pause', 'keybind(lshift)&UI(lshift)'}, -- Pause.
	{'!Mass Dispel', 'keybind(lctrl)&UI(kMD)', 'cursor.ground'}, --Mass Dispel.
	{'!Power Word: Barrier', 'keybind(lalt)&UI(kPWB)', 'cursor.ground'} --Power Word: Barrier.
}

local Cooldowns = {
	{'Mindbender', nil, 'target'}, 	--Mind Bender for better Mana Regen and dps boost.
	{'Power Infusion'}, 						--Power Infusion for some BOOOST YO!
	{'Divine Star', 'player.area(20).enemies.inFront>2', 'target'}, -- Divine Star (if selected) for some small AoE dmg dealing.
	{'Light\'s Wrath', 'debuff(Schism)&player.buff(Overloaded with Light)', 'target'},
}

local Tank = {
  {'Clarity of Will', 'talent(6,1)&incdmg(7)>health.max*0.70||area(5).enemies>2', 'tank'}, --Clarity of Will (if selected) to keep our tank secure and healthy.
	{'Power Word: Shield', '!buff(Power Word: Shield)||player.buff(Rapture)', 'tank'}, --Power Word: Shield the Tank
	{'Pain Suppression', 'health<30', 'tank'}, --Pain Suppression for less damage intake.
	{'Shadow Mend', 'health<50', 'tank'}, --Shadow Mend for huge direct heal.
}

local Lowest = {
	{'Plea', '!buff(Atonement)&health<100', 'lowest'}, --Plea for an instant Atonement.
	{'Power Word: Shield', 'health<100||player.buff(Rapture)&!buff(Power Word: Shield)', 'lowest'}, --Power Word: Shield Use to absorb low to moderate damage and to apply Atonement.
	{'Shadow Mend', 'health<70', 'lowest'}, --Shadow Mend for a decent direct heal.
	{'Penance', 'health<90&talent(1,1)', 'lowest'}, -- Penance (if talent 'Penitent' selected)
	{'Plea', 'health<100', 'lowest'}, --Plea for an efficient direct heal and to apply Atonement.
	{'Divine Star', 'player.area(80, 20).heal>2'} -- Divine Star (if selected) for a quick heal&dmg dealing.
}

local Atonement = {
	{'Purge the Wicked', 'talent(7,1)&target.debuff(Purge the Wicked).duration<3&target.debuff(Schism)||!talent(1,3)&talent(7,1)&target.debuff(Purge the Wicked).duration<2.7'}, 	--Purge of the Wicked for a low to moderate HoT to your Atonement targets.
	{'Shadow Word: Pain', '!talent(7,1)&target.debuff(Shadow Word: Pain).duration<2&target.debuff(Schism)||!talent(1,3)&!talent(7,1)&target.debuff(Shadow Word: Pain).duration<2.7'},	--Shadow Word: Pain (if no PotW Talent is selected) for a low to moderate HoT to your Atonement targets.
	{'Purge the Wicked', 'talent(7,1)&target.debuff(Purge the Wicked).duration<2.7'}, 	--Purge of the Wicked for a low to moderate HoT to your Atonement targets.
	{'Shadow Word: Pain', '!talent(7,1)&target.debuff(Shadow Word: Pain).duration<2.7'},	--Shadow Word: Pain (if no PotW Talent is selected) for a low to moderate HoT to your Atonement targets.
	{'Schism', 'target.debuff(Schism).duration<1.5'},	--Schism on cooldown for damage&heal buff
	{'Penance', 'target.debuff(Schism)||!talent(1,3)', 'target'}, --Penance on cooldown for low to moderate healing to your Atonement targets.
	{'Smite', 'target.debuff(Schism)||!talent(1,3)', 'target'} --Smite for low to moderate healing to your Atonement targets.
}

local inCombat = {
	{'%dispelall'},
	{'Arcane Torrent', 'player.mana<50'},
	{Keybinds},
	{Cooldowns, 'toggle(Cooldowns)'},
	{Tank, 'tank.health<100'},
	{Lowest, 'lowest.health<100'},
	{Mythic_Plus, 'range<=40'},
	{Atonement}
}

local outCombat = {
		{Keybinds},
		{'Plea', '!buff(Atonement)&health<105', 'lowest'}
}

NeP.CR:Add(256, {
	name = '[|cff'..Zylla.addonColor..'Camby\'s|r] Priest - Discipline',
	ic = inCombat,
	ooc = outCombat,
	gui = GUI,
	gui_st = Zylla.GuiSettings,
	ids = Zylla.SpellIDs[Zylla.Class],
	wow_ver = Zylla.wow_ver,
	nep_ver = Zylla.nep_ver,
	load = exeOnLoad
})
