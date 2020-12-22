local awful = require("awful")

-- auto launchs
awful.spawn.with_shell("/home/flagmate/.config/polybar/launch.sh")  

awful.spawn.with_shell("/home/flagmate/.config/awesome/scripts/keyboardxmodmap.sh")

awful.spawn.with_shell("picom --experimental-backend")
awful.spawn.with_shell("feh --randomize --bg-fill Pictures/*")


