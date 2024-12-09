local LessUaB = RegisterMod("Less Unknown and Blind", 1)

function LessUaB:onNewLevel()
	-- Don't run on a challenge run. 
	if Game().Challenge ~= Challenge.CHALLENGE_NULL then 
		return
	end
	
	local curseID = Game():GetLevel():GetCurses()
	local stageID = Game():GetLevel():GetStage()
	
	if stageID >= 7 then
		--Isaac.DebugString("[GOLD] Checking for curse")
		print(curseID)
		if curseID == 64 then
			--Isaac.DebugString("[GOLD] Removing Curse of the Blind")
			Game():GetLevel():RemoveCurses(curseID)
		elseif curseID == 8 then
			--Isaac.DebugString("[GOLD] Removing Curse of the Unknown")
			Game():GetLevel():RemoveCurses(curseID)
		end
	end
end
function LessUaB:onGameStart(isContinued)
	if isContinued then
		LessUaB:onNewLevel()
	end
end
LessUaB:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, LessUaB.onNewLevel)
LessUaB:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, LessUaB.onGameStart)