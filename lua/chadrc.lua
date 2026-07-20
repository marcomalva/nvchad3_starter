-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },

    -- 1. Git branch name ("🌿 main") text color (Green)
    St_gitIcons = { fg = "#98c379", bg = "statusline_bg" },
    St_gitTxt   = { fg = "#98c379", bg = "statusline_bg" },

    -- 2. Git Diff statistics accent colors
    St_lspAdded   = { fg = "#98c379", bg = "statusline_bg", bold = true }, -- Added lines (Green)
    St_lspFix     = { fg = "#e5c07b", bg = "statusline_bg", bold = true }, -- Modified lines (Yellow)
    St_lspRemoved = { fg = "#e06c75", bg = "statusline_bg", bold = true }, -- Deleted lines (Red)  
  },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

--look more like the vchad2 config
M.ui = {
  statusline = {
    -- 1. Keeps the baseline layout enabled
    enabled = true,

    -- 2. Restores the block style layout from your classic setup
    theme = "default", 
    separator_style = "block", -- Can be: "default", "round", "block", or "arrow"
  }
}

return M
