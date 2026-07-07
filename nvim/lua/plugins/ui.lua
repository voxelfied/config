return {
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
        config = function ()
            require("barbecue").setup({
                theme = {
                    normal = { bg = "#343F44" },
                },
            })
        end,
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'archibate/lualine-time', 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    component_separators = '',
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = true,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    }
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch', 'diff', 'diagnostics'},
                    lualine_c = {'filename'},
                    lualine_x = {'encoding', 'filetype'},
                    lualine_y = {'progress'},
                    lualine_z = {'ctime'},
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {'filename'},
                    lualine_x = {'location'},
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                extensions = {'nvim-tree'},
                inactive_winbar = {},
            }
        end,
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        config = function()
            require("noice").setup({
                cmdline = {
                    enabled = true,
                    view = "cmdline",
                    opts = {},
                    format = {
                        cmdline = { pattern = "^:", icon = "", lang = "vim" },
                        search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
                        search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
                        filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
                        lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
                        help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
                        input = {},
                    },
                },
                messages = {
                    enabled = true,
                    view = "notify",
                    view_error = "notify",
                    view_warn = "notify",
                    view_history = "messages",
                    view_search = "virtualtext",
                },
                popupmenu = {
                    enabled = true,
                    backend = "nui",
                    kind_icons = {},
                },
                redirect = {
                    view = "popup",
                    filter = { event = "msg_show" },
                },
                commands = {
                    history = {
                        view = "split",
                        opts = { enter = true, format = "details" },
                        filter = {
                            any = {
                                { event = "notify" },
                                { error = true },
                                { warning = true },
                                { event = "msg_show", kind = { "" } },
                                { event = "lsp", kind = "message" },
                            },
                        },
                    },
                    last = {
                        view = "popup",
                        opts = { enter = true, format = "details" },
                        filter = {
                            any = {
                                { event = "notify" },
                                { error = true },
                                { warning = true },
                                { event = "msg_show", kind = { "" } },
                                { event = "lsp", kind = "message" },
                            },
                        },
                        filter_opts = { count = 1 },
                    },
                    errors = {
                        view = "popup",
                        opts = { enter = true, format = "details" },
                        filter = { error = true },
                        filter_opts = { reverse = true },
                    },
                },
                notify = {
                    enabled = true,
                    view = "notify",
                },
                lsp = {
                    progress = {
                        enabled = true,
                        format = "lsp_progress",
                        format_done = "lsp_progress_done",
                        throttle = 1000 / 30,
                        view = "mini",
                    },
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
                        ["vim.lsp.util.stylize_markdown"] = false,
                        ["cmp.entry.get_documentation"] = false,
                    },
                    hover = {
                        enabled = true,
                        silent = false,
                        view = nil,
                        opts = {},
                    },
                    signature = {
                        enabled = true,
                        auto_open = {
                            enabled = true,
                            trigger = true,
                            luasnip = true,
                            throttle = 50,
                        },
                        view = nil,
                        opts = {},
                    },
                    message = {
                        enabled = true,
                        view = "notify",
                        opts = {},
                    },
                    documentation = {
                        view = "hover",
                        opts = {
                            lang = "markdown",
                            replace = true,
                            render = "plain",
                            format = { "{message}" },
                            win_options = { concealcursor = "n", conceallevel = 3 },
                        },
                    },
                },
                markdown = {
                    hover = {
                        ["|(%S-)|"] = vim.cmd.help,
                        ["%[.-%]%((%S-)%)"] = require("noice.util").open,
                    },
                    highlights = {
                        ["|%S-|"] = "@text.reference",
                        ["@%S+"] = "@parameter",
                        ["^%s*(Parameters:)"] = "@text.title",
                        ["^%s*(Return:)"] = "@text.title",
                        ["^%s*(See also:)"] = "@text.title",
                        ["{%S-}"] = "@parameter",
                    },
                },
                health = {
                    checker = true,
                },
                smart_move = {
                    enabled = true,
                    excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
                },
                presets = {
                    bottom_search = false,
                    command_palette = false,
                    long_message_to_split = false,
                    inc_rename = true,
                    lsp_doc_border = true,
                },
                throttle = 1000 / 30,
                views = {},
                routes = {},
                status = {},
                format = {},
            })
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },

    {
        'rcarriga/nvim-notify',
        opts = {
            timeout = 1000,
        },
    },

    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        opts = function(_, opts)
            local logo = [[
    ██╗   ██╗███████╗██╗███████╗██████╗ ████████╗███████╗ ██████╗██╗  ██╗
    ██║   ██║██╔════╝██║██╔════╝██╔══██╗╚══██╔══╝██╔════╝██╔════╝██║  ██║
    ██║   ██║█████╗  ██║█████╗  ██║  ██║   ██║   █████╗  ██║     ███████║
    ╚██╗ ██╔╝██╔══╝  ██║██╔══╝  ██║  ██║   ██║   ██╔══╝  ██║     ██╔══██║
     ╚████╔╝ ██║     ██║███████╗██████╔╝██╗██║   ███████╗╚██████╗██║  ██║
      ╚═══╝  ╚═╝     ╚═╝╚══════╝╚═════╝ ╚═╝╚═╝   ╚══════╝ ╚═════╝╚═╝  ╚═╝
    ]]
        -- ██╗  ██╗██████╗
        -- ██║  ██║╚═██╔═╝
        -- ╚██╗██╔╝  ██║
        --  ╚███╔╝██╗██║
        --   ╚══╝ ╚═╝╚═╝
            logo = string.rep("\n", 8) .. logo .. "\n\n"
            opts.config = { header = vim.split(logo, "\n") }
        end,
    }
}
