return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp"
    },
    config = function()
        local utils = require("utils")
        local create_autocmd = utils.create_autocmd
        local create_augroup = utils.create_augroup
        local map = utils.map

        -- set capabilities
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            require("cmp_nvim_lsp").default_capabilities()
        )

        -- configure mason
        require("mason").setup()

        -- configure language servers using mason-lspconfig
        require("mason-lspconfig").setup {
            -- Available servers can be found here: https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
            ensure_installed = {
                "lua_ls"
            },
            handlers = {
                -- default handler
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        settings = {
                            Lua = {
                                runtime = {
                                    version = "LuaJIT"
                                },
                                diagnostics = {
                                    globals = { "vim" }
                                },
                                workspace = {
                                    library = vim.api.nvim_get_runtime_file("lua", true)
                                },
                                telemetry = {
                                    enable = false
                                }
                            }
                        }
                    }
                end
            }
        }

        -- Use LspAttach event to map keys after language server attaches to buffer
        create_autocmd("LspAttach", create_augroup("UserLspConfig"), function(event)
            -- Enable completion triggered by <c-x><c-o>
            vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

            -- Buffer local mappings
            local opts = { buffer = event.buf }
            local buf = vim.lsp.buf
            map("n", "gD", buf.declaration, opts)
            map("n", "gd", buf.definition, opts)
            map("n", "K", buf.hover, opts)
            map("n", "gi", buf.implementation, opts)
            map("n", "gs", buf.signature_help, opts)
            map("n", "<Space>wa", buf.add_workspace_folder, opts)
            map("n", "<Space>wr", buf.remove_workspace_folder, opts)
            map("n", "<Space>wl", function() print(vim.inspect(buf.list_workspace_folders())) end, opts)
            map("n", "<Space>D", buf.type_definition, opts)
            map("n", "<Space>rn", buf.rename, opts)
            map({ "n", "v" }, "<Space>ca", buf.code_action, opts)
            map("n", "gr", buf.references, opts)
            map("n", "<Space>f", function() buf.format { async = true } end, opts)
        end)

        vim.diagnostic.config {
            update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = ""
            }
        }
    end
}
