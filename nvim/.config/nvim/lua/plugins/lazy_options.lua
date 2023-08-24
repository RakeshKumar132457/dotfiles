local CONSTANTS = require('utils.constants')

local options = {
    -- Directory where plugins will be installed.
    root = vim.fn.stdpath("data") .. "/lazy",


    -- Default settings for plugins.
    defaults = {
        lazy = true,   -- Should plugins be lazy-loaded?
        version = "*", -- Try installing the latest stable versions of plugins.
    },

    -- Lockfile generated after running update.
    lockfile = CONSTANTS.PATHS.HOME_CONFIG .. "/lazy-lock.json",

    -- Limit the maximum amount of concurrent tasks.
    concurrency = 100,

    -- Git related configurations.
    git = {
        -- Show commits from the last 3 days.
        log = { "--since=3 days ago" },
        -- Kill processes that take more than 2 minutes.
        timeout = 120,
        -- Format for the git URL.
        url_format = "https://github.com/%s.git",
    },

    -- Plugin installation settings.
    install = {
        -- Install missing plugins on startup.
        missing = true,
        -- Colorscheme to use during installation.
        colorscheme = { "habamax" },
    },

    -- UI related configurations.
    ui = {
        -- Dimensions for the UI window.
        size = { width = 0.85, height = 0.85 },
        -- Border style for the UI window.
        border = "rounded",
        -- Icons used in the UI.
        icons = {
            -- ... (Your icons here)
        },
        -- Browser to open links. Nil will auto-select based on OS.
        browser = nil,
        -- Frequency for UI render events.
        throttle = 20,
        -- Custom key mappings.
        custom_keys = {
            -- ... (Your custom keys here)
        },
    },

    -- Command for showing diffs.
    diff = { cmd = "git" },

    -- Plugin update checker settings.
    checker = {
        -- Enable automatic checking for plugin updates.
        enabled = false,
        -- Notify when new updates are found.
        notify = true,
        -- Check for updates every hour.
        frequency = 3600,
    },

    -- Config file change detection settings.
    change_detection = {
        -- Enable automatic checking for config file changes.
        enabled = true,
        -- Notify when changes are detected.
        notify = true,
    },

    -- Performance related configurations.
    performance = {
        -- Cache settings.
        cache = {
            -- Enable caching.
            enabled = true,
            -- Path for the cache.
            path = CONSTANTS.PATHS.HOME_CONFIG .. "/lazy/cache",
            -- Events to disable caching.
            disable_events = { "UIEnter", "BufReadPre" },
            -- Time to live for unused modules.
            ttl = 3600 * 24 * 5,
        },
        -- Reset the package path to improve startup time.
        reset_packpath = true,
        -- Runtime path settings.
        rtp = {
            -- Reset the runtime path.
            reset = true,
            -- Custom paths to include in the runtime path.
            paths = {},
            -- List of plugins to disable.
            disabled_plugins = {
                -- ... (Your disabled plugins here)
            },
        },
    },

    -- Settings for generating helptags from markdown readme files.
    readme = {
        -- Root directory for readme files.
        root = CONSTANTS.PATHS.HOME_CONFIG .. "/lazy/readme",
        -- List of files to generate helptags from.
        files = { "README.md", "lua/**/README.md" },
        -- Skip generating markdown helptags for plugins that have docs.
        skip_if_doc_exists = true,
    },
}

return options
