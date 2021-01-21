local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = {
     },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     },

    },
    -- app rules
    { rule = { instance = "brave" }, properties = { tag = " " } },
    { rule = { instance = "chromium" }, properties = { tag = " " } },
    { rule = { class = "firefox" }, properties = { tag = " " } },
    { rule = { class = "surf" }, properties = { tag = " " } },

    { rule = { instance = "terminator" }, properties = { tag = " " } },
    { rule = { instance = "xfce4-terminal" }, properties = { tag = " " } },
    { rule = { instance = "termite" }, properties = { tag = " " } },
    { rule = { class = "st" }, properties = { tag = " " } },
    { rule = { instance = "alacritty" }, properties = { tag = " " } },

    { rule = { instance = "code" }, properties = { tag = " " } },
    { rule = { instance = "gvim" }, properties = { tag = " " } },

    { rule = { instance = "wireshark" }, properties = { tag = " ﴣ" } },
    { rule = { instance = "hopper" }, properties = { tag = " ﴣ" } },
    { rule = { class = "ghidra" }, properties = { tag = " ﴣ" } },
    { rule = { instance = "johnny" }, properties = { tag = " ﴣ" } },

    { rule = { instance = "nemo" }, properties = { tag = " " } },
    { rule = { instance = "thunar" }, properties = { tag = " " } },
    { rule = { instance = "pcmanfm" }, properties = { tag = " " } },

    { rule = { instance = "libreoffice" }, properties = { tag = " " } },
    { rule = { instance = "gimp" }, properties = { tag = " " } },

    { rule = { instance = "kdenlive" }, properties = { tag = "辶 " } },

    { rule = { instance = "polybar" }, properties = { tag = "拓 " } },
    { rule = { instance = "simplescreenrecorder" }, properties = { tag = "拓 " } },
    { rule = { instance = "lxappearance" }, properties = { tag = "拓 " } },
    { rule = { instance = "discord" }, properties = { tag = "拓 " } },
    { rule = { instance = "pavucontrol" }, properties = { tag = "拓 " } },



    -- Floating clients.
    { rule_any = {
        class = {
          "Wpa_gui",
          "veromix"},

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = true }
    },

-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

    }

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
