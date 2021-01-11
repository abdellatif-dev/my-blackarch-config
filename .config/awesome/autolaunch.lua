local awful = require("awful")

-- auto launchs
awful.spawn.with_shell("/home/flagmate/.config/polybar/launch.sh")  

awful.spawn.with_shell("/home/flagmate/.config/awesome/scripts/keyboardxmodmap.sh")

awful.spawn.with_shell("xss-lock -- i3lock -i Pictures/1st-slider.png &")

awful.spawn.with_shell("feh --randomize --bg-scale ~/Pictures/*")

awful.spawn.with_shell("compton")


