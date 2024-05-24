return {
	"robitx/gp.nvim",
	config = function()
        local conf = {
            openai_api_key = "iamakey",
            openai_api_endpoint = "http://spc:11434/v1/chat/completions",
            agents = {
                {
                    name = "LLama3Chat",
                    chat = true,
                    command = false,
                    -- string with model name or table with model name and parameters 
                    model = { model = "llama3", temperature = 1.1, top_p = 1 },
                    -- system prompt (use this to specify the persona/role of the AI) 
                    system_prompt = "You are a general AI assistant.\n\n"
                        .. "The user provided the additional info about how they would like you to respond:\n\n"
                        .. "- If you're unsure don't guess and say you don't know instead.\n"
                        .. "- Ask question if you need clarification to provide better answer.\n"
                        .. "- Think deeply and carefully from first principles step by step.\n"
                        .. "- Zoom out first to see the big picture and then zoom in to details.\n"
                        .. "- Use Socratic method to improve your thinking and coding skills.\n"
                        .. "- Don't elide any code from your output if the answer requires coding.\n"
                        .. "- Take a deep breath; You've got this!\n",
                },
                {
                    name = "LLama3Code",
                    chat = false,
                    command = true,
                    -- string with model name or table with model name and parameters 
                    model = { model = "llama3", temperature = 0.8, top_p = 1 },
                    -- system prompt (use this to specify the persona/role of the AI) 
                    system_prompt = "You are an AI working as a code editor.\n\n"
                        .. "Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n"
                        .. "START AND END YOUR ANSWER WITH:\n\n```",
                },
                {name = "ChatGPT4"},
                {name = "ChatGPT3-5"},
                {name = "CodeGPT4"},
                {name = "CodeGPT3-5"},
            }
        }
        require("gp").setup(conf)

            -- shortcuts might be setup here (see Usage > Shortcuts in Readme)
    end,
}
