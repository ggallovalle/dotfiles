-- This is how is called in the exported libraries
-- to see how do in sr/share/awesome/lib, rg --context 3 -w "local capi"
local capi = {}
capi.awesome = _ENV["awesome"]
capi.mouse = _ENV["mouse"]
capi.button = _ENV["button"]
capi.screen = _ENV["screen"]
capi.mousegrabber = _ENV["mousegrabber"]
capi.keygrabber = _ENV["keygrabber"]
capi.tag = _ENV["tag"]
capi.root = _ENV["root"]
capi.drawin = _ENV["drawin"]
capi.client = _ENV["client"]

return capi
