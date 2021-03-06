pcall(require, "luarocks.loader")
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

require("shortcuts")
require("layouts")
require("workspaces")
require("autolaunch")
require("rules")
require("wiboxs")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme.lua")



-- This is used later as the default terminal and editor to run.
terminal = "st"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor


-- {{{ Menu
-- Create a launcher widget and a main menu
-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
  { "manual", terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. "termite -e 'nvim '" .. awesome.conffile },
  { "restart", awesome.restart },
  { "quit", awesome.quit }
}

termmenu = {
  {"simple terminal" ,"st"},
  { "termite", "termite" },
  { "terminator", "terminator" },
  { "term (grey)", "urxvt -fg grey -depth 32 -bg rgba:0008/001B/00E5/aaaa -e zsh " },
  { "term (red)", "urxvt -fg red -depth 32 -bg rgba:0008/001B/00E5/aaaa -e zsh " },
  { "term (green)", "urxvt -fg green -depth 32 -bg rgba:0008/001B/00E5/aaaa -e zsh " },
  { "term (yellow)", "urxvt -fg yellow -depth 32 -bg rgba:0008/001B/00E5/aaaa -e zsh " },
  { "term (white)", "urxvt -fg white -depth 32 -bg rgba:0008/001B/00E5/aaaa -e zshh " }
}

browsermenu = {
  { "firefox", "firefox" },
  { "chromium", "chromium" },
  {"brave", "brave"},
  { "torbrowser", "torbrowser-launcher" },
}

shells = {
  { "zsh", "terminator -e 'zsh'" },
  { "bash", "terminator -e 'bash'" },
  { "python 2", "terminator -e 'python2'" },
  { "python 3", "terminator -e 'python3'" },
}


mymainmenu = awful.menu({
items = {
  { "terminals", termmenu },
  {"shells", shells},
  { "awesome", myawesomemenu },
}
})

