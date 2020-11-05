local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")
local gears = require("gears")

beautiful.bg_normal     = "#181818"
beautiful.bg_focus      = "#000000"
beautiful.bg_urgent     = "#91231c"
beautiful.bg_minimize   = "#444444"
beautiful.bg_systray    = beautiful.bg_normal

beautiful.fg_normal     = "#aaaaaa"
beautiful.fg_focus      = "#6298e0"
beautiful.fg_urgent     = "#91231c"
beautiful.fg_minimize   = "#000000"




awful.screen.connect_for_each_screen(function(s)


    -- Each screen has its own tag table.
    awful.tag({ " ", " ", " ", " ﴣ", " ", " ","辶 " , " ", "拓 " }, s, awful.layout.layouts[1])
end)
-- }}}
