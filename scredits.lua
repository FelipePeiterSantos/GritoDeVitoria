local storyboard = require("storyboard")
local scene = storyboard.newScene()
local blackscene
local button
local onTap
function scene:createScene( event )
	local group = self.view
	button = display.newCircle(713,416,45);button.alpha=0;button.isHitTestable = true
	blackscene = display.newImage("creditos.png")
	group:insert(blackscene)
	group:insert(button)
end
function scene:enterScene( event )
	blackscene.x,blackscene.y = display.contentWidth/2,display.contentHeight/2

	onTap = function (event)
		storyboard.gotoScene("mainMenu")--("mainMenu")
	end
	button:addEventListener("tap", onTap)
end
function scene:exitScene( event )
	button:removeEventListener("tap", onTap)
	timer.performWithDelay(1,function () storyboard.purgeScene("scredits") end)
end
function scene:destroyScene( event )
	blackscene:removeSelf()
	button:removeSelf()
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

return scene