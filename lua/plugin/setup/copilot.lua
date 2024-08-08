require('copilot').setup({
    filetypes = {
        ["."] = true,
    },
    suggestion = {
        auto_trigger = true,
        keymap = {
            accept = "<C-C>",
        }
    }
})
