local awful = require("awful")

-- auto launchs
awful.spawn.with_shell("/home/flagmate/.config/polybar/launch.sh")  

--awful.spawn.with_shell("kmix")

awful.spawn.with_shell("picom")
