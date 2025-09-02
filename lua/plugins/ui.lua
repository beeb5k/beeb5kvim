if nixCats("ui") then
    return {
        {
            "mini.indentscope",
            for_cat = "ui",
            event = "DeferredUIEnter",
            after = function()
                require("mini.indentscope").setup()
            end,
        },
    }
end

return {}
