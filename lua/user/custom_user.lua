local M = {}

M.config = function()
  if vim.fn.has "nvim-0.9" == 1 then
    vim.opt.mousescroll = { "ver:1", "hor:6" }
    vim.o.mousefocus = true
    vim.o.mousemoveevent = true
    vim.o.splitkeep = "screen"
  end

  lvim.builtin.lsp_lines = true
  vim.diagnostic.config { virtual_lines = false } -- i only want to use it explicitly ( by calling the toggle function)
  lvim.builtin.tmux_lualine = true
  if lvim.builtin.tmux_lualine then
    vim.opt.cmdheight = 0
    vim.opt.laststatus = 0
    vim.g.tpipeline_cursormoved = 1
    -- HACK: lualine hijacks the statusline, so we need to set it back to what we want
    if vim.env.TMUX then
      vim.cmd [[ autocmd WinEnter,BufEnter,VimResized * setlocal laststatus=0 ]]
    end
  end
  -- NOTE: custom icons doesn't work with nerd font v3 yet
  lvim.builtin.custom_web_devicons = false
  lvim.use_icons = true -- only set to false if you know what are you doing
  lvim.builtin.sell_your_soul_to_devil.active = true
  lvim.builtin.sell_your_soul_to_devil.prada = true
  lvim.builtin.sell_your_soul_to_devil.openai = true -- NOTE: requires valid OPENAI_API_KEY environment variable
  lvim.lsp.document_highlight = false
  lvim.builtin.task_runner = "async_tasks"
  lvim.builtin.dap.active = true
  vim.g.instant_username = vim.env.USER
  lvim.builtin.global_statusline = true
  lvim.builtin.file_browser = { active = true } -- enable/disable telescope file browser
  lvim.builtin.dressing.active = true
  lvim.builtin.fancy_wild_menu.active = true
  lvim.builtin.fancy_diff = { active = true }
  lvim.builtin.refactoring.active = true
  lvim.builtin.test_runner.runner = "neotest"
  lvim.builtin.sql_integration = { active = false } -- use sql integration
  lvim.format_on_save = {
    enabled = true,
    pattern = "*.rs",
    timeout = 2000,
    filter = require("lvim.lsp.utils").format_filter,
  }
  lvim.builtin.smooth_scroll = "neoscroll"
  lvim.builtin.tree_provider = "neo-tree"
  lvim.builtin.noice.active = true
  lvim.builtin.go_programming.active = true
  lvim.builtin.python_programming.active = true
  lvim.builtin.web_programming.active = true
  lvim.builtin.rust_programming.active = true
  lvim.builtin.cpp_programming.active = false
  lvim.builtin.borderless_cmp = true
  lvim.builtin.colored_args = true
  lvim.reload_config_on_save = false -- NOTE: i don't like this
  lvim.builtin.mind.active = false
  lvim.builtin.motion_provider = "flash"
  lvim.builtin.harpoon.active = true
  lvim.builtin.symbols_usage.active = true
  -- require("lvim.lsp.manager").setup("prosemd_lsp", {})
end

return M
