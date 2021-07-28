local dump = require("foundation.dump")
local map = require("foundation.pointfree").map
local filter = require("foundation.pointfree").filter
local reduce = require("foundation.pointfree").reduce
local reduceRight = require("foundation.pointfree").reduceRight
local pipe = require("foundation.pointfree").pipe
local flow = require("foundation.pointfree").flow
local compose = require("foundation.pointfree").compose
_ENV = nil

local Foundation = {}

Foundation.dump = dump
Foundation.map = map
Foundation.filter = filter
Foundation.reduce = reduce
Foundation.reduceRight = reduceRight
Foundation.pipe = pipe
Foundation.flow = flow
Foundation.compose = compose

return Foundation
