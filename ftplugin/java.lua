vim.schedule(function()
	if vim.bo.filetype == "java" then
		require("LSPs.jdtls").setupJDTLS()
	end
end)
