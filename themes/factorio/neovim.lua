return {
    {
        "bjarneo/aether.nvim",
        name = "aether",
        priority = 1000,
        opts = {
            disable_italics = false,
            colors = {
                -- Monotone shades (base00-base07)
                base00 = "#13120F", -- Default background
                base01 = "#8b877c", -- Lighter background (status bars)
                base02 = "#13120F", -- Selection background
                base03 = "#8b877c", -- Comments, invisibles
                base04 = "#E7E6E1", -- Dark foreground
                base05 = "#ffffff", -- Default foreground
                base06 = "#ffffff", -- Light foreground
                base07 = "#E7E6E1", -- Light background

                -- Accent colors (base08-base0F)
                base08 = "#e9803e", -- Variables, errors, red
                base09 = "#f7b58c", -- Integers, constants, orange
                base0A = "#b9c581", -- Classes, types, yellow
                base0B = "#9ca98e", -- Strings, green
                base0C = "#bac1b3", -- Support, regex, cyan
                base0D = "#abaaac", -- Functions, keywords, blue
                base0E = "#b3b2b3", -- Keywords, storage, magenta
                base0F = "#dde4be", -- Deprecated, brown/yellow
            },
        },
        config = function(_, opts)
            require("aether").setup(opts)
            vim.cmd.colorscheme("aether")

            -- Enable hot reload
            require("aether.hotreload").setup()
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "aether",
        },
    },
}
