local GUI = require("GUI")
local system = require("System")
local component = require("component")

local localization = system.getCurrentScriptLocalization()

if component.isAvailable("self_destruct") then
  self_destruct = component.self_destruct
else
  component.computer.beep(900, 0.1)
  GUI.alert(localization.nocard)
  return 1
end

local workspace, window, menu = system.addWindow(GUI.filledWindow(1, 1, 60, 20, 0xE1E1E1))

local layout = window:addChild(GUI.layout(1, 1, window.width, window.height, 1, 1))

local selfDestructButton = layout:addChild(GUI.button(2, 2, 30, 3, 0xFFFFFF, 0x555555, 0x2d2d2d, 0xFFFFFF, localization.selfdestruct))
selfDestructButton.onTouch = function()
  component.self_destruct.start(0)
end

window.onResize = function(newWidth, newHeight)
  window.backgroundPanel.width, window.backgroundPanel.height = newWidth, newHeight
  layout.width, layout.height = newWidth, newHeight
end

workspace:draw()
