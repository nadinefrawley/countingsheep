-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local background = display.newImageRect( "background.png", 600, 800 )
background.x = display.contentCenterX
background.y = display.contentCenterY

local platform = display.newImageRect( "platform.png", 600, 50 )
platform.x = display.contentCenterX
platform.y = display.contentHeight-25

local balloon = display.newImageRect( "balloon.png", 80, 80 )
balloon.x = display.contentCenterCenterX
balloon.y = display.contentCenterY
balloon.alpha = 0.8

local fence = display.newImageRect( "fence.png", 75, 75 )
fence.x = display.contentCenterX
fence.y = display.contentHeight-50

local physics = require( "physics" )
physics.start()

physics.addBody( platform, "static" )
physics.addBody( balloon, "dynamic", { radius=50, bounce=0.03 } )

physics.addBody( fence, "dynamic" )

local function pushBalloon()
    balloon:applyLinearImpulse( 0, -0.75, balloon.x, balloon.y )
end



balloon:addEventListener( "tap", pushBalloon )
