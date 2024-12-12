-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

-- Neo-tree Configuration
return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
  },
  config = function()
      -- Unless you are still wanting to use the old layout, this should be enabled
      vim.g.neo_tree_remove_legacy_commands = 1

      -- If you want icons to show up, you'll need a Nerd Font
      require("neo-tree").setup({
          close_if_last_window = true, -- Close Neo-tree if it is the last window left
          popup_border_style = "rounded",
          enable_git_status = true,
          enable_diagnostics = true,
          
          default_component_configs = {
              indent = {
                  indent_size = 2,
                  padding = 1,
                  with_markers = true,
                  indent_marker = "│",
                  last_indent_marker = "└",
                  highlight = "NeoTreeIndentMarker",
              },
              icon = {
                  folder_closed = "",
                  folder_open = "",
                  folder_empty = "ﰊ",
              },
              git_status = {
                  symbols = {
                      -- Change type
                      added     = "✚",
                      modified  = "",
                      deleted   = "✖",
                      renamed   = "",
                      -- Status type
                      untracked = "",
                      ignored   = "",
                      unstaged  = "",
                      staged    = "",
                      conflict  = "",
                  }
              },
          },
          
          window = {
              position = "left",
              width = 30,
              mapping_options = {
                  noremap = true,
                  nowait = true,
              },
              mappings = {
                  ["<space>"] = { 
                      "toggle_node", 
                      nowait = false 
                  },
                  ["<2-LeftMouse>"] = "open",
                  ["<cr>"] = "open",
                  ["<esc>"] = "revert_preview",
                  ["P"] = { "toggle_preview", config = { use_float = true } },
                  ["l"] = "focus_preview",
                  ["S"] = "open_split",
                  ["s"] = "open_vsplit",
                  ["t"] = "open_tabnew",
                  ["w"] = "open_with_window_picker",
                  ["C"] = "close_node",
                  ["z"] = "close_all_nodes",
                  ["a"] = { 
                      "add",
                      config = {
                          show_path = "none" -- "none", "relative", "absolute"
                      }
                  },
                  ["A"] = "add_directory",
                  ["d"] = "delete",
                  ["r"] = "rename",
                  ["y"] = "copy_to_clipboard",
                  ["x"] = "cut_to_clipboard",
                  ["p"] = "paste_from_clipboard",
                  ["c"] = "copy",
                  ["m"] = "move",
                  ["q"] = "close_window",
              }
          },
          
          filesystem = {
              filtered_items = {
                  visible = false, -- when true, they will just be displayed differently than normal items
                  hide_dotfiles = true,
                  hide_gitignored = true,
                  hide_hidden = true, -- only works on Windows for hidden files/directories
                  hide_by_name = {
                      ".DS_Store",
                      "thumbs.db"
                  },
                  never_show = { -- remains hidden even if visible is toggled to true
                      ".DS_Store",
                      "thumbs.db"
                  },
              },
              follow_current_file = {
                  enabled = true, -- This will find and focus the file in the active buffer every time
              },
              group_empty_dirs = true, -- when true, empty folders will be grouped together
              hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
              use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
          },
          
          buffers = {
              follow_current_file = {
                  enabled = true, -- This will find and focus the file in the active buffer every time
              },
              group_empty_dirs = true, -- when true, empty folders will be grouped together
              show_unloaded = true,
          },
          
          git_status = {
              window = {
                  position = "float",
                  mappings = {
                      ["A"]  = "git_add_all",
                      ["gu"] = "git_unstage_file",
                      ["ga"] = "git_add_file",
                      ["gr"] = "git_revert_file",
                      ["gc"] = "git_commit",
                      ["gp"] = "git_push",
                      ["gg"] = "git_commit_and_push",
                  }
              }
          }
      })

      -- Optional: Key mapping to toggle Neo-tree
      vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', { noremap = true, silent = true })
  end
}