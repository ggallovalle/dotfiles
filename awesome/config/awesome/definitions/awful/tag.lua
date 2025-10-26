--- @meta

--- @class awful.Tag.History
local AwfulTagHistory = {}


--- Revert tag history.
--- @param screen? awesome.Screen # Default to `awful.screen.focused()`.
--- @param index? number|"previous" # Default to `"previous"`. Which is a special index toggling between last two selected set of tags. Number (e.g. 1) is the index of the set of tags to restore (1 is the most recent, 2 the second most recent, etc.)
function AwfulTagHistory.restore(screen, index) end

--- @class awful.Tag
local AwfulTag = {}

--- @type awful.Tag.History
AwfulTag.history = nil


--- View the previous tag. This is the same as `tag.viewidx(-1)`.
--- @param screen? awesome.Screen # Default to `awful.screen.focused()`.
function AwfulTag.viewprev(screen) end


--- View the next tag. This is the same as `tag.viewidx(1)`.
--- @param screen? awesome.Screen # Default to `awful.screen.focused()`.
function AwfulTag.viewnext(screen) end


--- Increase master width factor.
--- @param add integer # The amount to add.
--- @param tag? awesome.Tag # Default to `awful.screen.focused().selected_tag`.
function AwfulTag.incmwfact(add, tag) end


--- Increase the number of master windows
--- @param add number # The amount to add.
--- @param tag? awesome.Tag # Default to `awful.screen.focused().selected_tag`.
--- @param sensible? boolean # Default to `false`. If true, the number of master windows will be limited to a sensible value (1 or the number of clients).
function AwfulTag.incnmaster(add, tag, sensible) end

--- Toggle selection of a tag
--- @param tag awesome.Tag
function AwfulTag.viewtoggle(tag) end

--- Increase number of column windows.
--- @param add number # The amount to add.
--- @param tag? awesome.Tag # Default to `awful.screen.focused().selected_tag`.
--- @param sensible boolean # Default to `false`. If true, the number of master windows will be limited to a sensible value (1 or the number of clients).
function AwfulTag.incncol(add, tag, sensible) end

return AwfulTag