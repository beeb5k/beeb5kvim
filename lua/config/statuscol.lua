function _G.MyStatusCol()
    local lnum = vim.v.lnum
    local curr = vim.fn.line(".")
    local relnum = vim.wo.relativenumber and math.abs(curr - lnum) or lnum
    if curr == lnum and vim.wo.number then
        relnum = lnum
    end

    local foldchar = " "
    local foldlevel = vim.fn.foldlevel(lnum)
    local foldclosed = vim.fn.foldclosed(lnum)
    local foldlevel_before = vim.fn.foldlevel(lnum - 1)
    local foldlevel_after = vim.fn.foldlevel(lnum + 1)

    if foldlevel == 0 then
        foldchar = " "
    elseif foldclosed ~= -1 and foldclosed == lnum then
        foldchar = "⏵" -- closed fold
    elseif foldlevel > foldlevel_before then
        foldchar = "╭"  -- fold start
    elseif foldlevel > foldlevel_after then
        foldchar = "╰" -- fold end
    else
        foldchar = "│" -- middle fold
    end

    -- No extra highlights at all
    return string.format(" %3s %s ", relnum, foldchar)
end

