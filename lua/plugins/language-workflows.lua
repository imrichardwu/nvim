return {
  {
    "mrcjkb/rustaceanvim",
    opts = function(_, opts)
      opts.server = opts.server or {}
      opts.server.default_settings = opts.server.default_settings or {}
      opts.server.default_settings["rust-analyzer"] = vim.tbl_deep_extend(
        "force",
        opts.server.default_settings["rust-analyzer"] or {},
        {
          cargo = { buildScripts = { enable = true } },
          procMacro = { enable = true },
          autoImport = { enable = true },
          fullFunctionSignatures = { enable = true },
          hover = { actions = { enable = true, implementations = { enable = true } } },
          inlayHints = {
            genericParameterHints = { type = { enable = true } },
            typeHints = { enabled = true },
          },
        }
      )
      return opts
    end,
  },
}
