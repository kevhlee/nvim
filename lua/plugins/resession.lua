return {
    "stevearc/resession.nvim",
    config = function(_, opts)
        require("resession").setup(opts)

        require("resession").add_hook("post_load", function(name)
            vim.notify(
                'Loaded session "' .. name .. '"',
                vim.log.levels.INFO,
                { id = "resession" }
            )
        end)
    end,
    keys = {
        {
            "<Leader>ss",
            function()
                local name = require("resession").get_current()
                if name then
                    require("resession").save(name)
                else
                    vim.ui.input({ prompt = "Session name: " }, function(input)
                        if input then
                            require("resession").save(input)
                        end
                    end)
                end
            end,
            desc = "(Resession) Save a new session or overwrite the current one",
        },
        {
            "<Leader>sS",
            function()
                vim.ui.input({ prompt = "Session name: " }, function(input)
                    if not input then
                        return
                    end
                    require("resession").save(input)
                end)
            end,
            desc = "(Resession) Save a new session",
        },
        {
            "<Leader>sw",
            function()
                vim.ui.select(
                    require("resession").list(),
                    { prompt = "Overwrite session" },
                    function(choice)
                        if choice then
                            require("resession").save(choice)
                        end
                    end
                )
            end,
            desc = "(Resession) Overwrite a saved session",
        },
        {
            "<Leader>sl",
            function()
                require("resession").load()
            end,
            desc = "(Resession) Load a saved session",
        },
        {
            "<Leader>sd",
            function()
                require("resession").delete()
            end,
            desc = "(Resession) Delete a saved session",
        },
        {
            "<Leader>sD",
            function()
                vim.ui.select(
                    { "Yes", "No" },
                    { prompt = "Delete all sessions?" },
                    function(choice)
                        if not choice or choice == "No" then
                            return
                        end

                        for _, name in ipairs(require("resession").list()) do
                            require("resession").delete(name)
                        end
                    end
                )
            end,
            desc = "(Resession) Delete all saved sessions",
        },
    },
    opts = {
        load_order = "filename",
    },
}
