# Getting started

```console
luarocks --tree lua_modules install --only-deps awesome-dev-1.rockspec
```

# Testing
Test the current rc configuration by editing a file called
`runtime.lua`, whatever is returned by that file is printed into
the console. Use the `inspect` module so that if you return a lua table
you are able to see a pretty output of it

```console
./awesome-client.sh
```

# Documentation
- [Awesome](https://awesomewm.org/doc/api/index.html)
