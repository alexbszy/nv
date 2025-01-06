local conf = {
    providers = {
        ollama = {
            disable = false,
            endpoint = "http://mini:11434/v1/chat/completions",
        },
        openai = { disable = true },
        azure = { disable = true },
        copilot = { disable = true },
        pplx = { disable = true },
        googleai = { disable = true },
        anthropic = { disable = true },
        lmstudio = { disable = true },
    },
    agents = {
        {
            name = "ChatOllamaLlama3.1-8B",
            disable = true,
        },
        {
            name = "CodeOllamaLlama3.1-8B",
            disable = true,
        },
        {
            name = "qwen2.5-coder",
            provider = "ollama",
            chat = false,
            command = true,
            model = {
                model = "qwen2.5-coder:7b",
                temperature = 0.7,
                top_p = 0.9,
                min_p = 0.1,
            },
            system_prompt = "You are an advanced AI coding assistant. Respond exclusively with code snippets without any explanations, comments, or additional information. Do not include any text outside the code block. Return only the code.",
        },
        {
            name = "Charli",
            provider = "ollama",
            chat = true,
            command = false,
            model = {
                model = "llama3.1:8b",
                temperature = 0.6,
                top_p = 1,
                min_p = 0.05,
            },
            system_prompt = "You are a general AI assistant.",
        },
    },
}

require("gp").setup(conf)

-- Normal mode mappings
vim.api.nvim_set_keymap("n", "<leader>m", "<cmd>GpChatToggle<cr>", { noremap = true, silent = true, desc = "Toggle Chat" })
vim.api.nvim_set_keymap("n", "<leader><cr>", "<cmd>GpChatRespond<cr>", { noremap = true, silent = true, desc = "Chat Response" })
vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>GpNextAgent<cr>", { noremap = true, silent = true, desc = "Next Agent" })
vim.api.nvim_set_keymap("n", "<leader>c", "<cmd>GpChatNew<cr>", { noremap = true, silent = true, desc = "New Chat" })
vim.api.nvim_set_keymap("n", "<leader>i", "<cmd>GpImplement<cr>", { noremap = true, silent = true, desc = "Chat Implement" })
vim.api.nvim_set_keymap("n", "<leader>O", "<cmd>GpPrepend<cr>", { noremap = true, silent = true, desc = "Chat Prepend" })
vim.api.nvim_set_keymap("n", "<leader>o", "<cmd>GpAppend<cr>", { noremap = true, silent = true, desc = "Chat Append" })

-- Visual mode mappings
vim.api.nvim_set_keymap("v", "<leader>r", ":'<,'>GpRewrite<cr>", { noremap = true, silent = true, desc = "Visual Rewrite" })
vim.api.nvim_set_keymap("v", "<leader>i", ":'<,'>GpImplement<cr>", { noremap = true, silent = true, desc = "Visual Implement" })
vim.api.nvim_set_keymap("v", "<leader>O", ":'<,'>GpPrepend<cr>", { noremap = true, silent = true, desc = "Visual Prepend" })
vim.api.nvim_set_keymap("v", "<leader>o", ":'<,'>GpAppend<cr>", { noremap = true, silent = true, desc = "Visual Append" })

