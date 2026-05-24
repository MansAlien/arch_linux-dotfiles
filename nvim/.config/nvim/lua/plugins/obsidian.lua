return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/notes/*.md",
    "BufNewFile "  .. vim.fn.expand("~") .. "/notes/*.md",
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    workspaces = {
      { name = "notes", path = "~/notes" },
    },
    -- Daily notes go into a subfolder
    daily_notes = {
      folder = "daily",
      date_format = "%Y-%m-%d",
    },
    -- Use telescope for search
    picker = { name = "telescope.nvim" },
    -- Pretty checkboxes
    ui = {
      checkboxes = {
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "󰱒", hl_group = "ObsidianDone" },
        [">"] = { char = "", hl_group = "ObsidianRightArrow" },
      },
    },
    -- Auto-format frontmatter on save
    note_frontmatter_func = function(note)
      local out = { id = note.id, tags = note.tags }
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,
  },
  keys = {
    { "<leader>on", "<cmd>ObsidianNew<cr>",           desc = "New note" },
    { "<leader>oo", "<cmd>ObsidianOpen<cr>",          desc = "Open in Obsidian app" },
    { "<leader>of", "<cmd>ObsidianQuickSwitch<cr>",   desc = "Find note" },
    { "<leader>os", "<cmd>ObsidianSearch<cr>",        desc = "Search notes" },
    { "<leader>od", "<cmd>ObsidianDailies<cr>",       desc = "Daily notes" },
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>",     desc = "Show backlinks" },
    { "<leader>ol", "<cmd>ObsidianLinks<cr>",         desc = "Show links" },
    { "<leader>ot", "<cmd>ObsidianTags<cr>",          desc = "Search by tag" },
    { "<leader>or", "<cmd>ObsidianRename<cr>",        desc = "Rename note" },
  },
}
