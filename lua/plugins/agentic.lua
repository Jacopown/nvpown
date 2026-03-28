-- ciao
return {
  "carlos-algms/agentic.nvim",

  opts = {
    -- Any ACP-compatible provider works. Built-in: "claude-agent-acp" | "gemini-acp" | "codex-acp" | "opencode-acp" | "cursor-acp" | "copilot-acp" | "auggie-acp" | "mistral-vibe-acp" | "cline-acp" | "goose-acp"
    provider = "gemini-acp",
  },

  keys = {
    {
      "<leader>aa",
      function() require("agentic").toggle() end,
      mode = { "n" },
      desc = "Toggle Agentic Chat"
    },
    {
      "<leader>ac",
      function() require("agentic").add_selection_or_file_to_context() end,
      mode = { "n", "v" },
      desc = "Add file/selection to Agentic context"
    },
    {
      "<leader>an",
      function() require("agentic").new_session() end,
      mode = { "n" },
      desc = "New Agentic Session"
    },
    {
      "<leader>ar",
      function()
          require("agentic").restore_session()
      end,
      desc = "Restore Agentic session",
      silent = true,
      mode = { "n" },
    },
    {
      "<leader>ax",
      function()
          require("agentic").stop_generation()
      end,
      desc = "Stop Agentic generation",
      silent = true,
      mode = { "n" },
    },
    {
      "<leader>ad",
      function()
          require("agentic").add_current_line_diagnostics()
      end,
      desc = "Add current line diagnostic to Agentic",
      mode = { "n" },
    },
    {
      "<leader>aD",
      function()
          require("agentic").add_buffer_diagnostics()
      end,
      desc = "Add all buffer diagnostics to Agentic",
      mode = { "n" },
    },
  },
}
