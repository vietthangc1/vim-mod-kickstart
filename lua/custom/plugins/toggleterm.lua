return {
  'akinsho/toggleterm.nvim',
  -- Optional dependency
  config = function()
    -- vim.cmd([[let &shell = has('win32') ? 'powershell' : 'pwsh'
    -- let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
    -- let &shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
    -- let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    -- set shellquote= shellxquote=
    -- ]])
    require("toggleterm").setup {
      open_mapping = [[<c-\>]],
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      autochdir = false,   -- when neovim changes it current directory the terminal will change it's own when next it's opened
      highlights = {
        -- highlights which map to a highlight group name and a table of it's values
        -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
      },
      shade_terminals = true,   -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
      start_in_insert = true,
      insert_mappings = true,   -- whether or not the open mapping applies in insert mode
      terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
      persist_size = true,
      persist_mode = true,      -- if set to true (default) the previous terminal mode will be remembered
      direction = 'float',
      close_on_exit = true,     -- close the terminal window when the process exits
      -- Change the default shell. Can be a string or a function returning a string
      shell = "pwsh.exe",
      auto_scroll = true, -- automatically scroll to the bottom on terminal output
      float_opts = {

      },
      winbar = {
        enabled = true,
        name_formatter = function(term) --  term: Terminal
          return term.number + term.name
        end
      },
    }
    vim.cmd([[autocmd TermEnter term://*toggleterm#* tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>]])
    vim.cmd([[nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>]])
    vim.cmd([[inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>]])
  end,
}
