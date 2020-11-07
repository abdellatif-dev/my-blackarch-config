---------------------------
-- my blackarch awesome theme --
---------------------------
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
theme = {}

theme.useless_gap   = dpi(5)
theme.border_width  = dpi(3)

theme.font          = "Hack Nerd Font 12"

theme.bg_normal     = "#0F111A"
theme.bg_focus      = "#0F1010"
theme.bg_urgent     = "#D41919"
theme.bg_minimize   = "#090A0F"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#E98567"
theme.fg_urgent     = "#0F111A"
theme.fg_minimize   = "#FAC86A"


theme.border_width  = 1
theme.border_normal = "#57F199"
theme.border_focus  = "#89DDFF"
theme.border_marked = "#EC0101"



-- Display the taglist squares
theme.taglist_squares_sel   = "/usr/share/awesome/themes/blackarch/taglist/squarefw.png"
theme.taglist_squares_unsel = "/usr/share/awesome/themes/blackarch/taglist/squarew.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "/usr/share/awesome/themes/blackarch/submenu.png"
theme.menu_height = 17
theme.menu_width  = 180

-- You can add as many variables as
-- you wish and access them by using

-- Define the image to load
theme.titlebar_close_button_normal = "/usr/share/awesome/themes/blackarch/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "/usr/share/awesome/themes/blackarch/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes/blackarch/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "/usr/share/awesome/themes/blackarch/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes/blackarch/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "/usr/share/awesome/themes/blackarch/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes/blackarch/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "/usr/share/awesome/themes/blackarch/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes/blackarch/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "/usr/share/awesome/themes/blackarch/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "/usr/share/awesome/themes/blackarch/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "/usr/share/awesome/themes/blackarch/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "/usr/share/awesome/themes/blackarch/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "/usr/share/awesome/themes/blackarch/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes/blackarch/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "/usr/share/awesome/themes/blackarch/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "/usr/share/awesome/themes/blackarch/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "/usr/share/awesome/themes/blackarch/titlebar/maximized_focus_active.png"

theme.wallpaper = "/usr/share/awesome/themes/blackarch/background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = "/usr/share/awesome/themes/blackarch/layouts/fairhw.png"
theme.layout_fairv = "/usr/share/awesome/themes/blackarch/layouts/fairvw.png"
theme.layout_floating  = "/usr/share/awesome/themes/blackarch/layouts/floatingw.png"
theme.layout_magnifier = "/usr/share/awesome/themes/blackarch/layouts/magnifierw.png"
theme.layout_max = "/usr/share/awesome/themes/blackarch/layouts/maxw.png"
theme.layout_fullscreen = "/usr/share/awesome/themes/blackarch/layouts/fullscreenw.png"
theme.layout_tilebottom = "/usr/share/awesome/themes/blackarch/layouts/tilebottomw.png"
theme.layout_tileleft   = "/usr/share/awesome/themes/blackarch/layouts/tileleftw.png"
theme.layout_tile = "/usr/share/awesome/themes/blackarch/layouts/tilew.png"
theme.layout_tiletop = "/usr/share/awesome/themes/blackarch/layouts/tiletopw.png"
theme.layout_spiral  = "/usr/share/awesome/themes/blackarch/layouts/spiralw.png"
theme.layout_dwindle = "/usr/share/awesome/themeslayouts/dwindlew.png"

theme.awesome_icon = "/usr/share/awesome/themes/blackarch/blackarch.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil
return theme
