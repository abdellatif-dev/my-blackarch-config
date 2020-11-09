local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")


terminal = "terminator"
editor = os.getenv("vim") or "vim"
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
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key({ modkey, "Control"    }, "h", function () awful.client.focus.byidx(1) end,
              {description = "focus next by index", group = "client"}),
        
    awful.key({ modkey, "Control"    }, "l", function () awful.client.focus.byidx(-1) end, 
              {description = "focus previous by index", group = "client"}),
          
    awful.key({ modkey, "Shift"   }, "h", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}), 
          
    awful.key({ modkey, "Shift"   }, "l", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
              

    -- awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
    --           {description = "view previous", group = "tag"}),
    -- awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
    --           {description = "view next", group = "tag"}),
    -- awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
    --           {description = "go back", group = "tag"}),
    -- awful.key({ modkey, "Control"    }, "Left", function () awful.client.focus.byidx(1) end,
    --     {description = "focus next by index", group = "client"}),
    -- awful.key({ modkey, "Control"    }, "Right", function () awful.client.focus.byidx(-1) end, 
    --     {description = "focus previous by index", group = "client"}),
    -- awful.key({ modkey, "Shift"   }, "Left", function () awful.client.swap.byidx(  1)    end,
    --     {description = "swap with next client by index", group = "client"}), 
    -- awful.key({ modkey, "Shift"   }, "Right", function () awful.client.swap.byidx( -1)    end,
    --     {description = "swap with previous client by index", group = "client"}),

    awful.key({ modkey, "Shift"  }, "w", function () mymainmenu:show() end,
            {description = "show main menu", group = "awesome"}),
        
    -- Layout manipulation
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
            {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey, }, "Tab",  function () awful.util.spawn("/home/flagmate/.config/awesome/scripts/openedapps") end,
            {description = "focus apps", group = "a script"}),

    -- Standard program
    awful.key({ modkey, "Control" }, "t", function () awful.spawn(terminal) end,
            {description = "open terminator", group = "a software"}),

    awful.key({ modkey,  }, "t", function () awful.util.spawn("xfce4-terminal") end,
            {description = "open xfce4-terminal", group = "a software"}),

    awful.key({ modkey, }, "o", function () awful.util.spawn("libreoffice") end,
              {description = "open libreoffice", group = "a software"}),

    awful.key({ modkey, "Control"  }, "d", function () awful.util.spawn("kdenlive") end,
              {description = "open kdenlive", group = "a software"}),

    awful.key({ modkey, "Control" }, "a", function () awful.util.spawn("/home/flagmate/.config/awesome/scripts/mixer") end,
              {description = "open alsamixer", group = "a script"}),

    awful.key({ modkey, "Control" }, "s", function () awful.util.spawn("simplescreenrecorder") end,
              {description = "simple screen recorder", group = "a script"}),
    

    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

            -- torbrowser-launcher

    awful.key({ modkey, "Control"   }, "o", function () awful.util.spawn("torbrowser-launcher") end,
        {description = "launch torbrowser", group = "a software"}),

	--chromium
    awful.key({ modkey, "Control"   }, "c", function () awful.util.spawn("chromium") end,
              {description = "launch chromium", group = "a software"}),



    awful.key({ modkey, "Shift"   }, "t", function () awful.util.spawn("termite") end,
              {description = "launch termite", group = "a software"}),
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

    awful.key({ modkey, "Control" }, "m",  function () awful.util.spawn("/home/flagmate/.config/awesome/scripts/mail") end,
              {description = "run mutt", group = "a script"}),

    awful.key({ modkey, "Shift" }, "v",  function () awful.util.spawn("/home/flagmate/.config/awesome/scripts/vim") end,
              {description = "run vim", group = "a script"}),

    awful.key({ modkey, "Shift" }, "f",  function () awful.util.spawn("/home/flagmate/.config/awesome/scripts/vifm") end,
              {description = "run vifm", group = "a script"}),

    awful.key({ modkey, "Shift"  }, "o",     function () awful.util.spawn("obs") end,
              {description = "run obs", group = "a software"}),

    awful.key({ modkey,  }, "Return",     function () awful.util.spawn("screenkey") end,
              {description = "run screenkey", group = "a software"}),

    awful.key({ modkey, "Shift"  }, "Return",     function () awful.util.spawn("killall screenkey") end,
              {description = "stop screenkey", group = "a software"}),


    awful.key({ modkey, "Control" }, "f",     function () awful.util.spawn("nemo") end,
              {description = "run nemo", group = "a software"}),

    awful.key({ modkey , "Control" }, "b",     function () awful.util.spawn("brave") end,
              {description = "run brave", group = "a software"}),

    awful.key({ modkey , "Shift" }, "b",     function () awful.util.spawn("firefox") end,
              {description = "run firefox", group = "a software"}),

    awful.key({ modkey , "Control" }, "v",     function () awful.util.spawn("code") end,
             {description = "run vs code", group = "a software"}),

    awful.key({ modkey , "Control" }, "g",     function () awful.util.spawn("gimp") end,
             {description = "run gimp", group = "a software"}),

             -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "client"})
)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, }, "w",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "layout"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
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

-- Set keys
root.keys(globalkeys)
-- }}}
