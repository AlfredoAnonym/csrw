------------------------------------------
-- 			  TopBarChat				--
------------------------------------------
-- Developer: Braydon Davis				--
-- File: s.lua							--
-- Copyright 2013 (C) Braydon Davis		--
-- All rights reserved.					--	
------------------------------------------
local rName = getResourceName ( getThisResource ( ) )
function sendClientMessage ( msg, who, r, g, b, pos, time )
	if ( msg and who ) then
		if ( isElement ( who ) ) then
			triggerClientEvent ( who, rName..":sendClientMessage", who, msg, r, g, b, pos, time )
			return true
		else return false end
	else return false end
end

addEventHandler ( "onPlayerJoin", root, function ( )
	sendClientMessage ( '* '..getPlayerName ( source )..' has joined!', root, 255, 100, 100, false )
end )

addEventHandler ( 'onPlayerQuit', root, function ( tp, reason, respons )
	if ( tp == 'Kicked' or tp == 'Banned' ) then
		msg = '['..tp..' - '..respons..'] ('..reason..')'
	else
		msg = '['..tp..']'
	end
	sendClientMessage ( "* "..getPlayerName ( source ).." has quit. "..msg, root, 255, 100, 100, false )
end )
