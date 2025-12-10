local blend = 10

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lazygit" },
  callback = function(ctx)
    local backdropName = "LazyGitBackdrop"
    local lazygit_buf = ctx.buf

    -- lazynvim floating plugins usually sit around zindex = 50–60
    local lazygit_zindex = 50

    -- create the dim backdrop buffer
    local backdrop_buf = vim.api.nvim_create_buf(false, true)
    local backdrop_win = vim.api.nvim_open_win(backdrop_buf, false, {
      relative = "editor",
      row = 0,
      col = 0,
      width = vim.o.columns,
      height = vim.o.lines,
      focusable = false,
      style = "minimal",
      zindex = lazygit_zindex - 1, -- always below lazygit
    })

    -- highlight + transparency
    vim.api.nvim_set_hl(0, backdropName, { link = "Normal", default = true })
    vim.wo[backdrop_win].winhighlight = "Normal:" .. backdropName
    vim.wo[backdrop_win].winblend = blend
    vim.bo[backdrop_buf].buftype = "nofile"

    -- automatically close backdrop when lazygit closes
    vim.api.nvim_create_autocmd({ "WinClosed", "BufLeave" }, {
      once = true,
      buffer = lazygit_buf,
      callback = function()
        if vim.api.nvim_win_is_valid(backdrop_win) then
          vim.api.nvim_win_close(backdrop_win, true)
        end
        if vim.api.nvim_buf_is_valid(backdrop_buf) then
          vim.api.nvim_buf_delete(backdrop_buf, { force = true })
        end
      end,
    })
  end,
})
