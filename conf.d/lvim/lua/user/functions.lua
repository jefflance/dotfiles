--[[--
File              : conf.d/lvim/lua/user/functions.lua
Author            : Jeff Lance <email@jefflance.me>
Date              : 28.12.2023 20:13:31
Last Modified Date: 28.12.2023 20:13:31
Last Modified By  : Jeff Lance <email@jefflance.me>
--]]--



local M = {}

--- Get current buffer size
---@return {width: number, height: number}
local function get_buf_size()
  local cbuf = vim.api.nvim_get_current_buf()
  local bufinfo = vim.tbl_filter(function(buf)
    return buf.bufnr == cbuf
  end, vim.fn.getwininfo(vim.api.nvim_get_current_win()))[1]
  if bufinfo == nil then
    return { width = -1, height = -1 }
  end
  return { width = bufinfo.width, height = bufinfo.height }
end

--- Get the dynamic terminal size in cells
---@param direction string
---@param size number
---@return integer
local function get_dynamic_terminal_size(direction, size)
  size = size or lvim.builtin.terminal.size
  if direction ~= "float" and tostring(size):find(".", 1, true) then
    size = math.min(size, 1.0)
    local buf_sizes = get_buf_size()
    local buf_size = direction == "horizontal" and buf_sizes.height or buf_sizes.width
    return buf_size * size
  else
    return size
  end
end

M.xplr_toggle = function()
  local Terminal = require("toggleterm.terminal").Terminal
  local direction = "float"

  local xplr = Terminal:new {
    cmd = "xplr",
    hidden = true,
    direction = direction,
    -- size = 20 | function()
    --   return get_dynamic_terminal_size("float", 0.8)
    -- end,
    float_opts = {
      border = "curved",
    },
    on_open = function(_)
      vim.cmd "startinsert!"
    end,
    on_close = function(_) end,
    count = 200,
  }
  xplr:toggle()
end

return M

