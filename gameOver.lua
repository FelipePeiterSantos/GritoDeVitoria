local storyboard = require("storyboard")
local scene = storyboard.newScene()
local derrota
local recomecar
local backMenu
local onTap

function scene:createScene( event )
	local group = self.view
	derrota = display.newImage("gameOver.png",display.contentWidth/2,display.contentHeight/2)
	recomecar = display.newRect(0,0,300,100);recomecar.x,recomecar.y=205,275;recomecar.alpha=0;recomecar.isHitTestable = true
	backMenu = display.newRect(0,0,300,100);backMenu.x,backMenu.y=205,400;backMenu.alpha=0;backMenu.isHitTestable = true
	group:insert(derrota)
	group:insert(recomecar)
	group:insert(backMenu)
end

function scene:enterScene( event )
	onTap = function (event)
		if event.target == recomecar then
			storyboard.gotoScene("stage1_1")
		elseif event.target == backMenu then
			storyboard.gotoScene("mainMenu")
		end
	end
	recomecar:addEventListener("tap",onTap)
	backMenu:addEventListener("tap",onTap)
end

function scene:exitScene( event )
	recomecar:removeEventListener("tap",onTap)
	backMenu:removeEventListener("tap",onTap)
	timer.performWithDelay(1,function () storyboard.purgeScene("gameOver") end)
end

function scene:destroyScene(event)
	derrota:removeSelf()
	recomecar:removeSelf()
	backMenu:removeSelf()
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )

return scene