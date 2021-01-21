local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")
local gears = require("gears")

beautiful.useless_gap   = 7

beautiful.bg_normal     = "#090A0F60"
beautiful.bg_focus      = "#090A0F90"
beautiful.bg_urgent     = "#090A0F00"
beautiful.bg_minimize   = "#AAAAAA80"
beautiful.bg_systray    = beautiful.bg_normal

beautiful.fg_normal     = "#AAAAAA"
beautiful.fg_focus      = "#E98567"
beautiful.fg_urgent     = "#D4191990"
beautiful.fg_minimize   = "#FAC86A"


beautiful.border_width  = 0
beautiful.border_normal = "#e98567"
beautiful.border_focus  = "#89DDFF"
beautiful.border_marked = "#EC0101"


awful.screen.connect_for_each_screen(function(s)


    -- Each screen has its own tag table.
    awful.tag({ " ", " ", " ", " ﴣ", " ", " ","辶 " , " ", "拓 " }, s, awful.layout.layouts[1])
end)
-- }}}
