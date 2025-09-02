if nixCats("core.git") then
    return {
        {
            "vim-fugitive",
            for_cat = "git",
            event = "DeferredUIEnter",
            cmd = {
                "G",
                "Git",
                "Gdiffsplit",
                "Gvdiffsplit",
                "Gedit",
                "Gread",
                "Gwrite",
                "Ggrep",
                "GMove",
                "Glgrep",
                "GRename",
                "GDelete",
                "GRemove",
                "GBrowse",
                "DiffviewOpen",
                "DiffviewClose",
                "DiffviewToggleFiles",
                "DiffviewFocusFiles",
                "DiffviewRefresh",
                "DiffviewFileHistory",
            },
            load = function(name)
                require("lzextras").loaders.multi({
                    name,
                    "vim-rhubarb",
                })
            end,
        },
    }
end

return {}
