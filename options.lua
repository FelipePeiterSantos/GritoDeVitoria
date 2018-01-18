local storyboard = require("storyboard")
local ui = require ("ui")
local scene = storyboard.newScene()
local blackscene
local onTap
local text
local dificulty
local right
local left
local posStick
local easyDF
local hardDF
local BTprevious
function scene:createScene( event )
	local group = self.view
	blackscene = display.newImage("bkgdMenu.png")
	text = display.newText("Opções", display.contentWidth/2,50, native.systemFont, 32)
	dificulty = display.newText("Dificuldade", display.contentWidth/2,125, native.systemFont, 50)
	posStick = display.newText("Posição Joypad", display.contentWidth/2,275, native.systemFont, 50)
	BTprevious = display.newRect(0,0,120,50);BTprevious:setFillColor(0,.5,0)
	easyDF = display.newRect(0,0,100,50);easyDF:setFillColor(1,0,0)
	hardDF = display.newRect(0,0,100,50);hardDF:setFillColor(1,1,1)
	right = display.newRect(0,0,100,50);right:setFillColor(1,0,0)
	left = display.newRect(0,0,100,50);left:setFillColor(1,1,1)
	group:insert(blackscene)
	group:insert(text)
	group:insert(dificulty)
	group:insert(posStick)
	group:insert(BTprevious)
	group:insert(easyDF)
	group:insert(hardDF)
	group:insert(right)
	group:insert(left)
end
function scene:enterScene( event )
	blackscene.x,blackscene.y = display.contentWidth/2,display.contentHeight/2
	easyDF.x,easyDF.y = display.contentWidth/2-75,display.contentHeight/2-50
	hardDF.x,hardDF.y = display.contentWidth/2+75,display.contentHeight/2-50
	right.x,right.y = display.contentWidth/2-75,display.contentHeight/2+105
	left.x,left.y = display.contentWidth/2+75,display.contentHeight/2+105
	BTprevious.x,BTprevious.y = 100, display.contentHeight-50
	onTap = function (event)
		if event.target == easyDF then
			easyDF:setFillColor(1,0,0)
			hardDF:setFillColor(1,1,1)
		elseif event.target == hardDF then
			easyDF:setFillColor(1,1,1)
			hardDF:setFillColor(1,0,0)
		elseif event.target == right then
			posPad("right")
			right:setFillColor(1,0,0)
			left:setFillColor(1,1,1)
		elseif event.target == left then
			posPad("left")
			right:setFillColor(1,1,1)
			left:setFillColor(1,0,0)
		elseif event.target == BTprevious then
			storyboard.gotoScene("mainMenu")
		end
	end
	easyDF:addEventListener("tap", onTap)
	hardDF:addEventListener("tap", onTap)
	right:addEventListener("tap", onTap)
	left:addEventListener("tap", onTap)
	BTprevious:addEventListener("tap", onTap)
end
function scene:exitScene( event )
	blackscene:removeEventListener("tap", onTap)
	timer.performWithDelay(1,function () storyboard.purgeScene("options") end)
end
function scene:destroyScene( event )
	blackscene:removeSelf()
	text:removeSelf()
	dificulty:removeSelf()
	posStick:removeSelf()
	BTprevious:removeSelf()
	right:removeSelf()
	left:removeSelf()
	easyDF:removeSelf()
	hardDF:removeSelf()
end


scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

return scene