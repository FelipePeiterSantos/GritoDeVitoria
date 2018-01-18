local storyboard = require("storyboard")
local scene = storyboard.newScene()
local physics = require("physics")
local ui = require ("ui")
local isSimulator = "simulator" == system.getInfo("environment")

local campo
local char
local GKboss
local ZCboss
local goalk
local ball
local enemies
local torcidas
local killed
local lateral
local lateral1
local top
local top1
local bot
local bot1
local shoot = 500
local shootAnimation = false
local directionChar = 0
local dragChar
local onCollision
local onEF
local pause
local stop = true
local pauseGame

local base
local stick
local pad
local moveX
local moveY

function scene:createScene( event )
	local group = self.view
	campo = campPart(2,3)
	local function linhasCampo()
		lateral = display.newRect(0,0,220,display.contentHeight); lateral.y = display.contentHeight/2;lateral.alpha=0
		lateral1 = display.newRect(display.contentWidth-110,0,10,display.contentHeight); lateral1.y = display.contentHeight/2;lateral1.alpha=0
		top = display.newRect(0,display.contentHeight-10,290,10); top.anchorX = 0; top.x = 0; top.y = 60;top.alpha=0
		top1 = display.newRect(0,display.contentHeight-10,290,10); top1.anchorX = 1; top1.x = display.contentWidth; top1.y = 60;top1.alpha=0
		bot = display.newRect(0,display.contentHeight,290,10); bot.anchorX = 0; bot.x = 0;--bot.alpha = 0
		bot1 = display.newRect(0,display.contentHeight,290,10); bot1.anchorX = 1; bot1.x = display.contentWidth;--bot1.alpha = 0
	end
	char,goalk = choose()
	GKboss,ZCboss = bossStage(2)
	local ballSpawn = function()
		local sheetData = {width=25,height=25,numFrames=7}
		local mySheet = graphics.newImageSheet("bolasheet.png", sheetData)
		local sequenceData={{name="roll",start=1,count=7,time=500}}
		local animation=display.newSprite(mySheet, sequenceData)
		animation.x,animation.y=display.contentWidth/2,display.contentHeight/2
		animation:play()
		return animation
	end
	ball = ballSpawn()
	enemies = {}
	torcidas = torcida(3)
	killed = {}
	for i=1,2 do
		local enemy = spawnMinion();enemy.anchorY=1
		if i==1 then
			enemy.x,enemy.y = 170,150
		else
			enemy.x,enemy.y = display.contentWidth-170,150
		end
		table.insert(enemies,enemy)
	end
	linhasCampo()
	base = display.newCircle(0,0,50);base.alpha=.5
	stick = display.newCircle(0,0,25);stick.alpha=.5
	pad = display.newGroup()
	pad.x,pad.y=posPadX or 80,display.contentHeight-80
	pause = pauseButton()
	pad:insert(base)
	pad:insert(stick)
	group:insert(campo)
	group:insert(lateral)
	group:insert(lateral1)
	group:insert(top)
	group:insert(top1)
	group:insert(bot)
	group:insert(bot1)
	for i,v in ipairs(torcidas) do
		group:insert(v)
	end
	group:insert(GKboss)
	group:insert(ZCboss)
	group:insert(ball)
	group:insert(char)
	group:insert(goalk)
	group:insert(pad)
	group:insert(pause)
	for i,v in ipairs(enemies) do
		group:insert(v)
	end

end
function scene:enterScene( event )
	campo.x, campo.y = display.contentWidth/2,display.contentHeight/2
	char.x,char.y = display.contentWidth/2,display.contentHeight-50;char.anchorY=1--; char:setFillColor(.2,0,.5)
	GKboss.x,GKboss.y = display.contentWidth/2,60; GKboss:setFillColor(1,1,1)
	ZCboss.x = display.contentWidth/2; ZCboss:setFillColor(1,1,1)
	goalk.x,goalk.y = display.contentWidth/2,display.contentHeight;goalk.anchorY=1--; goalk:setFillColor(.2,.5,.5)
	for i=1,2 do 
		if i==1 then
			enemies[i].x=170;enemies[i]:setFillColor(1,1,1)
		else
			enemies[i].x=display.contentWidth-170;enemies[i]:setFillColor(1,1,1)
		end
	end
	ball.x,ball.y = display.contentWidth/2,display.contentHeight/2
	killed = {1,1,1}
	physics.start()
	physics.setGravity(0,5)
	local function physicas()
		physics.addBody(char, "kinematic", {density=1,friction=0,bounce=0,radius=20})
		physics.addBody(GKboss, "static", {density=1,friction=0,bounce=0,radius=20})
		physics.addBody(ZCboss, "static", {density=1,friction=0,bounce=0,radius=20})
		physics.addBody(goalk, "static", {density=1,friction=0,bounce=0,radius=20})
		physics.addBody(lateral, "static", {density=1,friction=0,bounce=0})
		physics.addBody(lateral1, "static", {density=1,friction=0,bounce=0})
		physics.addBody(top, "static", {density=1,friction=0,bounce=0})
		physics.addBody(top1, "static", {density=1,friction=0,bounce=0})
		physics.addBody(bot, "static", {density=1,friction=0,bounce=0})
		physics.addBody(bot1, "static", {density=1,friction=0,bounce=0})
		physics.addBody(ball, "dynamic", {density=1,friction=0,bounce=.5,radius=10})
		for i=1,#enemies do
			physics.addBody(enemies[i], "static", {density=1,friction=0,bounce=1,radius=15})
		end
		ball:setLinearVelocity(0,0)
	end
	physicas()
	dragChar = function (event)
		if event.phase == "began" then
			moveX = event.x - stick.x
			moveY = event.y - stick.y
		elseif moveX ~= nil and stop then
			if event.phase == "moved" then
				local distance = math.sqrt((event.x - moveX)^2+(event.y - moveY)^2)
				if distance < 50 then
					stick.x = event.x - moveX
					stick.y = event.y - moveY
				else
					local dX = event.x - moveX
					local dY = event.y - moveY
					local angulo = math.atan2(dY, dX)
					local sentX = math.cos(angulo)
					local sentY = math.sin(angulo)
					stick.x,stick.y=base.x + sentX*50,base.y + sentY*50
				end
			else
				stick.x,stick.y=0,0
			end
		end
	end 
	onCollision = function (event)
		if event.phase == "began" then
			physics.setGravity(0,5)
			for i=1,2 do
				if event.other == enemies[i] and killed[i] == 1 then
					if ball.y < enemies[i].y-(enemies[i].height/2) then
						enemies[i]:setSequence("dead");enemies[i]:play()
						table.remove(killed, i)
						table.insert(killed,i,0)
						timer.performWithDelay(500, function() physics.removeBody(enemies[i]) end)
					else
						enemies[i]:setSequence("shoot")
						timer.performWithDelay(250,function() enemies[i]:setSequence("run");enemies[i]:play() end)
						local sentX = 0
						local sentY = -1
						ball:setLinearVelocity(0,-sentY*100)
						if i==1 then
							physics.setGravity(5,5)
						elseif i==2 then
							physics.setGravity(-5,5)
						else
							local mRand = math.round(math.random(-1,1))
							physics.setGravity(mRand*5,5)
						end
					end
				elseif event.other == GKboss then
					physics.setGravity(0,-5)
				end
			end
			if event.other == char or event.other == goalk then
				local dX = event.other.x - ball.x
				local dY = event.other.y - ball.y
				local angulo = math.atan2(dY, dX)
				local sentX = math.cos(angulo)
				local sentY = math.sin(angulo)
				ball:setLinearVelocity(-sentX*shoot,-sentY*500)
				if event.other == char then
					directionChar = 0
					shootAnimation=true
					timer.performWithDelay(150,function() shootAnimation=false;directionChar = 0 end)
				end
			elseif event.other == GKboss then
					local dX = event.other.x - ball.x
					local dY = event.other.y - ball.y
					local angulo = math.atan2(dY, dX)
					local sentX = math.cos(angulo)
					local sentY = math.sin(angulo)
					ball:setLinearVelocity(-sentX*shoot,-sentY*500)
			elseif event.other == ZCboss then
				if ZCboss.y > ball.y then
					ZCboss:setSequence("died")
					ZCboss:play()
					table.remove(killed, 3)
					table.insert(killed,3,0)
					timer.performWithDelay(500, function() physics.removeBody(ZCboss) end)
				else
					ZCboss:setSequence("shoot")
					timer.performWithDelay(250,function() ZCboss:setSequence("run");ZCboss:play() end)
					local dX = event.other.x - ball.x
					local dY = event.other.y - ball.y
					local angulo = math.atan2(dY, dX)
					local sentX = math.cos(angulo)
					local sentY = math.sin(angulo)
					ball:setLinearVelocity(-sentX*shoot,-sentY*500)
				end
			end
		end
	end
	onEF = function (event)
		local function runCharDirection(event)
			local dX = ball.x - char.x
			local dY = ball.y - char.y
			local angulo = math.atan2(dY, dX)
			if angulo > -2 and angulo <= -1 and directionChar ~= 1 then
				directionChar = 1
				if shootAnimation then
					char:pause()
				else
					char:setSequence("runBack")
					char:play()
				end
			elseif angulo > -1 and angulo <= 1 and directionChar ~= 2 then
				directionChar = 2
				if shootAnimation then
					char:setSequence("shootSide")
					char.xScale = -1
				else
					char:setSequence("runSide")
					char.xScale = -1
					char:play()
				end
			elseif angulo > 1 and angulo <= 2 and directionChar ~= 3 then
				directionChar = 3
				if shootAnimation then
					char:setSequence("shootFront")
				else
					char:setSequence("runFront")
					char:play()
				end				
			elseif angulo > 2 and directionChar ~= 4 then
				directionChar = 4
				if shootAnimation then
					char:setSequence("shootSide")
					char.xScale = 1
				else
					char:setSequence("runSide")
					char.xScale = 1
					char:play()
				end
			elseif angulo <= -2 and directionChar ~= 4 then
				directionChar = 4
				if shootAnimation then
					char:setSequence("shootSide")
					char.xScale = 1
				else
					char:setSequence("runSide")
					char.xScale = 1
					char:play()
				end
			end
		end
		runCharDirection()
		local function ballDir()
			local dX,dY = ball:getLinearVelocity()
			local angulo = math.atan2(dY, dX)
			ball.rotation = angulo * (180/math.pi)
		end
		ballDir()
		if char.x >= 0 and char.x <= display.contentWidth and stop then
			if stick.x > 50 then
				stick.x = 50
			elseif stick.x < -50 then
				stick.x = -50
			end
			if stick.y < -50 then
				stick.y = -50
			elseif stick.y > 50 then
				stick.y = 50
			end
			char.x = char.x + stick.x/4
			char.y = char.y + stick.y/4
			if char.x < 88 then
				char.x = 88
			elseif char.x > display.contentWidth-88 then
				char.x = display.contentWidth-88
			end
			if char.y > display.contentHeight then
				char.y = display.contentHeight
			elseif char.y < 300 then
				char.y = 300
			end
		end
		if ball.y < 50 then
			storyboard.gotoScene("victory2")
		end
		if goalk.x < 320 then
			goalk.x = 320
		end
		if goalk.x > 480 then
			goalk.x = 480
		end
		local function norma(obj)
			local dX = obj.x - ball.x
			local dY = obj.y - ball.y
			local angulo = math.atan2(dY, dX)
			local sentX = math.cos(angulo)
			if obj == goalk then
				obj.x = obj.x + (-sentX*15)
			elseif obj == GKboss then
				if killed[3] == 1 then
					obj.x = obj.x + (-sentX*15)
				else
					obj.x = obj.x + (-sentX*5)
				end
			elseif obj == ZCboss then
				if ZCboss.y > ball.y then
					obj.x = obj.x + (-sentX*-1)
				else
					obj.x = obj.x + (-sentX*5)
				end
			else
				obj.x = obj.x + (-sentX*5)
			end
		end
		if GKboss.x < 325 then
			GKboss.x = 325
		end
		if GKboss.x > 475 then
			GKboss.x = 475
		end
		if ZCboss.x < 300 then
			ZCboss.x = 300
		end
		if ZCboss.x > 500 then
			ZCboss.x = 500
		end
		norma(goalk)
		norma(GKboss)
		if killed[3] == 1 then
			norma(ZCboss)
		end
		if ball.y > display.contentHeight then
			storyboard.gotoScene("stage2_2")
		end
		for i=1,2 do
			if i == 1 then
				if enemies[1].x < 100 then
					enemies[1].x = 100
				end
				if enemies[1].x > 250 then
					enemies[1].x = 250
				end
				if killed[i] == 1 then
					norma(enemies[1])
				end
			else
				if enemies[2].x < 550 then
					enemies[2].x = 550
				end
				if enemies[2].x > 700 then
					enemies[2].x = 700
				end
				if killed[i] == 1 then
					norma(enemies[2])
				end
			end
		end
	end
	pauseGame = function(event)
		if stop then
			pause:setSequence("deactive")
			physics.pause()
			stop=false
			return true
		else
			pause:setSequence("active")
			physics.start()
			stop=true
			return true
		end
	end
	pause:addEventListener("tap",pauseGame)
	Runtime:addEventListener("enterFrame", onEF)
	ball:addEventListener("collision", onCollision)
	Runtime:addEventListener("touch", dragChar)
end
function scene:exitScene( event )
	pause:removeEventListener("tap",pauseGame)
	Runtime:removeEventListener("enterFrame", onEF)
	Runtime:removeEventListener("touch", dragChar)
	ball:removeEventListener("collision", onCollision)
	physics.stop()
	transition.cancel()
	for i,v in pairs(timer._runlist) do
	    timer.cancel(v)
	end
	timer.performWithDelay(1,function () storyboard.purgeScene("stage2_3") end)
end
function scene:destroyScene( event )
	campo:removeSelf()
	char:removeSelf()
	goalk:removeSelf()
	ball:removeSelf()
	for i=1,#enemies do
		table.remove(enemies, i)
	end
	for i=1,#torcidas do
		table.remove(torcidas, i)
	end
	GKboss:removeSelf()
	ZCboss:removeSelf()
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

return scene