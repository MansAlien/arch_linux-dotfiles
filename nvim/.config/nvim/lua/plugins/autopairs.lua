return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true, -- use treesitter to check for pairs
      ts_config = {
        lua = { "string" },
        python = { "string" },
      },
    })
    -- Hook into nvim-cmp so autopairs works on completion confirm
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
