return {
    url = "https://github.com/nvim-tree/nvim-web-devicons",
    opts = {
        override_by_extension = {
            ["lua"] = {
                icon = "󰢱",
                color = "#0adff2",
                name="LuaFile"
            }
        },
        override_by_filename = {
            [".gitignore"] = {
                icon = "",
                color = "#f20a0a",
                name = "gitignore"
            }
        }
    }
}
