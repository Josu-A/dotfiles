return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "folke/which-key.nvim"
    },
    config = function()
        local utils = require("config.utils")
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
                "als", -- Ada
                "bashls", -- Bash
                "clangd", -- C
                "cssls", -- CSS
                "html", -- HTML
                "ts_ls", -- JavaScript / TypeScript
                "jdtls", -- Java
                "jsonls", -- JSON
                "ltex", -- Latex
                "texlab",
                "lua_ls", -- Lua
                "marksman", -- Markdown
                "pyright", -- Python
                "sqls", -- SQL
                "taplo", -- TOML
                "lemminx" -- XML
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
            local nMap = function (lhs, rhs, desc)
                map("n", lhs, rhs, desc, opts)
            end
            require("which-key").add({
                { "<Leader>W", group = "Workspace" },
            })

            nMap("gD", buf.declaration, "Jumps to the declaration of the symbol under the cursor")
            nMap("gd", buf.definition, "Jumps to the definiton of the symbol under the cursor")
            nMap("K", buf.hover, "Displays hover information about the symbol under te cursor")
            nMap("gi", buf.implementation, "List all the implementations for the symbol under the cursor")
            nMap("gs", buf.signature_help, "Displays signature information about the symbol under the cursor")
            nMap("<Leader>Wa", buf.add_workspace_folder, "Add a folder to the workspace")
            nMap("<Leader>Wr", buf.remove_workspace_folder, "Remove a folder from the workspace")
            nMap("<Leader>Wl", function () print(vim.inspect(buf.list_workspace_folders())) end, "List workspace folders")
            nMap("gtd", buf.type_definition, "Jumps to the definition of the type of the symbol under the cursor")
            nMap("<Leader>r", buf.rename, "Renames all references to the symbol under the cursor")
            nMap("gr", buf.references, "Lists all references to the symbol under the cursor")
            nMap("<Leader>f", function () buf.format { async = true } end, "Format current buffer using the LS")
            --map({ "n", "v" }, "<Space>ca", buf.code_action, opts)
        end)

        vim.diagnostic.config {
            update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = true,
                header = "",
                prefix = ""
            }
        }
    end
}
