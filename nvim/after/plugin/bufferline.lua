local dia_ind = function(count, level, dict, context)
  local s = " "
  for e, n in pairs(dict) do
    local sym = e == "error" and " "
        or (e == "warning" and " " or "" )
    s = s .. n .. sym
  end
  return s
end

require("bufferline").setup{
    options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = dia_ind,
        tab_size = 20,
    }
}


