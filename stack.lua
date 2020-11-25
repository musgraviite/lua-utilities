-- NOTICE: @type accepts all lua types and "none" which means that the stack takes all types
local Stack = {}
Stack.__index = Stack
Stack.__newindex = function(t, k, v)
    if table.type == "none" then t[k] = v return end
    if not type(v) == table.type then
        return table.type .. " only table!"
    end
end

function Stack.new(type, ...)
    return setmetatable({stack = {...};type = type}, Stack)
end

function Stack:push(element)
    table.insert(self.stack, element)
end

function Stack:pop()
    return table.remove(self.stack, #self.stack)
end

function Stack:peek()
    return self.stack[#self.stack]
end

function Stack:peekLast()
    return self.stack[1]
end

function Stack:addAll(...)
    for _,element in ipairs({...}) do
        table.insert(self.stack, element)
    end
end

function Stack:toTable()
    return {table.unpack(self.stack)}
end

function Stack:contains(element)
    for i,v in ipairs(self.stack) do
        if v == element then
            return v, i, #self.stack - i
        end
    end
    return false
end

function Stack:remove(element)
    return table.remove(self.stack, element)
end

function Stack:removeElementAt(index)
    table.remove(self.stack, index)
end

function Stack:clear()
    for i = 1, #self.stack do self.stack[i] = nil end
end

function Stack:clone()
    return self.new(table.unpack(self.stack))
end

function Stack:capacity()
   return #self.stack 
end

function Stack:empty()
    return self.stack == {}
end

function Stack:setType(type)
    self.type = type
end
return Stack 