return {
    "redve-dev/neovim-git-reminder",
    dependencies = {
        'rcarriga/nvim-notify',
    },
    opts = {
        delay=5,
        required_changes=5,
        remind_on_save_only=true
    },
}
