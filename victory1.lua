local storyboard = require("storyboard")
local scene = storyboard.newScene()
local vitoria
local nextGame
local backMenu
local onTap

function scene:createScene( event )
	local group = self.view
	vitoria = display.newImage("endGame.png",display.contentWidth/2,display.contentHeight/2)
	nextGame = display.newRect(0,0,300,100);nextGame.x,nextGame.y=205,275;nextGame.alpha=0;nextGame.isHitTestable = true
	backMenu = display.newRect(0,0,300,100);backMenu.x,backMenu.y=205,400;backMenu.alpha=0;backMenu.isHitTestable = true
	group:insert(vitoria)
	group:insert(nextGame)
	group:insert(backMenu)
end

function scene:enterScene( event )
	onTap = function (event)
		if event.target == nextGame then
			storyboard.gotoScene("loadStage2")
		elseif event.target == backMenu then
			storyboard.gotoScene("mainMenu")
		end
	end
	nextGame:addEventListener("tap",onTap)
	backMenu:addEventListener("tap",onTap)
end

function scene:exitScene( event )
	nextGame:removeEventListener("tap",onTap)
	backMenu:removeEventListener("tap",onTap)
	timer.performWithDelay(1,function () storyboard.purgeScene("victory1") end)
end

function scene:destroyScene(event)
	vitoria:removeSelf()
	nextGame:removeSelf()
	backMenu:removeSelf()
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )

return scene