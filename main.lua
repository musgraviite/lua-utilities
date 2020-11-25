local Stack = require("stack")
local stack = Stack.new("aight")
stack:push("Chicken", "Boiass")
for i,value in ipairs(stack) do
    print(i, value)
end
stack:pop()
for i,value in ipairs(stack) do
    print(i, value)
end