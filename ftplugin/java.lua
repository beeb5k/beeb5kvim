vim.schedule(function()
    if vim.bo.filetype == "java" then
        require("LSPs.java_jdtls").setupJDTLS()
    end
end)
