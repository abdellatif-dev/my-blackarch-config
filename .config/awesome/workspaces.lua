local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")
local gears = require("gears")

beautiful.bg_normal     = "#181818"
beautiful.bg_focus      = "#000000"
beautiful.bg_urgent     = "#000000"
beautiful.bg_minimize   = "#444444"
beautiful.bg_systray    = beautiful.bg_normal

beautiful.fg_normal     = "#aaaaaa"
beautiful.fg_focus      = "#6298e0"
beautiful.fg_urgent     = "#6298e0"
beautiful.fg_minimize   = "#000000"

beautiful.border_width  = 1
beautiful.border_normal = "#181818"
beautiful.border_focus  = "#316ab7"
beautiful.border_marked = "#91231c"


beautiful.font          = "Hack Nerd Font 28"

awful.screen.connect_for_each_screen(function(s)


    -- Each screen has its own tag table.
    awful.tag({ " ", " ", " ", " ﴣ", " ", " ","辶 " , " ", "拓 " }, s, awful.layout.layouts[1])
end)
-- }}}
