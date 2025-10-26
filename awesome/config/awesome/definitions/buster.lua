--- @meta

--- Define a test suite
--- @param description string
--- @param test fun()
function _G.describe(description, test) end

--- Define a test suite
--- @param description string
--- @param test fun()
function _G.it(description, test) end

--- Define a placeholder for a test that you want to write or fix later
--- @param description string
--- @param test fun()
function _G.pending(description, test) end


--- @class luassert.Assertions
local Assertions = {}

--- Assert with `actual == expected`
--- @param expected any # The expected value
--- @param actual any # The actual value
function Assertions.is_equal(expected, actual) end

--- Assert with `actual == true`
--- @param actual any # The actual value
function Assertions.is_true(actual) end

--- Assert with `actual == false`
--- @param actual any # The actual value
function Assertions.is_false(actual) end


--- Assert with `type(actual) == "boolean"`
--- @param actual any # The actual value
function Assertions.is_boolean(actual) end


--- Assert with `type(actual) == "number"`
--- @param actual any # The actual value
function Assertions.is_number(actual) end


--- Assert with `type(actual) == "string"`
--- @param actual any # The actual value
function Assertions.is_string(actual) end


--- Assert with `type(actual) == "table"`
--- @param actual any # The actual value
function Assertions.is_table(actual) end


--- Assert with `type(actual) == "nil"`
--- @param actual any # The actual value
function Assertions.is_nil(actual) end


--- Assert with `type(actual) == "userdata"`
--- @param actual any # The actual value
function Assertions.is_userdata(actual) end


--- Assert with `type(actual) == "function"`
--- @param actual any # The actual value
function Assertions.is_function(actual) end


--- Assert with `type(actual) == "thread"`
--- @param actual any # The actual value
function Assertions.is_thread(actual) end


--- Assert with deep comparison of tables
--- @param expected any # The expected value
--- @param actual any # The actual value
function Assertions.is_same(expected, actual) end

_G.assert = Assertions
