-- plugins/treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()

      require("nvim-treesitter").install({
        "lua",
        "python",
        "html",
        "htmldjango",
        "yaml",
        "css",
        "json",
        "javascript",
        "typescript",
        "markdown",
        "markdown_inline",
        "bash",
        "vim",
        "vimdoc",
      })

      -- Make ALL tree-sitter queries findable (including YAML, TOML, etc.)
      vim.opt.rtp:append(vim.fn.stdpath("data") .. "/lazy/nvim-treesitter/runtime")

      -- Start tree-sitter for all filetypes
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          if vim.bo.filetype ~= "" then
            pcall(vim.treesitter.start)
          end
        end,
      })

      -- Link @capture.lang -> @capture for any filetype (Neovim 0.12 compat)
      local function link_ts_hl_groups()
        local ft = vim.bo.filetype
        if ft == "" then return end
        local query = vim.treesitter.query.get(ft, "highlights")
        if not query then return end
        for _, name in ipairs(query.captures) do
          if not vim.startswith(name, "_") then
            local lang_group = "@" .. name .. "." .. ft
            local generic = "@" .. name
            local hl = vim.api.nvim_get_hl(0, { name = lang_group })
            if vim.tbl_isempty(hl) then
              pcall(vim.api.nvim_set_hl, 0, lang_group, { link = generic, default = true })
            end
          end
        end
      end
      vim.api.nvim_create_autocmd("FileType", {
        callback = link_ts_hl_groups,
      })

      vim.treesitter.query.add_directive(
        "set-lang-from-info-string!",
        function(match, _, bufnr, pred, metadata)
          local node = match[pred[2]]
          if not node then return end
          local ok, text = pcall(vim.treesitter.get_node_text, node, bufnr)
          if not ok or not text then return end
          metadata["injection.language"] = text:lower()
        end,
        { force = true }
      )
    end,
  },
}
