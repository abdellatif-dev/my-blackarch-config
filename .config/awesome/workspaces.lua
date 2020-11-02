local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")
local gears = require("gears")
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme.lua")

awful.screen.connect_for_each_screen(function(s)


    -- Each screen has its own tag table.
    awful.tag({ " ","爵 ", " ", " ", " "," ﴣ", " ", " ", "漣 " }, s, awful.layout.layouts[1])
end)
-- }}}
