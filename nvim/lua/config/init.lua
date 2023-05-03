require("config.set")
require("config.remap")

local api = vim.api

api.nvim_create_autocmd({"BufNewFile","BufRead"},{pattern = {"*.cxxtest"}, command = "set syntax=cpp"})

api.nvim_create_autocmd({"BufWinEnter","BufEnter"}, {command = "if &buftype == 'terminal' | :startinsert | else | :stopinsert | endif"})

local function nvim_loaded_buffers()
  local result = {}
  local buffers = api.nvim_list_bufs()
  for _, buf in ipairs(buffers) do
      if api.nvim_buf_is_loaded(buf) then
         table.insert(result, buf)
      end
   end
   return result
end

function buf_kill(target_buf, should_force)
    if not should_force and vim.bo.modified then
        return api.nvim_err_writeln('Buffer is modified. Force required.')
    end
    local command = 'bd'
    if should_force then command = command..'!' end
    if target_buf == 0 or target_buf == nil then
        target_buf = api.nvim_get_current_buf()
    end
    local buffers = nvim_loaded_buffers()
    if #buffers == 1 then
        api.nvim_command(command)
        return
    end
    local nextbuf
    for i, buf in ipairs(buffers) do
        if buf == target_buf then
            nextbuf = buffers[(i - 1 + 1) % #buffers + 1]
            break
        end
    end
    api.nvim_set_current_buf(nextbuf)
    api.nvim_command(table.concat({command, target_buf}, ' '))
end

vim.keymap.set('n', '<leader>q', function() buf_kill(0) end)
