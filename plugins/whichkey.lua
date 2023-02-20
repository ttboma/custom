local wk = require("which-key")

wk.register({
  ["<leader>t"] = { name = "+Nvterm" },
})
wk.register({
  ["<leader>l"] = { name = "+LSP" },
})
wk.register({
  ["<leader>w"] = { name = "+Wiki" },
})
wk.register({
  ["<leader>f"] = { name = "+Telescope" },
  ["<leader>fg"] = { name = "+Git" },
})
wk.register({
  ["<leader>k"] = { name = "+Key" },
})
wk.register({
  ["<leader>d"] = { name = "+Diagonis" },
})
wk.register({
  ["<leader>v"] = { name = "+Vista" },
})
