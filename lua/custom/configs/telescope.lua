-- see if the file exists
local function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

-- get all lines from a file, returns an empty 
-- list/table if the file does not exist
local function lines_from(file)
  if not file_exists(file) then return {} end
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

local options = {
  defaults = {
    prompt_prefix = "  ",
    file_ignore_patterns = lines_from("lua/custom/configs/file_ignore_patterns.txt"),
    layout_config = {
      scroll_speed = 1,
    },
    mappings = {
      i = {
        ["<C-j>"] = require("telescope.actions").preview_scrolling_down,
        ["<C-k>"] = require("telescope.actions").preview_scrolling_up
      },
    },
  }
}

return options
