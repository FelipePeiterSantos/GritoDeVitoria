local storyboard = require("storyboard")
local scene = storyboard.newScene()
local onTap
local intro
function scene:createScene( event )
	local group = self.view
	intro = display.newImage("intro.png", display.contentWidth/2,display.contentHeight/2);intro.alpha=0
	group:insert(intro)
end
function scene:enterScene( event )
	local goto = function() storyboard.gotoScene("mainMenu") end
	local fadeout = function() transition.to(intro,{alpha=0,time=2000,onComplete=goto}) end
	local delay = function() timer.performWithDelay(2000, fadeout) end
	transition.to(intro,{alpha=1,time=2000,onComplete=delay})
end
function scene:exitScene( event )
	timer.performWithDelay(1,function() storyboard.purgeScene("intro") end)
end
function scene:destroyScene( event )
	intro:removeSelf()
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

return scene