return {
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    cmd = { "Mason", "MasonUpdate", "MasonLog", "MasonInstall", "MasonUninstall", "MasonUninstallAll" },
    opts = {},
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed = { "rust_analyzer", "pyright", "lua_ls" },
    },
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.o.completeopt = "menuone,noselect"
      vim.o.pumheight = 10

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("my.lsp", { clear = true }),
        callback = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
          local bufnr = args.buf

          -- このバッファでの自動補完セットアップは1回だけ
          if vim.b.my_lsp_autocmp_setup then return end
          vim.b.my_lsp_autocmp_setup = true

          if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
          end

          local tick_key = "my_lsp_autocmp_tick"
          vim.b[tick_key] = 0

          vim.api.nvim_create_autocmd("InsertCharPre", {
            group = vim.api.nvim_create_augroup("my.lsp.autocomplete." .. bufnr, { clear = true }),
            buffer = bufnr,
            callback = function()
              if vim.fn.pumvisible() == 1 then return end

              vim.b[tick_key] = (vim.b[tick_key] or 0) + 1
              local my_tick = vim.b[tick_key]

              vim.defer_fn(function()
                if not vim.api.nvim_buf_is_valid(bufnr) then return end
                if (vim.b[tick_key] or 0) ~= my_tick then return end
                if vim.fn.pumvisible() == 1 then return end
                pcall(vim.lsp.completion.get, {})
              end, 120)
            end,
          })

          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
          end

          map("n", "K", vim.lsp.buf.hover, "LSP Hover")
          map("n", "gd", vim.lsp.buf.definition, "Go to definition")
          map("n", "gr", vim.lsp.buf.references, "References")
          map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
          map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format")

          if vim.lsp.inlay_hint then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          end
        end,
      })

      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = true,
            check = {
                command = "clippy",
            },
          },
        },
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })

      vim.lsp.enable({ "rust_analyzer", "pyright", "lua_ls" })
    end,
  },
}