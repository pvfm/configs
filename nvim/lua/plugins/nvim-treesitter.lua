return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",  -- carrega após abrir um buffer, não na startup
  }
}
