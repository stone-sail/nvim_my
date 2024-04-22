local plain = not os.getenv('NERD_FONTS')

require'bufferline'.setup {
    options = {
        buffer_close_icon = plain and 'x' or nil,
        modified_icon = plain and '*' or nil,
        close_icon = plain and 'x' or nil,
        left_trunc_marker = plain and '<' or nil,
        right_trunc_marker = plain and '>' or nil,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left",
            },
        },
        close_command = function(bufnum)
            require('bufdelete').bufdelete(bufnum, true)
        end,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "("..count..")"
        end,
        sort_by = 'insert_after_current',
        custom_filter = function(buf_number, buf_numbers)
            -- filter out filetypes you don't want to see
            if vim.bo[buf_number].filetype == "qf" then
                return false
            end
            if vim.bo[buf_number].buftype == "terminal" then
                return false
            end
            if vim.bo[buf_number].buftype == "nofile" then
                return false
            end
            if vim.bo[buf_number].filetype == "Trouble" then
                return false
            end
            -- if string.find(vim.fn.bufname(buf_number), 'term://') == 1 then
            --     return false
            -- end
            return true
        end,
    }
}

vim.keymap.set({"v", "n"}, "g<Tab>", "<cmd>BufferLineTogglePin<CR>", { silent = true })
vim.keymap.set({"v", "n"}, "gb", "<cmd>BufferLineCyclePrev<CR>", { silent = true })
vim.keymap.set({"v", "n"}, "gt", "<cmd>BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set({"v", "n"}, "g<Space>", "<cmd>BufferLinePick<CR>", { silent = true })
vim.keymap.set({"v", "n"}, "g<BS>", "<cmd>bdelete<CR>", { silent = true })
-- vim.keymap.set({"v", "n"}, "go", "<cmd>blast<CR>", { silent = true })
-- vim.keymap.set({"v", "n"}, "gO", "<cmd>bfirst<CR>", { silent = true })
vim.keymap.set({"v", "n"}, "gB", "<cmd>BufferLineMovePrev<CR>", { silent = true })
vim.keymap.set({"v", "n"}, "gT", "<cmd>BufferLineMoveNext<CR>", { silent = true })
vim.keymap.set({"v", "n"}, "g<S-Tab>", "<cmd>BufferLineCloseOthers<CR>", { silent = true })
vim.keymap.set({"v", "n"}, "g<C-b>", "<cmd>BufferLineCloseLeft<CR>", { silent = true })
vim.keymap.set({"v", "n"}, "g<C-t>", "<cmd>BufferLineCloseRight<CR>", { silent = true })

vim.keymap.set({"v", "n", "i"}, "<F1>", "<cmd>BufferLineTogglePin<CR>", { silent = true })
vim.keymap.set({"v", "n", "i"}, "<F2>", "<cmd>BufferLineCyclePrev<CR>", { silent = true })
vim.keymap.set({"v", "n", "i"}, "<F3>", "<cmd>BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set({"v", "n", "i"}, "<F13>", "<cmd>BufferLinePickClose<CR>", { silent = true })
vim.keymap.set({"v", "n", "i"}, "<F14>", "<cmd>BufferLineMovePrev<CR>", { silent = true })
vim.keymap.set({"v", "n", "i"}, "<F15>", "<cmd>BufferLineMoveNext<CR>", { silent = true })
vim.keymap.set({"v", "n", "i"}, "<C-F13>", "<cmd>BufferLineCloseOthers<CR>", { silent = true })
vim.keymap.set({"v", "n", "i"}, "<C-F14>", "<cmd>BufferLineCloseLeft<CR>", { silent = true })
vim.keymap.set({"v", "n", "i"}, "<C-F15>", "<cmd>BufferLineCloseRight<CR>", { silent = true })

-- vim.cmd [[
-- aug buffer_accessed_time
--   au!
--   au BufEnter,BufWinEnter * let b:accessedtime = localtime()
-- aug END
--
-- function! BufferLineSortByMRU()
--   lua require'bufferline'.sort_buffers_by(function(a, b) return (vim.b[a.id].accessedtime or 0) > (vim.b[b.id].accessedtime or 0) end)
-- endfunction
--
-- command -nargs=0 BufferLineSortByMRU call BufferLineSortByMRU()
-- ]]


