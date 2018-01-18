local storyboard = require("storyboard")
local scene = storyboard.newScene()
local blackscene
local onTap

function scene:createScene( event )
	local group = self.view
	blackscene = display.newImage("champion.png",display.contentWidth/2,display.contentHeight/2);blackscene.alpha=0
	group:insert(blackscene)
end

function scene:enterScene( event )
	onTap = function (event)
		storyboard.gotoScene("mainMenu")
	end
	timer.performWithDelay(2000,function() transition.to(blackscene,{time=10000,alpha=1,onComplete=function() blackscene:addEventListener("tap", onTap) end}) end)
end

function scene:exitScene( event )
	blackscene:removeEventListener("tap", onTap)
	timer.performWithDelay(1,function () storyboard.purgeScene("victory4") end)
end

function scene:destroyScene(event)
	blackscene:removeSelf()
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )

return scene