--- @meta


--- @class awesome.Root : awesome.Object
--- [docs - root](https://awesomewm.org/doc/api/libraries/root.html)
local Root = {}

--- @type awesome.Root
_G.root = {}


--- Gets or sets global key bindings. These bindings will be available when you
--- press keys on the root window
---
--- [docs - root.keys](https://awesomewm.org/doc/api/libraries/root.html#keys)
--- @param keys_array any[]
function Root.keys(keys_array) end


--- Set the root cursor. A X cursor is a small bitmap usually used to indicate
--- where the mouse pointer is.
---@param cursor_name "num_glyphs" | "cursor" | "arrow" | "based_arrow_down" | "based_arrow_up" | "boat" | "bogosity" | "bottom_left_corner" | "bottom_right_corner" | "bottom_side" | "bottom_tee" | "box_spiral" | "center_ptr" | "circle" | "clock" | "cofee_mug" | "cross" | "cross_reverse" | "crosshair" | "diamod_cross" | "dot" | "dotbox" | "double_arrow" | "draft_large" | "draft_small" | "draped_box" | "exchange" | "fleur" | "gobbler" | "gumby" | "hand" | "heart" | "icon" | "iron_cross" | "left_ptr" | "left_side" | "left_tee" | "leftbutton" | "ll_angle" | "lr_angle" | "man" | "middlebutton" | "mouse" | "pencil" | "pirate" | "plus" | "question_arrow" | "right_ptr" | "right_side" | "right_tee" | "rightbutton" | "rtl_logo" | "sailboat" | "sb_down_arrow" | "sb_h_double_arrow" | "sb_left_arrow" | "sb_right_arrow" | "sb_up_arrow" | "sb_v_double_arrow" | "shuttle" | "sizing" | "spider" | "spraycan" | "star" | "target" | "tcross" | "top_left_arrow" | "top_left_corner" | "top_right_corner" | "top_side" | "top_tee" | "trek" | "ul_angle" | "umbrella" | "ur_angle" | "watch" | "xterm"
function Root.cursor(cursor_name) end
