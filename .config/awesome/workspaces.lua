local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")
local gears = require("gears")

beautiful.bg_normal     = "#0F111A"
beautiful.bg_focus      = "#0F1010"
beautiful.bg_urgent     = "#D41919"
beautiful.bg_minimize   = "#090A0F"
beautiful.bg_systray    = beautiful.bg_normal

beautiful.fg_normal     = "#aaaaaa"
beautiful.fg_focus      = "#E98567"
beautiful.fg_urgent     = "#000000"
beautiful.fg_minimize   = "#FAC86A"



awful.screen.connect_for_each_screen(function(s)


    -- Each screen has its own tag table.
    awful.tag({ " ", " ", " ", " ﴣ", " ", " ","辶 " , " ", "拓 " }, s, awful.layout.layouts[1])
end)
-- }}}
