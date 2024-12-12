return {
    'mg979/vim-visual-multi',
    config = function()
        -- Configuration for vim-multiple-cursors (now vim-visual-multi)
        
        -- Customize key mappings (optional)
        vim.g.VM_maps = {
            ['Find Under'] = '<C-n>',
            ['Find Subword Under'] = '<C-n>',
            ['Select All'] = '<leader>A',
            ['Start Regex Search'] = '\\\\/',
            ['Add Cursor Down'] = '<C-Down>',
            ['Add Cursor Up'] = '<C-Up>'
        }
        
        -- Additional optional configurations
        vim.g.VM_theme = 'iceblue'  -- Optional theme
    end
}