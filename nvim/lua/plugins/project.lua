--Has a telescope plugin to swith between recent projects maybe use that?
return {
    "ahmedkhalf/project.nvim",
    main = "project_nvim",
    opts = {
        detection_methods = {"lsp"},
    },
}
