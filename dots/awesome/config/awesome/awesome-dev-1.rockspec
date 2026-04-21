package = "awesome"
version = "dev-1"
rockspec_format = "3.0"
source = {
  url = "*** please add URL for source tarball, zip or repository here ***"
}
description = {
  homepage = "*** please enter a project homepage ***",
  license = "*** please specify a license ***"
}
build = {
  type = "builtin",
  modules = {
    runonce = "lua/runonce.lua"
  }
}
test = {
  type = "busted",
  platforms = {
    unix = {
      flags = { 
                "-m", "./lua/?.lua;./lua/?/?.lua;./ lua/?/init.lua",
                "./lua"
              }
    }
  }
}
dependencies = {
  -- "lua 5.3",
  "inspect >= 3.1",
  "dkjson >= 2.6",
  "busted"
}
