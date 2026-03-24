-- metta.lua
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.metta = {
  install_info = {
    url = "https://github.com/rTreutlein/tree-sitter-metta",
    branch = "main",
    files = {"src/parser.c"},
    generate_requires_npm = false,
    requires_generate_from_grammar = false,
    -- DO NOT set branch or revision for local files
  },
  filetype = "metta",
}
