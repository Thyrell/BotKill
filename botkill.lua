local BotNames = {
	"Cliffe",
	"Minh",
	"Crusher",
	"Garret",
	"Rock",
	"Shark",
	"Wolf",
	"Gunner",
	"Vitaliy",
	"Ridgway",
	"Steel",
	"Stone",
	"Arnold",
	"Brett",
	"Kurt",
	"Kyle",
	"Moe",
	"Quade",
	"Quintin",
	"Ringo",
	"Rip",
	"Zach",
	"Cory",
	"Quinn",
	"Seth",
	"Vinny",
	"Brian",
	"Chad",
	"Chet",
	"Gabe",
	"Hank",
	"Ivan",
	"Jim",
	"Joe",
	"John",
	"Tony",
	"Tyler",
	"Victor",
	"Vladimir",
	"Zane",
	"Zim",
	"Adrian",
	"Bank",
	"Brad",
	"Connor",
	"Dave",
	"Dan",
	"Derek",
	"Don",
	"Eric",
	"Erik",
	"Finn",
	"Jeff",
	"Kevin",
	"Reed",
	"Rick",
	"Ted",
	"Troy",
	"Wade",
	"Wayne",
	"Xander",
	"Xavier",
	"Adam",
	"Andy",
	"Chris",
	"Colin",
	"Dennis",
	"Doug",
	"Duffy",
	"Gary",
	"Grant",
	"Greg",
	"Ian",
	"Jerry",
	"Jon",
	"Keith",
	"Matt",
	"Mike",
	"Nate",
	"Paul",
	"Scott",
	"Steve",
	"Tom",
	"Yahn",
	"Alfred",
	"Bill",
	"Brandon",
	"Calvin",
	"Dean",
	"Dustin",
	"Ethan",
	"Harold",
	"Henry",
	"Irving",
	"Jason",
	"Jenssen",
	"Josh",
	"Martin",
	"Nick",
	"Norm",
	"Orin",
	"Pat",
	"Perry",
	"Ron",
	"Shawn",
	"Tim",
	"Will",
	"Wyatt",
	"Albert",
	"Allen",
	"Bert",
	"Bob",
	"Cecil",
	"Clarence",
	"Elliot",
	"Ernie",
	"Elmer",
	"Eugene",
	"Fergus",
	"Ferris",
	"Frank",
	"Frasier",
	"Fred",
	"George",
	"Graham",
	"Harvey",
	"Irwin",
	"Larry",
	"Lester",
	"Marvin",
	"Neil",
	"Niles",
	"Oliver",
	"Opie",
	"Ryan",
	"Toby",
	"Ulric",
	"Ulysses",
	"Uri",
	"Waldo",
	"Wally",
	"Walt",
	"Wesley",
	"Yanni",
	"Yogi",
	"Yuri"
}


local function IgnorePlayers(target)
	---[[
	local playername = target:GetName()
	if playername then
		local isBot
		for i, name in pairs(BotNames) do
			if playername==name then
				isBot=true
			end
		end
		if not isBot then
			target:SetProp("m_bGunGameImmunity", 1)
			print(playername)
		end
	end
	--]]
	--[[
	local bot = target:GetProp("m_iBotDifficulty")
	print(tostring(bot))
	--]]
end

callbacks.Register("AimbotTarget", IgnorePlayers)

function CHAT_KillSay( Event ) -- lol paste

	if ( Event:GetName() == 'player_death' ) then

		local ME = client.GetLocalPlayerIndex();

		local INT_UID = Event:GetInt( 'userid' );
		local INT_ATTACKER = Event:GetInt( 'attacker' );

		local NAME_Victim = client.GetPlayerNameByUserID( INT_UID );
		local INDEX_Victim = client.GetPlayerIndexByUserID( INT_UID );

		local NAME_Attacker = client.GetPlayerNameByUserID( INT_ATTACKER );
		local INDEX_Attacker = client.GetPlayerIndexByUserID( INT_ATTACKER );

		local isBot
		for i, name in pairs(BotNames) do
			if NAME_Victim==name then
				isBot=true
			end
		end
		if not isBot then
			if ( INDEX_Attacker == ME and INDEX_Victim ~= ME ) then
				client.ChatSay( "Sorry for killing " .. NAME_Victim .. ", I try to only kill bots." );
			end
		end

  end

end

client.AllowListener( 'player_death' );

callbacks.Register( 'FireGameEvent', 'AWKS', CHAT_KillSay );
