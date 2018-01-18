local storyboard = require("storyboard")
local scene = storyboard.newScene()
local blackscene
local loading
local group

function scene:createScene( event )
	group = self.view
	blackscene = display.newImage("telaMehico.png",display.contentWidth/2,display.contentHeight/2)
	loading = display.newImage("loading.png",64,421);loading.alpha=0
	group:insert(blackscene)
	group:insert(loading)
end
function scene:enterScene( event )
	transition.to(loading,{time=500,alpha=1,onComplete=function() transition.to(loading,{time=500,alpha=0}) end})
	timer.performWithDelay(1000,function() transition.to(loading,{time=500,alpha=1,onComplete=function() transition.to(loading,{time=500,alpha=0}) end}) end,0)
	timer.performWithDelay(50,function() loading.rotation=loading.rotation+2 end,0)
	timer.performWithDelay(5000,function() transition.to(group,{time=2000,alpha=0,onComplete=function() storyboard.gotoScene("stage4_1") end}) end)
end
function scene:exitScene( event )
	transition.cancel()
	for i,v in pairs(timer._runlist) do
	    timer.cancel(v)
	end
	timer.performWithDelay(1,function () storyboard.purgeScene("loadStage4") end)
end
function scene:destroyScene( event )
	blackscene:removeSelf()
	loading:removeSelf()
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

return scene