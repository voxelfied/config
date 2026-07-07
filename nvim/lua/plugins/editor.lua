return {
    {
        'kiyoon/treesitter-indent-object.nvim',
        keys = {
            {
                "ai",
                function() require'treesitter_indent_object.textobj'.select_indent_outer() end,
                mode = {"x", "o"},
                desc = "Select context-aware indent (outer)",
            },
            {
                "aI",
                function() require'treesitter_indent_object.textobj'.select_indent_outer(true) end,
                mode = {"x", "o"},
                desc = "Select context-aware indent (outer, line-wise)",
            },
            {
                "ii",
                function() require'treesitter_indent_object.textobj'.select_indent_inner() end,
                mode = {"x", "o"},
                desc = "Select context-aware indent (inner, partial range)",
            },
            {
                "iI",
                function() require'treesitter_indent_object.textobj'.select_indent_inner(true, 'V') end,
                mode = {"x", "o"},
                desc = "Select context-aware indent (inner, entire range) in line-wise visual mode",
            },
        },
    },

    {
        'jbyuki/instant.nvim',
    },

    {
        'barrett-ruth/live-server.nvim',
        build = 'npm add -g live-server',
        cmd = { 'LiveServerStart', 'LiveServerStop' },
        config = true
    },

    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            local nvimtree = require("nvim-tree")
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            nvimtree.setup({
                view = {
                    width = 40,
                },
                renderer = {
                    indent_markers = {
                        enable = true,
                    },
                    icons = {
                        glyphs = {
                            git = {
                                unstaged = "✗",
                                staged = "✓",
                                unmerged = "",
                                renamed = "➜",
                                untracked = "★",
                                deleted = "",
                                ignored = "◌",
                            },
                            folder = {
                                arrow_closed = "",
                                arrow_open = "",
                                open = "",
                                empty = "",
                                empty_open = "",
                                symlink = "",
                                symlink_open = "",
                            },
                        },
                    },
                },
                actions = {
                    open_file = {
                        window_picker = {
                            enable = false,
                        },
                    },
                },
                filters = {
                    custom = { ".DS_Store" },
                },
                git = {
                    ignore = false,
                },
                hijack_cursor = true
            })
        end,
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup {
                defaults = {
                    layout_config = {
                        height = 25,
                        width = 0.8,
                        prompt_position = "bottom",
                        preview_cutoff = 15,
                        horizontal = {
                            mirror = true,
                        },
                        vertical = {
                            mirror = true,
                        },
                    },
                },
            }
        end,
    },

    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    },

    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            require("toggleterm").setup {
                auto_scroll = true,
                winbar = {
                    enabled = true,
                },
            }
        end,
    },

    {
        'gelguy/wilder.nvim',
        config = function()
            local wilder = require('wilder')
            wilder.setup({modes = {':', '/', '?'}})
            local gradient = {
                '#f4468f', '#fd4a85', '#ff507a', '#ff566f', '#ff5e63',
                '#ff6658', '#ff704e', '#ff7a45', '#ff843d', '#ff9036',
                '#f89b31', '#efa72f', '#e6b32e', '#dcbe30', '#d2c934',
                '#c8d43a', '#bfde43', '#b6e84e', '#aff05b'
            }
            for i, fg in ipairs(gradient) do
                gradient[i] = wilder.make_hl('WilderGradient' .. i, 'Pmenu', {{a = 1}, {a = 1}, {foreground = fg}})
            end
            wilder.set_option('renderer', wilder.popupmenu_renderer(
                wilder.popupmenu_palette_theme({
                    border = 'rounded',
                    max_height = '50%',
                    min_height = 0,
                    prompt_position = 'top',
                    reverse = 0,
                    pumblend = 20,
                    highlights = {
                        gradient = gradient,
                    },
                    highlighter = wilder.highlighter_with_gradient({
                        wilder.basic_highlighter(),
                    }),
                })
            ))
        end,
    },

    {
        'folke/zen-mode.nvim',
        opts = {},
    },

    {
        'akinsho/bufferline.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        version = "*",
        config = function()
            require('bufferline').setup({
                options = {
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            padding = 0
                        }
                    },
                    custom_filter = function(buf_number)
                        if vim.bo[buf_number].filetype == "NvimTree" then
                            return false
                        end
                        return true
                    end,
                    mode = "tabs",
                    separator_style = "slant",
                    show_buffer_icons = true,
                    show_buffer_close_icon = true,
                    buffer_close_icon = '',
                    get_element_icon = true,
                    show_close_icon = false,
                    close_icon = '󰅙',
                    show_tab_indicators = false,
                    persist_buffer_sort = true,
                    enforce_regular_tabs = true,
                    always_show_bufferline = true,
                    modified_icon = '●',
                    left_trunc_marker = '',
                    right_trunc_marker = '',
                    sort_by = 'id',
                    color_icons = true,
                    indicator = {
                        style = 'icon',
                        icon = '',
                    },
                    hover = {
                        enabled = true,
                        delay = 200,
                        reveal = {'close'},
                    }
                }
            })
        end
    },

    {
        'stevearc/dressing.nvim',
        event = "VeryLazy",
    },

    {
        'b0o/incline.nvim',
        config = function()
            local function get_diagnostic_label(props)
                local icons = {
                    Error = '',
                    Warn = '',
                    Info = '',
                    Hint = '',
                }
                local label = {}
                for severity, icon in pairs(icons) do
                    local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
                    if n > 0 then
                        table.insert(label, { icon .. ' ' .. n .. ' ', group = 'DiagnosticSign' .. severity })
                    end
                end
                return label
            end
            require("incline").setup({
                debounce_threshold = { falling = 500, rising = 250 },
                render = function(props)
                    local bufname = vim.api.nvim_buf_get_name(props.buf)
                    local filename = vim.fn.fnamemodify(bufname, ":t")
                    local diagnostics = get_diagnostic_label(props)
                    local modified = vim.api.nvim_buf_get_option(props.buf, "modified") and "bold,italic" or "None"
                    local filetype_icon, color = require("nvim-web-devicons").get_icon_color(filename)
                    local buffer = {
                        { filetype_icon, guifg = color },
                        { " " },
                        { filename, gui = modified },
                    }
                    if #diagnostics > 0 then
                        table.insert(diagnostics, { "| ", guifg = "grey" })
                    end
                    for _, buffer_ in ipairs(buffer) do
                        table.insert(diagnostics, buffer_)
                    end
                    return diagnostics
                end,
            })
        end,
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        main = "ibl",
        commit = "29be0919b91fb59eca9e90690d76014233392bef",
        config = function()
            local highlight = {
                "Lite",
                "Liter",
            }
            local hooks = require "ibl.hooks"
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "Lite", { fg = "#343F44" })
                vim.api.nvim_set_hl(0, "Liter", { fg = "#3D484D" })
            end)
            require("ibl").setup {
                indent = {
                    char = "▎",
                    highlight = highlight,
                },
                whitespace = {
                    remove_blankline_trail = false,
                },
                scope = {
                    enabled = false,
                },
                exclude = {
                    filetypes = {
                        "dashboard",
                    },
                },
            }
        end,
    },

    {
        "shellRaining/hlchunk.nvim",
        event = { "UIEnter" },
        config = function()
            require('hlchunk').setup({
                chunk = {
                    enable = true,
                    use_treesitter = false,
                    chars = {
                        horizontal_line = "━",
                        vertical_line = "┃",
                        left_top = "┏",
                        left_bottom = "┗",
                        right_arrow = "━",
                    },
                    style = {
                        "#A7C080",
                    },
                },
                blank = {
                    enable = false,
                },
                line_num = {
                    enable = false,
                    use_treesitter = true,
                },
            })
        end,
    },

    {
        'echasnovski/mini.animate',
        event = "VeryLazy",
        opts = function(_, opts)
            opts.scroll = {
                enable = false,
            }
        end,
    },

    {
        'karb94/neoscroll.nvim',
        config = function ()
            require('neoscroll').setup{}
        end,
    },

    {
        'andweeb/presence.nvim',
        config = function()
            require('presence').setup{}
        end,
    },

    {
        'LukasPietzschmann/telescope-tabs',
        requires = { 'nvim-telescope/telescope.nvim' },
        config = function()
            require('telescope-tabs').setup{}
        end,
    },

    {
        'mg979/vim-visual-multi',
        config = function()
            vim.g.VM_maps = {
                ["Select Cursor Down"] = "<Tab>j",
                ["Select Cursor Up"] =  "<Tab>k"
            }
        end,
    },

    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },

    {
        'typicode/bg.nvim',
        lazy = false,
    },

    {
        'wfxr/minimap.vim',
        config = function()
            vim.cmd([[highlight minimapRange guifg=#E69875 guibg=#2D353B]])
            vim.cmd([[highlight minimapCursor guifg=#E67E80 guibg=#2D353B]])
        end,
    },

    {
        'xiyaowong/link-visitor.nvim',
        config = function()
            require("link-visitor").setup{}
        end,
    },

    -- {
    --     'TobinPalmer/Tip.nvim',
    --     event = "VimEnter",
    --     init = function()
    --         require("tip").setup({
    --             seconds = 2,
    --             title = "Tip!",
    --             url = "https://vtip.43z.one",
    --         })
    --     end,
    -- },

    {
        "gbprod/cutlass.nvim",
        opts = {
            cut_key = 'x',
            override_del = true,
            registers = {
                select = '_',
                delete = '_',
                change = '_'
            }
        }
    },

    -- {
    --     "3rd/image.nvim",
    --     config = function()
    --         require("image").setup({
    --             backend = "kitty",
    --             integrations = {
    --                 markdown = {
    --                     enabled = true,
    --                     clear_in_insert_mode = false,
    --                     download_remote_images = true,
    --                     only_render_image_at_cursor = false,
    --                     filetypes = { "markdown", "vimwiki" },
    --                 },
    --                 neorg = {
    --                     enabled = true,
    --                     clear_in_insert_mode = false,
    --                     download_remote_images = true,
    --                     only_render_image_at_cursor = false,
    --                     filetypes = { "norg" },
    --                 },
    --                 html = {
    --                     enabled = false,
    --                 },
    --                 css = {
    --                     enabled = false,
    --                 },
    --             },
    --             max_width = nil,
    --             max_height = nil,
    --             max_width_window_percentage = nil,
    --             max_height_window_percentage = 50,
    --             window_overlap_clear_enabled = false,
    --             window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    --             editor_only_render_when_focused = false,
    --             tmux_show_only_in_active_window = false,
    --             hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
    --         })
    --     end,
    -- }
}
