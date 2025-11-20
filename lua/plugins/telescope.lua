-- Build telescope-fzf-native.nvim on install/update
local function telescope_fzf_native_hooks(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind

    if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
        vim.notify("Building telescope-fzf-native.nvim (make)...", vim.log.levels.INFO)

        vim.system({ "make" }, { cwd = ev.data.path }, function(obj)
            -- vim.system callback is async: hop back to main loop for notifications
            vim.schedule(function()
                if obj.code == 0 then
                    vim.notify("telescope-fzf-native.nvim built successfully", vim.log.levels.INFO)
                else
                    local err = (obj.stderr or "unknown error"):gsub("%s+$", "")
                    vim.notify("telescope-fzf-native.nvim build failed: " .. err, vim.log.levels.ERROR)
                end
            end)
        end)
    end
end

vim.api.nvim_create_autocmd("PackChanged", {
    desc = "Build telescope-fzf-native.nvim on install/update",
    group = vim.api.nvim_create_augroup(
        "telescope-fzf-native-pack-changed-build-handler",
        { clear = true }
    ),
    callback = telescope_fzf_native_hooks,
})

-- Add packages
vim.pack.add({
    -- Telescope deps
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",

    -- Native FZF sorter (needs `make`)
    {
        src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
        version = "main",
    },
})

-- borrowed from https://github.com/LunarVim/Neovim-from-scratch
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require "telescope.actions"

telescope.setup {
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },

        mappings = {
            i = {
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,

                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<C-c>"] = actions.close,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
            },
            n = {
                ["<esc>"] = actions.close,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["?"] = actions.which_key,
            }
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('fzf')

-- local nnoremap = function(lhs, rhs)
--     return vim.api.nvim_set_keymap('n', lhs, rhs,
--         { noremap = true, silent = false })
-- end
-- nnoremap('<leader>ff', ':lua require("telescope.builtin").find_files()<cr>')
-- nnoremap('<leader>fg', ':lua require("telescope.builtin").live_grep()<cr>')
-- nnoremap('<leader>fb', ':lua require("telescope.builtin").buffers()<cr>')
-- nnoremap('<leader>fh', ':lua require("telescope.builtin").help_tags()<cr>')
