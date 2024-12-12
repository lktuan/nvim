return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        local toggleterm = require("toggleterm")
        toggleterm.setup({
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                 elseif term.direction == "window" then
                    return 15
                end
            end,
            open_mapping = [[<c-\>]],
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = 'horizontal', -- 'vertical' | 'horizontal' | 'window' | 'float'
            close_on_exit = true,
            shell = '"C:\\Program Files\\PowerShell\\7\\pwsh.exe"', -- set powershell as default
            auto_scroll = true,
            -- Additional terminal configurations
            float_opts = {
                border = 'curved',
                winblend = 0,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                }
            }
        })

      -- map open key to toggleterm.toggle()
      vim.keymap.set('n','<c-\\>', toggleterm.toggle)


        -- Custom function to toggle terminal
        function _G.set_terminal_keymaps()
            local opts = {buffer = 0}
            vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        end

        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

        -- Lazygit terminal
        local Terminal = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new({ 
            cmd = "lazygit", 
            hidden = true, 
            direction = "float" ,
                shell = 'pwsh.exe',-- Add to set lazygit to use pwsh
        })

        function _LAZYGIT_TOGGLE()
            lazygit:toggle()
        end

        -- Keymaps
        vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", {noremap = true, silent = true})
    end
}