local widget = require( "widget" )
local uuid = require( "uuid" )

display.setStatusBar( display.HiddenStatusBar )
math.randomseed(os.time())

local uuidGeneratorText = display.newText("UUID GENERATOR", display.contentCenterX, display.contentCenterY-250, native.systemFontBold, 24)

local hyphensText = display.newText("Hyphens", display.contentCenterX-100, display.contentCenterY-150, native.systemFontBold, 16)
local bracesText = display.newText("Braces", display.contentCenterX, display.contentCenterY-150, native.systemFontBold, 16)
local uppercaseText = display.newText("Uppercase", display.contentCenterX+100, display.contentCenterY-150, native.systemFontBold, 16)

local hyphensBool = true
local bracesBool = false
local uppercaseBool = true

local function onSwitchPress( event )

   local checkbox = event.target

   if checkbox.id == "hyphens" then
      hyphensBool = checkbox.isOn
   elseif checkbox.id == "braces" then
      bracesBool = checkbox.isOn
   elseif checkbox.id == "uppercase" then
      uppercaseBool = checkbox.isOn
   end

end

local hyphensCheckbox = widget.newSwitch(
    {
        left = hyphensText.x - 15,
        top = hyphensText.y + 50,
        style = "checkbox",
        id = "hyphens",
        initialSwitchState = true,
        onPress = onSwitchPress
    }
)

local bracesCheckbox = widget.newSwitch(
    {
        left = bracesText.x - 15,
        top = bracesText.y + 50,
        style = "checkbox",
        id = "braces",
        initialSwitchState = false,
        onPress = onSwitchPress
    }
)

local uppercaseCheckbox = widget.newSwitch(
    {
        left = uppercaseText.x - 15,
        top = uppercaseText.y + 50,
        style = "checkbox",
        id = "uppercase",
        initialSwitchState = true,
        onPress = onSwitchPress
    }
)

local generateUUIDButton = display.newRoundedRect(display.contentCenterX, display.contentCenterY+220, 200, 60, 10)
local generateUUIDButtonText = display.newText("Generate UUID!", display.contentCenterX, display.contentCenterY+220, native.systemFontBold, 20)
generateUUIDButtonText:setFillColor(0,0,0)
local newUUID, uuidText

generateUUIDButton:addEventListener( "tap", function()
   newUUID = uuid.generate(hyphensBool, bracesBool, uppercaseBool)

   display.remove(uuidText)
   uuidText = display.newText(newUUID, display.contentCenterX, display.contentCenterY+100, native.systemFontBold, 13)
end )
