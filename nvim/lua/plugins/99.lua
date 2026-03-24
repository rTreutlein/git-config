return {
    "ThePrimeagen/99",
    keys = {
        { "9s", function() require("99").search() end, mode = "n", desc = "99 search" },
        { "9o", function() require("99").open() end, mode = "n", desc = "99 open last result" },
        { "9x", function() require("99").stop_all_requests() end, mode = "n", desc = "99 stop requests" },
        { "9m", function() require("99.extensions.fzf_lua").select_model() end, mode = "n", desc = "99 select model" },
        { "9p", function() require("99.extensions.fzf_lua").select_provider() end, mode = "n", desc = "99 select provider" },
        { "9v", function() require("99").visual() end, mode = "v", desc = "99 rewrite selection" },
    },
    config = function()
        local _99 = require("99")

        local provider = nil
        local model = nil
        if vim.fn.executable("opencode") == 1 then
            provider = _99.Providers.OpenCodeProvider
            model = "openai/gpt-5.3-codex"
        elseif vim.fn.executable("claude") == 1 then
            provider = _99.Providers.ClaudeCodeProvider
        end

        _99.setup({
            provider = provider,
            model = model,
            md_files = { "AGENTS.md", "AGENT.md" },
            completion = {
                source = "native",
            },
        })
    end,
}
