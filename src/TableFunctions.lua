--Remove! Is not used!

local M = {}

function tablelength(T)
  local count = 0
  for _ in pairs(T) do 
    count = count + 1 
  end
  return count
end


M.tablelength = tablelength

return M