-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/kbroom/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/kbroom/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/kbroom/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/kbroom/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/kbroom/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/kbroom/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/kbroom/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/kbroom/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  ["dart-vim-plugin"] = {
    loaded = true,
    path = "/home/kbroom/.local/share/nvim/site/pack/packer/start/dart-vim-plugin"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/kbroom/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/kbroom/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["kotlin-vim"] = {
    loaded = true,
    path = "/home/kbroom/.local/share/nvim/site/pack/packer/start/kotlin-vim"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "/home/kbroom/.local/share/nvim/site/pack/packer/start/lightline.vim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/kbroom/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["nim.nvim"] = {
    loaded = true,
    path = "/home/kbroom/.local/share/nvim/site/pack/packer/start/nim.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/kbroom/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/kbroom/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/kbroom/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/kbroom/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/home/kbroom/.local/share/nvim/site/pack/packer/start/onedark.vim"
  },
  ["orgmode.nvim"] = {
    config = { "\27LJ\1\0025\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\forgmode\frequire\0" },
    loaded = true,
    path = "/home/kbroom/.local/share/nvim/site/pack/packer/start/orgmode.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/kbroom/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/kbroom/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/kbroom/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/kbroom/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-crystal"] = {
    loaded = true,
    path = "/home/kbroom/.local/share/nvim/site/pack/packer/start/vim-crystal"
  },
  ["vim-fish-syntax"] = {
    loaded = true,
    path = "/home/kbroom/.local/share/nvim/site/pack/packer/start/vim-fish-syntax"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/kbroom/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gutentags"] = {
    loaded = true,
    path = "/home/kbroom/.local/share/nvim/site/pack/packer/start/vim-gutentags"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/kbroom/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: orgmode.nvim
time([[Config for orgmode.nvim]], true)
try_loadstring("\27LJ\1\0025\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\forgmode\frequire\0", "config", "orgmode.nvim")
time([[Config for orgmode.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
