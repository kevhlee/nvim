return {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
        local dap = require("dap")

        for key, adapter in pairs(opts.adapters or {}) do
            dap.adapters[key] = adapter
        end

        for key, configuration in pairs(opts.configurations or {}) do
            dap.configurations[key] = configuration
        end

        vim.fn.sign_define(
            "DapBreakpoint",
            { text = "•", texthl = "Error", linehl = "", numhl = "" }
        )
        vim.fn.sign_define(
            "DapBreakpointCondition",
            { text = "?", texthl = "Error", linehl = "", numhl = "" }
        )
        vim.fn.sign_define(
            "DapLogPoint",
            { text = "•", texthl = "Insert", linehl = "", numhl = "" }
        )
        vim.fn.sign_define(
            "DapBreakpointRejected",
            { text = "x", texthl = "", linehl = "", numhl = "" }
        )

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "dap-repl",
            callback = function(_)
                require("dap.ext.autocompl").attach()
            end,
        })
    end,
    dependencies = {
        { "nvim-neotest/nvim-nio" },
        {
            "rcarriga/nvim-dap-ui",
            opts = {
                controls = {
                    enabled = false,
                },
                expand_lines = true,
                floating = {
                    border = "single",
                    mappings = {
                        close = { "q", "<Esc>" },
                    },
                },
                force_buffers = true,
                layouts = {
                    {
                        elements = {
                            {
                                id = "scopes",
                                size = 0.33,
                            },
                            {
                                id = "stacks",
                                size = 0.33,
                            },
                            {
                                id = "breakpoints",
                                size = 0.33,
                            },
                        },
                        position = "left",
                        size = 0.25,
                    },
                    {
                        elements = {
                            {
                                id = "repl",
                                size = 0.5,
                            },
                            {
                                id = "console",
                                size = 0.5,
                            },
                        },
                        position = "bottom",
                        size = 0.25,
                    },
                },
                mappings = {
                    edit = "e",
                    expand = "<CR>",
                    open = "o",
                    remove = "d",
                    repl = "r",
                    toggle = "t",
                },
                render = {
                    indent = 1,
                    max_value_lines = 100,
                },
            },
        },
    },
    keys = {
        {
            "<F1>",
            "<Cmd>DapToggleBreakpoint<CR>",
            desc = "(DAP) Toggle breakpoint",
        },
        {
            "<F2>",
            function()
                vim.ui.input({ prompt = "Breakpoint condition: " }, function(input)
                    if not input then
                        return
                    end
                    require("dap").set_breakpoint(input)
                end)
            end,
            desc = "(DAP) Set breakpoint with condition",
        },
        {
            "<F3>",
            function()
                require("dap").list_breakpoints()

                vim.notify("Saved breakpoints to quickfix list", vim.log.levels.INFO, {
                    id = "nvim-dap",
                    title = "DAP",
                })
            end,
            desc = "(DAP) Toggle breakpoint",
        },
        {
            "<F4>",
            function()
                vim.ui.select(
                    { "Yes", "No" },
                    { prompt = "Delete all breakpoints?" },
                    function(choice)
                        if not choice or choice == "No" then
                            return
                        end

                        require("dap").clear_breakpoints()

                        vim.notify("Deleted all breakpoints", vim.log.levels.INFO, {
                            id = "nvim-dap",
                            title = "DAP",
                        })
                    end
                )
            end,
            desc = "(DAP) Toggle breakpoint",
        },
        {
            "<F5>",
            "<Cmd>DapContinue<CR>",
            desc = "(DAP) Continue executing a paused session or start a new one",
        },
        {
            "<F6>",
            function()
                require("dapui").toggle()
            end,
            desc = "(DAP) Toggle DAP UI",
        },
        {
            "<F7>",
            "<Cmd>DapStepOver<CR>",
            desc = "(DAP) Step over the current line",
        },
        {
            "<F8>",
            "<Cmd>DapStepInto<CR>",
            desc = "(DAP) Step into current expression",
        },
        {
            "<F9>",
            "<Cmd>DapStepOut<CR>",
            desc = "(DAP) Step out of current scope",
        },
    },
}
