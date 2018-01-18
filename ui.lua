function torcida(stage)
	local function spawnTorcedor(pos)
		local torcedor = display.newGroup()
		if pos == "front" then
			local mRandPele = (math.random()/2 +.5)
			local pele = display.newImage("f1.png",11.5,19)
			local cabelo = display.newImage("f2.png",11,9)
			local camisa = display.newImage("f3.png",11.5,23.5);camisa:setFillColor(math.random(),math.random(),math.random())
			local calsa = display.newImage("f4.png",11.5,31);calsa:setFillColor(math.random(),math.random(),math.random())
			local function randCabelo()
				local mRand = math.random(1,3)
				local function colorHair()
					local mRand1=math.random(1,4)
					if mRand1 == 1 then
						cabelo:setFillColor(.5,0,0)
					elseif mRand1 == 2 then
						cabelo:setFillColor(.9,.1,.1)
					elseif mRand1 == 3 then
						cabelo:setFillColor(1,1,0)
					elseif mRand1 == 4 then
						cabelo:setFillColor(0,0,0)
					end
				end
				if mRand == 1 then
					pele:setFillColor(.9,.8,.6)
					colorHair()		
				elseif mRand == 2 then
					pele:setFillColor(.8,.6,.2)
					colorHair()
				elseif mRand == 3 then
					pele:setFillColor(.3,.1,0)
					cabelo:setFillColor(0,0,0)
				end
			end
			randCabelo()
			torcedor:insert(pele)
			torcedor:insert(cabelo)
			torcedor:insert(camisa)
			torcedor:insert(calsa)
			timer.performWithDelay(math.random(300,1300), function() transition.moveTo(torcedor,{time=100,y=torcedor.y-5, onComplete=function() transition.moveTo(torcedor,{time=100,y=torcedor.y+5}) end}) end ,0)
		elseif pos == "right" then
			local group=display.newGroup()
			local sheetData = {width=19,height=19,numFrames=2}
			local mySheet = graphics.newImageSheet("bracos.png", sheetData)
			local sequenceData={{name="bracos",start=1,count=2,time=math.random(250,1000)}}
			local animation=display.newSprite(mySheet, sequenceData)
			animation:play()
			animation.x,animation.y = 1,9
			local cabelo=display.newImage("cabelo.png")
			local function colorSkin()
				local mRand=math.random(1,3)
				local function colorHair()
					local mRand1=math.random(1,4)
					if mRand1 == 1 then
						cabelo:setFillColor(.5,0,0)
					elseif mRand1 == 2 then
						cabelo:setFillColor(.9,.1,.1)
					elseif mRand1 == 3 then
						cabelo:setFillColor(1,1,0)
					elseif mRand1 == 4 then
						cabelo:setFillColor(0,0,0)
					end
				end
				if mRand == 1 then
					animation:setFillColor(.9,.8,.6)
					colorHair()		
				elseif mRand == 2 then
					animation:setFillColor(.8,.6,.2)
					colorHair()
				elseif mRand == 3 then
					animation:setFillColor(.3,.1,0)
					cabelo:setFillColor(0,0,0)
				end
			end
			colorSkin()
			local corpo=display.newImage("corpo.png");corpo.x,corpo.y=0,12;corpo:setFillColor(math.random(),math.random(),math.random())
			local calsa=display.newImage("calsa.png");calsa.x,calsa.y=0,18.5;calsa:setFillColor(math.random(),math.random(),math.random())
			torcedor:insert(corpo)
			torcedor:insert(cabelo)
			torcedor:insert(calsa)
			torcedor:insert(animation)
			torcedor.xScale=-1
			timer.performWithDelay(math.random(300,1300), function() transition.moveTo(torcedor,{time=100,y=torcedor.y-5, onComplete=function() transition.moveTo(torcedor,{time=100,y=torcedor.y+5}) end}) end ,0)
		elseif pos == "left" then
			local group=display.newGroup()
			local sheetData = {width=19,height=19,numFrames=2}
			local mySheet = graphics.newImageSheet("bracos.png", sheetData)
			local sequenceData={{name="bracos",start=1,count=2,time=math.random(250,1000)}}
			local animation=display.newSprite(mySheet, sequenceData)
			animation:play()
			animation.x,animation.y = 1,9
			local cabelo=display.newImage("cabelo.png")
			local function colorSkin()
				local mRand=math.random(1,3)
				local function colorHair()
					local mRand1=math.random(1,4)
					if mRand1 == 1 then
						cabelo:setFillColor(.5,0,0)
					elseif mRand1 == 2 then
						cabelo:setFillColor(.9,.1,.1)
					elseif mRand1 == 3 then
						cabelo:setFillColor(1,1,0)
					elseif mRand1 == 4 then
						cabelo:setFillColor(0,0,0)
					end
				end
				if mRand == 1 then
					animation:setFillColor(.9,.8,.6)
					colorHair()		
				elseif mRand == 2 then
					animation:setFillColor(.8,.6,.2)
					colorHair()
				elseif mRand == 3 then
					animation:setFillColor(.3,.1,0)
					cabelo:setFillColor(0,0,0)
				end
			end
			colorSkin()
			local corpo=display.newImage("corpo.png");corpo.x,corpo.y=0,12;corpo:setFillColor(math.random(),math.random(),math.random())
			local calsa=display.newImage("calsa.png");calsa.x,calsa.y=0,18.5;calsa:setFillColor(math.random(),math.random(),math.random())
			torcedor:insert(corpo)
			torcedor:insert(cabelo)
			torcedor:insert(calsa)
			torcedor:insert(animation)
			timer.performWithDelay(math.random(300,1300), function() transition.moveTo(torcedor,{time=100,y=torcedor.y-5, onComplete=function() transition.moveTo(torcedor,{time=100,y=torcedor.y+5}) end}) end ,0)
		elseif pos == "back" then
			local mRandPele = (math.random()/2 +.5)
			local pele = display.newImage("b1.png",11.5,22)
			local cabelo = display.newImage("b2.png",11,12)
			local camisa = display.newImage("f3.png",11.5,23.5);camisa:setFillColor(math.random(),math.random(),math.random())
			local calsa = display.newImage("f4.png",11.5,31);calsa:setFillColor(math.random(),math.random(),math.random())
			local function randCabelo()
				local mRand = math.random(1,3)
				local function colorHair()
					local mRand1=math.random(1,4)
					if mRand1 == 1 then
						cabelo:setFillColor(.5,0,0)
					elseif mRand1 == 2 then
						cabelo:setFillColor(.9,.1,.1)
					elseif mRand1 == 3 then
						cabelo:setFillColor(1,1,0)
					elseif mRand1 == 4 then
						cabelo:setFillColor(0,0,0)
					end
				end
				if mRand == 1 then
					pele:setFillColor(.9,.8,.6)
					colorHair()		
				elseif mRand == 2 then
					pele:setFillColor(.8,.6,.2)
					colorHair()
				elseif mRand == 3 then
					pele:setFillColor(.3,.1,0)
					cabelo:setFillColor(0,0,0)
				end
			end
			randCabelo()
			torcedor:insert(pele)
			torcedor:insert(cabelo)
			torcedor:insert(camisa)
			torcedor:insert(calsa)
			timer.performWithDelay(math.random(300,1300), function() transition.moveTo(torcedor,{time=100,y=torcedor.y-5, onComplete=function() transition.moveTo(torcedor,{time=100,y=torcedor.y+5}) end}) end ,0)
		end
		return torcedor
	end
	local auxTable = {}
	if stage == 1 then
		local aux = 10
		local aux1 = 10
		for i=1,3 do
			for i=1,18 do
				local torcida = spawnTorcedor("left")
				torcida.x,torcida.y = aux,aux1
				aux1 = aux1 + 22.8
				table.insert(auxTable, torcida)
			end
			aux = aux + 22
			aux1 = 10
		end
		aux = 746
		aux1 = 10
		for i=1,3 do
			for i=1,18 do
				local torcida = spawnTorcedor("right")
				torcida.x,torcida.y = aux,aux1
				aux1 = aux1 + 22.8
				table.insert(auxTable, torcida)
			end
			aux = aux + 22
			aux1 = 10
		end
		aux = 0
		aux1 = 415
		for i=1,3 do
			for i=1,35 do
				local torcida = spawnTorcedor("back")
				torcida.x,torcida.y = aux,aux1
				aux = aux + 22.9
				table.insert(auxTable, torcida)
			end
			aux1 = aux1 + 22
			aux = 0
		end
	elseif stage == 2 then
		local aux = 10
		local aux1 = 0
		for i=1,3 do
			for i=1,21 do
				local torcida = spawnTorcedor("left")
				torcida.x,torcida.y = aux,aux1
				aux1 = aux1 + 22.8
				table.insert(auxTable, torcida)
			end
			aux = aux + 22
			aux1 = 0
		end
		aux = 746
		aux1 = 0
		for i=1,3 do
			for i=1,21 do
				local torcida = spawnTorcedor("right")
				torcida.x,torcida.y = aux,aux1
				aux1 = aux1 + 22.8
				table.insert(auxTable, torcida)
			end
			aux = aux + 22
			aux1 = 0
		end
	elseif stage == 3 then
		local aux = 0
		local aux1 = -17
		for i=1,3 do
			for i=1,35 do
				local torcida = spawnTorcedor("front")
				torcida.x,torcida.y = aux,aux1
				aux = aux + 22.9
				table.insert(auxTable, torcida)
			end
			aux1 = aux1 + 22
			aux = 0
		end
		local aux = 10
		aux1 = 65
		for i=1,3 do
			for i=1,18 do
				local torcida = spawnTorcedor("left")
				torcida.x,torcida.y = aux,aux1
				aux1 = aux1 + 22.8
				table.insert(auxTable, torcida)
			end
			aux = aux + 22
			aux1 = 65
		end
		aux = 746
		aux1 = 65
		for i=1,3 do
			for i=1,18 do
				local torcida = spawnTorcedor("right")
				torcida.x,torcida.y = aux,aux1
				aux1 = aux1 + 22.8
				table.insert(auxTable, torcida)
			end
			aux = aux + 22
			aux1 = 65
		end
	end
	return auxTable
end

function posPad(position)
	if position == "right" then
		posPadX = 80 
	elseif position == "left" then
		posPadX = display.contentWidth - 80
	end
end
function spawnMinion()
	local sheetData = {width=27,height=54,numFrames=5}
	local mySheet = graphics.newImageSheet("minion.png", sheetData)
	local sequenceData={{name="run",start=1,count=2,time=400},{name="shoot",start=3,count=1,time=0},{name="dead",start=4,count=2,time=400}}
	local animation=display.newSprite(mySheet, sequenceData)
	animation:play()
	return animation
end
function pauseButton()
	local sheetData = {width=39,height=40,numFrames=2}
	local mySheet = graphics.newImageSheet("pause.png", sheetData)
	local sequenceData={{name="active",start=2,count=1},{name="deactive",start=1,count=1}}
	local animation=display.newSprite(mySheet, sequenceData)
	animation.x,animation.y=711,90
	return animation
end
choosedChar = 1
function choose()
	local function spawnChar(choosed)
		local sheetData
		local mySheet
		local sequenceData
		local animation
		local animation1
		if choosed == 1 then
			sheetData = {width=68,height=68,numFrames=4}
			mySheet = graphics.newImageSheet("char1GK.png", sheetData)
			sequenceData={{name="run",start=1,count=4,time=500},{name="idle",start=2,count=1,time=500}}
			animation=display.newSprite(mySheet, sequenceData)

			sheetData = {width=74,height=74,numFrames=9}
			mySheet = graphics.newImageSheet("char1.png", sheetData)
			sequenceData={{name="runSide",start=1,count=2,time=250},{name="runBack",start=4,count=3,time=375},{name="runFront",start=7,count=2,time=250},{name="shootSide",start=3,count=1,time=1000},{name="shootFront",start=9,count=1,time=1000}}
			animation1=display.newSprite(mySheet, sequenceData)
		elseif choosed == 2 then
			sheetData = {width=74,height=74,numFrames=4}
			mySheet = graphics.newImageSheet("char2GK.png", sheetData)
			sequenceData={{name="run",start=1,count=4,time=500},{name="idle",start=1,count=1,time=500}}
			animation=display.newSprite(mySheet, sequenceData)

			sheetData = {width=76,height=76,numFrames=9}
			mySheet = graphics.newImageSheet("char2.png", sheetData)
			sequenceData={{name="runSide",start=1,count=2,time=250},{name="runBack",start=4,count=3,time=375},{name="runFront",start=8,count=2,time=250},{name="shootSide",start=3,count=1,time=1000},{name="shootFront",start=7,count=1,time=1000}}
			animation1=display.newSprite(mySheet, sequenceData)
		elseif choosed == 3 then
			sheetData = {width=70,height=70,numFrames=4}
			mySheet = graphics.newImageSheet("char3GK.png", sheetData)
			sequenceData={{name="run",start=1,count=4,time=500},{name="idle",start=1,count=1,time=500}}
			animation=display.newSprite(mySheet, sequenceData)

			sheetData = {width=74,height=74,numFrames=9}
			mySheet = graphics.newImageSheet("char3.png", sheetData)
			sequenceData={{name="runSide",start=1,count=2,time=250},{name="runBack",start=4,count=3,time=375},{name="runFront",start=8,count=2,time=250},{name="shootSide",start=3,count=1,time=1000},{name="shootFront",start=7,count=1,time=1000}}
			animation1=display.newSprite(mySheet, sequenceData)
		elseif choosed == "taffarel" then
			sheetData = {width=70,height=70,numFrames=4}
			mySheet = graphics.newImageSheet("taffarel.png", sheetData)
			sequenceData={{name="run",start=1,count=4,time=500},{name="idle",start=1,count=1,time=500}}
			animation=display.newSprite(mySheet, sequenceData)

			sheetData = {width=74,height=74,numFrames=9}
			mySheet = graphics.newImageSheet("pele.png", sheetData)
			sequenceData={{name="runSide",start=1,count=2,time=250},{name="runBack",start=4,count=3,time=375},{name="runFront",start=7,count=2,time=250},{name="shootSide",start=3,count=1,time=1000},{name="shootFront",start=7,count=1,time=1000}}
			animation1=display.newSprite(mySheet, sequenceData)
		end
		animation:play()
		animation1:play()
		return animation1, animation
	end
	local aux
	local aux1
	if choosedChar == 1 then
		aux,aux1 = spawnChar(1)
	elseif choosedChar == 2 then
		aux,aux1 = spawnChar(2)
	elseif choosedChar == 3 then
		aux,aux1 = spawnChar(3)
	end
	return aux,aux1
end

function campPart(camp,part)
	local aux
	if camp == 1 then
		if part == 1 then
			aux = display.newImage("c1_1.png")
		elseif part == 2 then
			aux = display.newImage("c1_2.png")
		elseif part == 3 then
			aux = display.newImage("c1_3.png")
		end
	elseif camp == 2 then
		if part == 1 then
			aux = display.newImage("c2_1.png")
		elseif part == 2 then
			aux = display.newImage("c2_2.png")
		else
			aux = display.newImage("c2_3.png")
		end
	elseif camp == 3 then
		if part == 1 then
			aux = display.newImage("c3_1.png")
		elseif part == 2 then
			aux = display.newImage("c3_2.png")
		else
			aux = display.newImage("c3_3.png")
		end
	elseif camp == 4 then
		if part == 1 then
			aux = display.newImage("c4_1.png")
		elseif part == 2 then
			aux = display.newImage("c4_2.png")
		else
			aux = display.newImage("c4_3.png")
		end
	end
	return aux
end

function bossStage(stage)
	local gk
	local zg
	if stage == 1 then
		local sheetData = {width=82,height=66,numFrames=2}
		local mySheet = graphics.newImageSheet("GKjapao.png", sheetData)
		local sequenceData={{name="run",start=1,count=2,time=400}}
		gk=display.newSprite(mySheet, sequenceData)
		sheetData = {width=44,height=80,numFrames=5}
		mySheet = graphics.newImageSheet("ZGjapao.png", sheetData)
		sequenceData={{name="run",start=1,count=2,time=250},{name="shoot",start=3,count=1,time=1000},{name="died",start=4,count=2,time=400}}
		zg=display.newSprite(mySheet, sequenceData)
	elseif stage == 2 then
		local sheetData = {width=57,height=65,numFrames=2}
		local mySheet = graphics.newImageSheet("GKalemanha.png", sheetData)
		local sequenceData={{name="run",start=1,count=2,time=400}}
		gk=display.newSprite(mySheet, sequenceData)
		sheetData = {width=51,height=87,numFrames=5}
		mySheet = graphics.newImageSheet("ZGalemanha.png", sheetData)
		sequenceData={{name="run",start=1,count=2,time=250},{name="shoot",start=3,count=1,time=1000},{name="died",start=4,count=2,time=400}}
		zg=display.newSprite(mySheet, sequenceData)
	elseif stage == 3 then
		local sheetData = {width=69,height=68,numFrames=2}
		local mySheet = graphics.newImageSheet("GKespanha.png", sheetData)
		local sequenceData={{name="run",start=1,count=2,time=400}}
		gk=display.newSprite(mySheet, sequenceData)
		sheetData = {width=44,height=78,numFrames=5}
		mySheet = graphics.newImageSheet("ZGespanha.png", sheetData)
		sequenceData={{name="run",start=1,count=2,time=250},{name="shoot",start=3,count=1,time=1000},{name="died",start=4,count=2,time=400}}
		zg=display.newSprite(mySheet, sequenceData)
	elseif stage == 4 then
		local sheetData = {width=62,height=79,numFrames=2}
		local mySheet = graphics.newImageSheet("GKmexico.png", sheetData)
		local sequenceData={{name="run",start=1,count=2,time=400}}
		gk=display.newSprite(mySheet, sequenceData)
		sheetData = {width=60,height=85,numFrames=5}
		mySheet = graphics.newImageSheet("ZGmexico.png", sheetData)
		sequenceData={{name="run",start=1,count=2,time=250},{name="shoot",start=3,count=1,time=1000},{name="died",start=4,count=2,time=400}}
		zg=display.newSprite(mySheet, sequenceData)
	end
	gk:play()
	zg.x,zg.y=display.contentWidth/2, 200
	zg:play()
	return gk,zg
end

--[[function dificulty(dif)
	if dif == "hard" then
		hard = true
	end
end]]