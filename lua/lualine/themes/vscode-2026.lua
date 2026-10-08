local theme = {}
for mode, accent in pairs({
  normal = "#3994BC",
  insert = "#7ee787",
  visual = "#d2a8ff",
  replace = "#ff7b72",
  command = "#ffa657",
  terminal = "#79c0ff",
}) do
  theme[mode] = {
    a = { fg = "#121314", bg = accent, gui = "bold" },
    b = { fg = "#bfbfbf", bg = "#242526" },
    c = { fg = "#8C8C8C", bg = "#191A1B" },
  }
end
theme.inactive = {
  a = { fg = "#8C8C8C", bg = "#121314" },
  b = { fg = "#8C8C8C", bg = "#121314" },
  c = { fg = "#8C8C8C", bg = "#121314" },
}
return theme
