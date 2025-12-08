return {
    -- {
    --     "copilot.lua",
    --     cmd = "Copilot",
    --     event = "InsertEnter",
    --     for_cat = "ai",
    --     after = function()
    --         require("copilot").setup({
    --             nes = {
    --                 enabled = true,
    --                 keymap = {
    --                     accept_and_goto = "<leader>p",
    --                     accept = false,
    --                     dismiss = "<Esc>",
    --                 },
    --             },
    --             server = {
    --                 type = "binary",
    --                 custom_server_filepath = vim.fn.exepath("copilot-language-server"),
    --             },
    --         })
    --     end,
    -- },
    -- {
    --     "copilot-lsp",
    --     for_cat = "ai",
    --     event = "DeferredUIEnter",
    --     before = function()
    --         vim.g.copilot_nes_debounce = 500
    --         vim.lsp.enable("copilot_ls")
    --         vim.keymap.set("n", "<tab>", function()
    --             local bufnr = vim.api.nvim_get_current_buf()
    --             local state = vim.b[bufnr].nes_state
    --             if state then
    --                 -- Try to jump to the start of the suggestion edit.
    --                 -- If already at the start, then apply the pending suggestion and jump to the end of the edit.
    --                 local _ = require("copilot-lsp.nes").walk_cursor_start_edit()
    --                     or (
    --                         require("copilot-lsp.nes").apply_pending_nes()
    --                         and require("copilot-lsp.nes").walk_cursor_end_edit()
    --                     )
    --                 return nil
    --             else
    --                 -- Resolving the terminal's inability to distinguish between `TAB` and `<C-i>` in normal mode
    --                 return "<C-i>"
    --             end
    --         end, { desc = "Accept Copilot NES suggestion", expr = true })
    --     end,
    --     -- after = function()
    --     --     require("copilot-lsp").setup()
    --     -- end,
    -- },
    {
        -- opencode.nvim from NickvanDyke
        "opencode-nvim",
        for_cat = "ai",
        keys = {
                -- stylua: ignore start
                { '<leader>co', function() require('opencode').toggle() end, desc = 'Toggle opencode' },
                { '<leader>ca', function() require('opencode').ask() end, desc = 'Ask opencode', mode = { 'n', 'v' } },
                { '<leader>cA', function() require('opencode').ask('@buffer ') end, desc = 'Ask opencode about current file', mode = { 'n', 'v' } },
                { '<leader>cn', function() require('opencode').command('session.new') end, desc = 'New session' },
                { '<leader>ce', function() require('opencode').prompt('Explain @this and its context') end, desc = 'Explain code at cursor', mode = { 'n', 'v' } },
                { '<leader>cr', function() require('opencode').prompt('Review @buffer for correctness and readability') end, desc = 'Review file' },
                { '<leader>cf', function() require('opencode').prompt('Fix @diagnostics') end, desc = 'Fix errors' },
                { '<leader>cp', function() require('opencode').prompt('Optimize @this for performance and readability') end, desc = 'Optimize selection', mode = 'v' },
                { '<leader>cd', function() require('opencode').prompt('Add documentation comments for @this') end, desc = 'Document selection', mode = 'v' },
                { '<leader>ct', function() require('opencode').prompt('Add tests for @this') end, desc = 'Test selection', mode = 'v' },
                { '<leader>cs', function() require('opencode').select() end, desc = 'Select opencode action', mode = { 'n', 'v' } },
            -- stylua: ignore end
        },
        before = function()
            vim.o.autoread = true

            vim.g.opencode_opts = {
                providers = {
                    enabled = "tmux",
                    tmux = {},
                },
            }
        end,
    },
}
