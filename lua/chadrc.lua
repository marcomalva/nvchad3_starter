-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",

  -- Tell the bytecode compiler to append a brand new rule
  hl_add = {
    St_myCenterBlue = {
      fg = "blue",
      bg = "statusline_bg",
      bold = true,
    },
  },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },

    -- Git Icons/Text in Status Line in purple https://github.com/NvChad/ui/blob/v3.0/nvchad_types/all_hl_groups.lua
    St_gitIcons = { fg = "purple", bg = "statusline_bg" },

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

-- Look more like the NVchad v2
M.ui = {
  statusline = {
    -- Use two %= signs to force everything between them into the exact center
    order = { "mode", "file", "git", "%=", "lsp_msg", "diagnostics", "center_info", "%=", "lsp", "cwd", "cursor" },
    separator_style = "default", -- or use "round", "arrow", "block"

    modules = {
      center_info = function()
        local os_encode = vim.bo.fileencoding ~= "" and vim.bo.fileencoding or vim.o.encoding
        local ft = vim.bo.filetype
        ft = ft ~= "" and ft or "no ft"

        -- Combine them into one string
        local info_str = string.upper(os_encode) .. " " .. string.lower(ft)

        -- Wrap with NvChad's blue statusline highlight group
        return "%#St_myCenterBlue# " .. info_str .. " "
      end,
    },
  },
}

-- Use below to use vscode_colored status line
-- M.ui = {
--   statusline = {
--     separator_style = "default", -- or use "round", "arrow", "block"
--     theme = "vscode_colored",    -- enables the vscode colored statusline
--   },
-- }

return M
