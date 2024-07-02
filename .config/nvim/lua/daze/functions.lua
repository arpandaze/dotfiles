local M = {}

function M.CloseBuffer()
    local curBuf = vim.fn.bufnr("%")
    local curTab = vim.fn.tabpagenr()
    vim.cmd("bnext")

    -- If in last buffer, create empty buffer
    if curBuf == vim.fn.bufnr("%") then
        vim.cmd("enew")
    end

    -- Loop through tabs
    for i = 1, vim.fn.tabpagenr("$") do
        -- Go to tab (is there a way with inactive tabs?)
        vim.cmd("tabnext " .. i)
        -- Store active window nr to restore later
        local curWin = vim.fn.winnr()
        -- Loop through windows pointing to buffer
        local winnr = vim.fn.bufwinnr(curBuf)
        while winnr >= 0 do
            -- Go to window and switch to next buffer
            vim.cmd(winnr .. "wincmd w | bnext")
            -- Restore active window
            vim.cmd(curWin .. "wincmd w")
            winnr = vim.fn.bufwinnr(curBuf)
        end
    end

    -- Close buffer, restore active tab
    vim.cmd("bd " .. curBuf)
    vim.cmd("tabnext " .. curTab)
end

function M.GitHunks()
    require("telescope.pickers")
        .new({
            finder = require("telescope.finders").new_oneshot_job({ "git", "jump", "--stdout", "diff" }, {
                entry_maker = function(line)
                    local filename, lnum_string = line:match("([^:]+):(%d+).*")

                    -- I couldn't find a way to use grep in new_oneshot_job so we have to filter here.
                    -- return nil if filename is /dev/null because this means the file was deleted.
                    if filename:match("^/dev/null") then
                        return nil
                    end

                    return {
                        value = filename,
                        display = line,
                        ordinal = line,
                        filename = filename,
                        lnum = tonumber(lnum_string),
                    }
                end,
            }),
            sorter = require("telescope.sorters").get_generic_fuzzy_sorter(),
            previewer = require("telescope.config").values.grep_previewer({}),
            results_title = "Git hunks",
            prompt_title = "Git hunks",
            layout_strategy = "flex",
        }, {})
        :find()
end

return M
