require("lze").register_handlers(require("nixCatsUtils.lzUtils").for_cat)

require("config")
require("lze").load({ { import = "plugins" } })
