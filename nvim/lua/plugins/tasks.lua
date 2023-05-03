return {
    'Shatur/neovim-tasks',
    cmd = "Task",
    opts = {
        default_params = {
            cmake = {
                build_dir = "Build/Intermediate/Shore300_Linux_x64_gcc9_ModelTrainer",
                args = {
                    build = { "-j8" },
                },
            }
        }
    },
    keys = {
        { "<leader>m" , ":Task start cmake build<CR>" , mode = "n" }
    }
}
