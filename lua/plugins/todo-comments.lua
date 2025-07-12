return {
  "folke/todo-comments.nvim",
  cmd = { "TodoTrouble", "TodoFzfLua" },
  event = { "BufReadPre", "BufNewFile" },
  config = true,
    -- stylua: ignore
  keys = {
    { "<leader>xt", "<cmd>TodoFzfLua<cr>", desc = "Todo" },
    { "<leader>xT", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
    { "<leader>xf", "<cmd>TodoFzfLua keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
    { "<leader>xF", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment", },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment", },
  },
}
