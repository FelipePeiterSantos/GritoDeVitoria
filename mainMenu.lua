
local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local menuInicial
local BTplay
local BTcredits
local BToptions
local onTap

function scene:createScene( event )
    local group = self.view
    storyboard.isDebug = true
    timer.performWithDelay(1000, function() storyboard:printMemUsage() end, 0)
    menuInicial = display.newImage("bg.png", display.contentWidth/2,display.contentHeight/2)
    BTplay = display.newRect(405,248,400,70);BTplay.alpha=0;BTplay.isHitTestable = true
    BToptions = display.newRect(405,334,400,70);BToptions.alpha=0;BToptions.isHitTestable = true
    BTcredits = display.newRect(405,417,400,70);BTcredits.alpha=0;BTcredits.isHitTestable = true
    onTap = function (event)
        if event.target == BTcredits then
            storyboard.gotoScene("scredits")
        elseif event.target == BToptions then
            storyboard.gotoScene("options")
        else
            storyboard.gotoScene("chooseChar")
        end
    end
    group:insert(menuInicial)
	group:insert(BTplay)
    group:insert(BTcredits)
    group:insert(BToptions)
end
function scene:enterScene( event )
    BTplay:addEventListener("tap", onTap)
    BTcredits:addEventListener("tap", onTap)
    BToptions:addEventListener("tap", onTap)
end
function scene:exitScene( event )
	BTplay:removeEventListener("tap", onTap)
    BTcredits:removeEventListener("tap", onTap)
    BToptions:removeEventListener("tap", onTap)
    timer.performWithDelay(1,function() storyboard.purgeScene("mainMenu") end)
end
function scene:destroyScene( event )
    menuInicial:removeSelf()
    BTplay:removeSelf()
    BTcredits:removeSelf()
    BToptions:removeSelf()
end


scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

return scene