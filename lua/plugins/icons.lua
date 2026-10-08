return {
  -- Disable LazyVim's devicons shim so the Material provider can load.
  { "nvim-mini/mini.icons", enabled = false },
  {
    "DaikyXendo/nvim-material-icon",
    name = "nvim-web-devicons",
    main = "nvim-web-devicons",
    lazy = true,
    opts = {
      color_icons = true,
      default = true,
    },
  },
}
