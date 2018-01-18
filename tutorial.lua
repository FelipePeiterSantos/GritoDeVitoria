local storyboard = require("storyboard")
local scene = storyboard.newScene()
local onTap
local onTouch
local touched
local distance
local pointX
local moveX

local tuto5
local tuto4
local tuto3
local tuto2
local tuto1
local button

function scene:createScene( event )
	local group = self.view
	tuto5 = display.newImage("tuto5.png",display.contentWidth/2,display.contentHeight/2)
	tuto4 = display.newImage("tuto4.png",display.contentWidth/2,display.contentHeight/2)
	tuto3 = display.newImage("tuto3.png",display.contentWidth/2,display.contentHeight/2)
	tuto2 = display.newImage("tuto2.png",display.contentWidth/2,display.contentHeight/2)
	tuto1 = display.newImage("tuto1.png",display.contentWidth/2,display.contentHeight/2)
	button = display.newCircle(698,402,50);button.alpha=0;button.isHitTestable = true
	group:insert(tuto5)
	group:insert(button)
	group:insert(tuto4)
	group:insert(tuto3)
	group:insert(tuto2)
	group:insert(tuto1)
end
function scene:enterScene( event )
	onTap = function (event)
		if touched == tuto5 then
			storyboard.gotoScene("loadStage1")
		end
	end
	onTouch = function (event)
		if event.phase == "began" then
			moveX = event.x - event.target.x
			pointX = event.x
			touched = event.target
			return true
		elseif event.phase == "moved" then
			if pointX >= event.x then
				if touched ~= tuto5 then
					event.target.x = event.x - moveX
					return true
				end
			else
				if touched == tuto2 then
					tuto1.x = event.x - pointX - 400
					return true
				elseif touched == tuto3 then
					tuto2.x = event.x - pointX - 400
					return true
				elseif touched == tuto4 then
					tuto3.x = event.x - pointX - 400
					return true
				elseif touched == tuto5 then
					tuto4.x = event.x - pointX - 400
					return true
				end
			end
		elseif event.phase == "ended" then
			distance = math.sqrt((event.x - pointX)^2+(event.x - pointX)^2)
			if pointX > event.x then
				if distance < 200 then
					transition.moveTo(event.target,{time=100,x=display.contentWidth/2})
				return true
				elseif touched ~= tuto5 then
					transition.moveTo(event.target,{time=250,x=-event.target.contentWidth/2})
					return true
				end
			elseif pointX < event.x then
				if touched == tuto2 then
					if distance < 200 then
						transition.moveTo(tuto1,{time=100,x=-event.target.contentWidth/2})
						return true
					else
						transition.moveTo(tuto1,{time=250,x=display.contentWidth/2})
						return true
					end
				elseif touched == tuto3 then
					if distance < 200 then
						transition.moveTo(tuto2,{time=100,x=-event.target.contentWidth/2})
						return true
					else
						transition.moveTo(tuto2,{time=250,x=display.contentWidth/2})
						return true
					end
				elseif touched == tuto4 then
					if distance < 200 then
						transition.moveTo(tuto3,{time=100,x=-event.target.contentWidth/2})
						return true
					else
						transition.moveTo(tuto3,{time=250,x=display.contentWidth/2})
						return true
					end
				elseif touched == tuto5 then
					if distance < 200 then
						transition.moveTo(tuto4,{time=100,x=-event.target.contentWidth/2})
						return true
					else
						transition.moveTo(tuto4,{time=250,x=display.contentWidth/2})
						return true
					end
				end
			end
		end
	end

	tuto5:addEventListener("touch",onTouch)
	tuto4:addEventListener("touch",onTouch)
	tuto3:addEventListener("touch",onTouch)
	tuto2:addEventListener("touch",onTouch)
	tuto1:addEventListener("touch",onTouch)
	button:addEventListener("tap",onTap)
end
function scene:exitScene( event )
	tuto5:removeEventListener("touch",onTouch)
	tuto4:removeEventListener("touch",onTouch)
	tuto3:removeEventListener("touch",onTouch)
	tuto2:removeEventListener("touch",onTouch)
	tuto1:removeEventListener("touch",onTouch)
	button:removeEventListener("tap",onTap)
	transition.cancel()
	timer.performWithDelay(1,function() storyboard.purgeScene("tutorial") end)
end
function scene:destroyScene( event )
	tuto5:removeSelf()
	tuto4:removeSelf()
	tuto3:removeSelf()
	tuto2:removeSelf()
	tuto1:removeSelf()
	button:removeSelf()
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

return scene