local helpers = {}

function helpers.merge(a, b)
  a = a or {}
  b = b or {}
  local res = {}
  for k, v in pairs(a) do
    res[k] = v
  end
  for k, v in pairs(b) do
    res[k] = v
  end
  return res
end

return helpers
