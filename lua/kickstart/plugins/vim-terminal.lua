-- Vim Terminal Plugin Configuration

return {
    'tc50cal/vim-terminal',
    config = function()
        -- Optional configuration for vim-terminal
        -- Add any specific vim-terminal settings here
        
        -- Example key mappings
        vim.keymap.set('n', '<leader>t', ':Terminal<CR>', { noremap = true, silent = true })
        vim.keymap.set('n', '<leader>tv', ':TerminalVS<CR>', { noremap = true, silent = true })
    end
}