if nixCats("theme") then
    require("config")
    vim.cmd([[colorscheme kanagawa]])
end
require("lze").load({ { import = "plugins" } })
