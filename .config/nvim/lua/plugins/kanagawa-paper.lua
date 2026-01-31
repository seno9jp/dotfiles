return {
  "thesimonho/kanagawa-paper.nvim",
  lazy = false,
  priority = 1000,

  opts = {
    -- 好みで調整（最小なら {} でもOK）
    transparent = false,
    gutter = false,
    diag_background = true,

    styles = {
      comment = { italic = true },
      keyword = { italic = false, bold = false },
    },
  },

  init = function()
    vim.cmd.colorscheme("kanagawa-paper-ink")
  end,
}