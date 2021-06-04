local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local tasklist = function(s)
  local tasklist_buttons = gears.table.join(
    awful.button({}, 1, function(c)
    if c == client.focus then c.minimized = true
    else c:emit_signal("request::activate", "tasklist", {raise = true}) end
    end),
    awful.button({}, 3, function() awful.menu.client_list({theme = {width = 250}}) end),
    awful.button({}, 4, function() awful.client.focus.byidx(1) end),
    awful.button({}, 5, function() awful.client.focus.byidx(-1) end))
  return awful.widget.tasklist {
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons,
    bg = beautiful.xcolor0,
    style = {bg = beautiful.xcolor0},
    layout = {
        spacing = dpi(0),
        spacing_widget = {
            bg = beautiful.xcolor8,
            widget = wibox.container.background
        },
        layout = wibox.layout.fixed.horizontal
    },
    widget_template = {
        {
            {
                nil,
                awful.widget.clienticon,
                nil,
                layout = wibox.layout.fixed.horizontal
            },
            top = dpi(5),
            bottom = dpi(5),
            left = dpi(10),
            right = dpi(10),
            widget = wibox.container.margin
        },
        id = 'background_role',
        widget = wibox.container.background
    }} end

return tasklist
