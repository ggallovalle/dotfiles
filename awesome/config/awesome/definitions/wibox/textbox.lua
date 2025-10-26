--- @meta


--- @class wibox.Textbox : wibox.Widget
--- signals:
--- - `widget::redraw_needed`: when the widget needs to redraw
local WiboxTextbox = {}

--- Set the text of the texbox (with
--- [Pango markup](https://developer.gnome.org/pango/stable/PangoMarkupFormat.html)).
--- @param text string # The text to set. This can contain pango markup (e.g. `<b>bold</b>`). You can use `gears.string.escape` to escape parts of it.
--- @return boolean success # if it success
--- @return string|nil error # if it is an error
function WiboxTextbox:set_markup_silently(text) end

--- Set the text of the texbox (with
--- [Pango markup](https://developer.gnome.org/pango/stable/PangoMarkupFormat.html)).
--- @param text string # The text to set. This can contain pango markup (e.g. `<b>bold</b>`). You can use `gears.string.escape` to escape parts of it.
function WiboxTextbox:set_markup(text) end


--- Add a widget signal subscriber
---
--- Signals:
--- 01. __widget::redraw_needed__ - some property of the widget changed, making it so that it needs to be redrawn
--- @param signal string
--- @param cb any
--- @overload fun(signal: "widget::redraw_needed", cb: fun())
function WiboxTextbox:connect_signal(signal, cb) end
