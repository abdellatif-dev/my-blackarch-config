local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")


terminal = "st"
editor = "nvim"
editor_cmd = terminal .. " -e " .. editor

modkey = "Mod4"


-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "h",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "l",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore, {description = "go back", group = "tag"}),

    awful.key({ modkey, "Control"    }, "h", function () awful.client.focus.byidx(1) end,
              {description = "focus next by index", group = "client"}),

    awful.key({ modkey, "Control"    }, "l", function () awful.client.focus.byidx(-1) end,
              {description = "focus previous by index", group = "client"}),

    awful.key({ modkey, "Shift"   }, "h", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),

    awful.key({ modkey, "Shift"   }, "l", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),

    awful.key({ modkey, "Shift"  }, "w", function () mymainmenu:show() end,
            {description = "show main menu", group = "awesome"}),

    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),

    awful.key({ modkey,   }, "k",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,   }, "j",     function () awful.tag.incmwfact(-0.05)    end),

    awful.key({ modkey, }, "Tab",  function () awful.util.spawn("/home/flagmate/.config/awesome/scripts/openedapps") end,
            {description = "focus apps", group = "a script"}),

    awful.key({ modkey, }, "t", function () awful.spawn(terminal) end,
            {description = "open termite", group = "a software"}),

    awful.key({ modkey,  }, "p", function () awful.util.spawn("passmenu") end,
            {description = "open passmenu", group = "a software"}),

    awful.key({ modkey, }, "d", function () awful.util.spawn("dmenu_run") end,
            {description = "open dmenu_run", group = "a software"}),

    awful.key({ modkey,  "Control" }, "d", function () awful.util.spawn("dmenu_man") end,
            {description = "open dmenu_man", group = "a software"}),

    awful.key({ modkey, "Shift"  }, "d", function () awful.util.spawn("discord") end,
              {description = "open discord", group = "a software"}),

    awful.key({ modkey, "Control" }, "a", function () awful.util.spawn("pavucontrol") end,
              {description = "open pavucontrol", group = "a script"}),

    awful.key({ modkey, "Control" }, "s", function () awful.util.spawn("simplescreenrecorder") end,
              {description = "simplescreenrecorder", group = "a software"}),

    awful.key({ modkey, "Control" }, "e", function () awful.util.spawn("emacs") end,
              {description = "emacs", group = "a software"}),

    awful.key({ modkey, }, "x", function () awful.util.spawn("lxappearance") end,
              {description = "appearance", group = "a software"}),

    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),

    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),



    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),


    awful.key({modkey }, "r", function () awful.util.spawn("/home/flagmate/.config/awesome/scripts/menu") end,
              {description= "menu", group= "a script"}),

    awful.key({modkey, "Shift"}, "r", function () awful.util.spawn("/home/flagmate/.config/awesome/scripts/menu_full") end,
              {description= "full menu", group= "a script"}),

    awful.key({ modkey, "Shift" }, "v",  function () awful.util.spawn("gnvim") end,
              {description = "run vim", group = "a software"}),

    awful.key({ modkey,  }, "Return",     function () awful.util.spawn("screenkey") end,
              {description = "run screenkey", group = "a software"}),

    awful.key({ modkey, "Control" }, "t",     function () awful.util.spawn("terminator") end,
              {description = "run terminator", group = "a software"}),



    awful.key({ modkey, "Shift"  }, "Return",     function () awful.util.spawn("killall screenkey") end,
              {description = "stop screenkey", group = "a software"}),


    awful.key({ modkey, "Control" }, "f",     function () awful.util.spawn("pcmanfm") end,
              {description = "run pcmanfm", group = "a software"}),

    awful.key({ modkey , "Control" }, "b",     function () awful.util.spawn("brave") end,
              {description = "run brave", group = "a software"}),

    awful.key({ modkey , "Control" }, "v",     function () awful.util.spawn("code") end,
             {description = "run vs code", group = "a software"}),

    awful.key({ modkey , "Control" }, "g",     function () awful.util.spawn("gimp") end,
             {description = "run gimp", group = "a software"}),

             -- Menubar
    awful.key({ modkey , "Control" }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "client"})
)

for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)


clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey,           }, "w",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "`",      function (c) c.ontop = not c.ontop            end),


    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end)
)


clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)


-- Set keys
root.keys(globalkeys)
-- }}}
