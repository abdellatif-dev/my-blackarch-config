local awful = require("awful")

-- auto launchs
awful.spawn.with_shell("/home/flagmate/.config/polybar/launch.sh")  

awful.spawn.with_shell("/home/flagmate/.config/awesome/scripts/keyboardxmodmap.sh")

 awful.spawn.with_shell("xss-lock -- i3lock &")

awful.spawn.with_shell("compton")


