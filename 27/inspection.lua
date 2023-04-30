function viewBlock()
    local success, data = turtle.inspect()
 
    if success then
    --print(data.name)
    itemId = data.name
    print(itemId)
    return itemId
    --print(data.metadata)
    end
end
 
--viewBlock()