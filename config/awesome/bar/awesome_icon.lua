local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local gears = require("gears")
local cfg = gears.filesystem.get_configuration_dir()

local awesome_icon = wibox.widget {
    {
        wibox.widget {
            widget = wibox.widget.imagebox,
            image = gears.surface.load_uncached(cfg .. "icons/ghosts/awesome.png"),
            resize = true
        },
        top = dpi(5),
        bottom = dpi(5),
        left = dpi(10),
        right = dpi(5),
        widget = wibox.container.margin
    },
    bg = beautiful.xcolor0,
    widget = wibox.container.background
}

awesome_icon:buttons(gears.table.join(awful.button({}, 1, function()
    awful.spawn("rofi -show run -theme dmenu", false)
end)))

return awesome_icon