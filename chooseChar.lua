local storyboard = require("storyboard")
local ui = require ("ui")
local scene = storyboard.newScene()
local blackscene
local onTap
local text
local boxText
local BTnext
local BTprevious
local onTap
local BTnextChar
local BTpreviousChar
local char1
local char2
local char3
local chooseControl

function scene:createScene( event )
	local group = self.view
	chooseControl = 1
	chooseChar = 1
	text = display.newText("Selecionar Personagem",display.contentWidth/2,50,native.systemFont,32)
	boxText = display.newRect(0,0,text.contentWidth,text.contentHeight);boxText.x,boxText.y=text.x,text.y;boxText:setFillColor(0,0,0);boxText.alpha=.5
	blackscene = display.newImage("bkgdMenu.png")
	BTnext = display.newRect(0,0,120,50);BTnext:setFillColor(0,0,.5)
	BTprevious = display.newRect(0,0,120,50);BTprevious:setFillColor(0,.5,0)
	BTnextChar = display.newRect(0,0,50,50);BTnextChar:setFillColor(1,0,0)
	BTpreviousChar = display.newRect(0,0,50,50);BTpreviousChar:setFillColor(1,0,0)
	char1 = display.newImage("0.png")
	char2 = display.newImage("1.png");char2.alpha=0
	char3 = display.newImage("2.png");char3.alpha=0
	group:insert(blackscene)
	group:insert(boxText)
	group:insert(text)
	group:insert(BTnext)
	group:insert(BTprevious)
	group:insert(BTnextChar)
	group:insert(BTpreviousChar)
	group:insert(char1)
	group:insert(char2)
	group:insert(char3)
end
function scene:enterScene( event )
	blackscene.x,blackscene.y = display.contentWidth/2,display.contentHeight/2
	BTprevious.x,BTprevious.y = 100, display.contentHeight-50
	BTnext.x,BTnext.y = display.contentWidth-100, display.contentHeight-50
	BTpreviousChar.x,BTpreviousChar.y = 200,display.contentHeight/2
	BTnextChar.x,BTnextChar.y = display.contentWidth-200,display.contentHeight/2
	char1.x,char1.y = display.contentWidth/2,display.contentHeight/2
	char2.x,char2.y = display.contentWidth-200,display.contentHeight/2
	char3.x,char3.y = display.contentWidth-200,display.contentHeight/2
	onTap = function(event)
		if event.target == BTprevious then
			storyboard.gotoScene("mainMenu")
		elseif event.target == BTnext then
			storyboard.gotoScene("tutorial")
		elseif event.target == BTpreviousChar then
			if chooseControl == 2 then
				chooseControl = 1
				transition.to(char2,{time=500,alpha=0,x=display.contentWidth-200})
				transition.to(char1,{time=500,alpha=1,x=display.contentWidth/2})
				choosedChar = 1
			elseif chooseControl == 3 then
				chooseControl = 2
				transition.to(char3,{time=500,alpha=0,x=display.contentWidth-200})
				transition.to(char2,{time=500,alpha=1,x=display.contentWidth/2})
				choosedChar = 2
			end
		elseif event.target == BTnextChar then
			if chooseControl == 1 then
				chooseControl = 2
				transition.to(char1,{time=500,alpha=0,x=200})
				transition.to(char2,{time=500,alpha=1,x=display.contentWidth/2})
				choosedChar = 2
			elseif chooseControl == 2 then
				chooseControl = 3
				transition.to(char2,{time=500,alpha=0,x=200})
				transition.to(char3,{time=500,alpha=1,x=display.contentWidth/2})
				choosedChar = 3
			end
		end
	end
	BTprevious:addEventListener("tap", onTap)
	BTnext:addEventListener("tap", onTap)
	BTpreviousChar:addEventListener("tap", onTap)
	BTnextChar:addEventListener("tap", onTap)
end
function scene:exitScene( event )
	BTprevious:removeEventListener("tap", onTap)
	BTnext:removeEventListener("tap", onTap)
	timer.performWithDelay(1,function() storyboard.purgeScene("chooseChar") end)
end
function scene:destroyScene( event )
	blackscene:removeSelf()
	boxText:removeSelf()
	text:removeSelf()
	BTnext:removeSelf()
	BTprevious:removeSelf()
	BTnextChar:removeSelf()
	BTpreviousChar:removeSelf()
	char1:removeSelf()
	char2:removeSelf()
	char3:removeSelf()
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

return scene