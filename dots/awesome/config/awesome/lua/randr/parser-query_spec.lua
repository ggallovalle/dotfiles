local sut = require("randr.parser-query")
local stringer = require("randr.stringer")
local models = require("randr.models")
local inspect = require("inspect")

describe("parser", function ()
    describe("parse_screen", function()
        it("should be empty when empty lines", function()
            -- act
            local actual = sut.parse_screen({})
            -- assert
            assert.is_equal(#actual.screens, 0)
        end)

        it("should be empty when no screen", function()
            -- act
            local actual = sut.parse_screen({"  1920x1080    144.00*+  60.01    59.97    59.96    59.93    48.00  "})
            -- assert
            assert.is_equal(#actual.screens, 0)
        end)

        it("should be able to parse screen", function()
            -- act
            local actual = sut.parse_screen({
                "Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 16384 x 16384",
                "eDP-1 connected primary 1920x1080+0+0 (normal left inverted right x axis y axis) 344mm x 194mm",
                "Screen 2: minimum 320 x 200, current 1920 x 1080, maximum 16384 x 16384",
                "   1920x1080    144.00*+  60.01    59.97    59.96    59.93    48.00  "
            })
            -- assert
            pinspect({ actual = actual})
            assert.is_equal(#actual.screens, 2)
            assert.is_equal(actual.screens[1].minimum[1], 320)
            assert.is_equal(actual.screens[1].minimum[2], 200)
            assert.is_equal(actual.screens[1].current[1], 1920)
            assert.is_equal(actual.screens[1].current[2], 1080)
            assert.is_equal(actual.screens[1].maximum[1], 16384)
            assert.is_equal(actual.screens[1].maximum[2], 16384)
        end)
    end)

end)

describe("stringer", function()
    describe("split_words", function()
        it("should be empty when empty string", function()
            -- act
            local actual = stringer.split_words("")
            -- assert
            assert.is_equal(#actual, 0)
        end)

        it("should only separate spaces", function()
            -- act
            local actual = stringer.split_words("Screen 0: minimum 320 x 200,")
            -- asssert
            assert.is_equal(#actual, 6)
            assert.is_equal(actual[2], "0:")
            assert.is_equal(actual[6], "200,")
        end)

        it("should ignore leading spaces", function()
            -- act
            local actual = stringer.split_words("   1920x1080    144.00*+  60.01    59.97    59.96    59.93    48.00  ")
            -- assert
            assert.is_equal(7, #actual)
        end)
    end)
end)

pending("models", function()
    describe("Output", function()
        -- arrange
        local sut = models.Output.new("eDP-1")

        it("should be able to rotate", function()
            -- act
            local co = coroutine.create(function ()
                
                sut:rotate("inverted", function (err)
                    coroutine.yield(err)
                    sut:rotate("normal", function (err)
                        coroutine.yield(err)
                    end)
                end)
            end)
            -- assert
            local is_ok, err = coroutine.resume(co)
            assert.is_true(is_ok)
            coroutine.resume(co)
            assert.is_nil(err)
        end)

        it("shold be able to increase brigthness with a treshold", function()
            local co = coroutine.create(function()
                -- act
                sut:brightness(10, function(err, data)
                    coroutine.yield(err, data)
                    sut:brightness(1, function(err, data)
                        coroutine.yield(err, data)
                    end)
                end)

                -- assert
            end)

            local is_ok, err, data = coroutine.resume(co)
            assert.is_true(is_ok)
            assert.is_equal(1.5, data)
            assert.is_nil(err)
            coroutine.resume(co)
        end)
    end)
end)
