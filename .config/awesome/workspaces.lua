local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")
local gears = require("gears")

beautiful.bg_normal     = "#090A0F"
beautiful.bg_focus      = "#090A0F"
beautiful.bg_urgent     = "#D41919"
beautiful.bg_minimize   = "#0F333F"
beautiful.bg_systray    = beautiful.bg_normal

beautiful.fg_normal     = "#AAAAAA"
beautiful.fg_focus      = "#E98567"
beautiful.fg_urgent     = "#090A0F"
beautiful.fg_minimize   = "#FAC86A"


beautiful.border_width  = 1
beautiful.border_normal = "#57F199"
beautiful.border_focus  = "#89DDFF"
beautiful.border_marked = "#EC0101"


awful.screen.connect_for_each_screen(function(s)


    -- Each screen has its own tag table.
    awful.tag({ " ", " ", " ", " ﴣ", " ", " ","辶 " , " ", "拓 " }, s, awful.layout.layouts[1])
end)
-- }}}
