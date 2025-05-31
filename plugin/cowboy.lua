---@brief
---
--- "Cowboy mode" to prevent repeating/holding key presses and to force better
--- cursor movements.
---
--- Based on folke's "cowboy mode" key mappings.
---
--- Reference:
---   https://github.com/folke/dot/blob/56d310467f3f962e506810b710a1562cee03b75e/nvim/lua/util/init.lua#L20-L51

local cowboy_mode = true
local cowboy_limit = 10
local cowboy_keymaps = {
    { key = "h", mode = "n" },
    { key = "j", mode = "n" },
    { key = "k", mode = "n" },
    { key = "j", mode = "n" },
    { key = "w", mode = "n" },
    { key = "W", mode = "n" },
    { key = "e", mode = "n" },
    { key = "E", mode = "n" },
    { key = "ge", mode = "n" },
    { key = "gE", mode = "n" },
    { key = "b", mode = "n" },
    { key = "B", mode = "n" },
    { key = "x", mode = "n" },
    { key = "<Left>", mode = "n" },
    { key = "<Right>", mode = "n" },
    { key = "<Up>", mode = "n" },
    { key = "<Down>", mode = "n" },
    { key = "<Enter>", mode = "i" },
}

vim.keymap.set("n", "<Leader>tc", function()
    cowboy_mode = not cowboy_mode

    if cowboy_mode then
        vim.notify(
            "🤠 Cowboy mode: ON",
            vim.log.levels.INFO,
            { id = "🤠", title = "Cowboy" }
        )
    else
        vim.notify(
            "🤠 Cowboy mode: OFF",
            vim.log.levels.INFO,
            { id = "🤠", title = "Cowboy" }
        )
    end
end)

for _, keymap in ipairs(cowboy_keymaps) do
    local count = 0
    local timer = assert(vim.uv.new_timer())

    local reset = function()
        count = 0
    end

    vim.keymap.set(keymap.mode, keymap.key, function()
        if not cowboy_mode or vim.v.count > 0 then
            reset()
        end

        if count >= cowboy_limit and vim.bo.buftype ~= "nofile" then
            vim.notify(
                "🤠 Hold it, cowboy!",
                vim.log.levels.WARN,
                { id = "🤠", title = "Cowboy" }
            )
        else
            count = count + 1
            timer:start(3000, 0, reset)
            return keymap.key
        end
    end, { expr = true, silent = true })
end
