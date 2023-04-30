--list = {5,4,3,2}
--print(list)
--print(list[0])
--print(list[1])
--print(#list)
--table.remove(list, 2)

function print_list(list)
    for key, value in pairs(list) do
        print(key, value)
    end
end

function print_llist(llist)
    for key, value in pairs(llist) do
        print_list(value)
    end
end
--print_list(list)

function argmax(list)
    max_i = 1
    max_v = list[1]
    for i = 1, #list do
        if (list[i] > max_v) then
            max_i = i
            max_v = list[i]
        end
    end
    return max_i
end

function argmin(list)
    min_i = 1
    min_v = list[1]
    for i = 1, #list do
        print(i, list[i])
        if (list[i] < min_v) then
            min_i = i
            min_v = list[i]
        end
    end
    return min_i
end

function argmin_elem(list, m)
    min_i = 1
    min_v = list[1]
    for i = 1, #list do
        if (list[i][m] < min_v[m]) then
            min_i = i
            min_v = list[i]
        end
    end
    return min_i, min_v
end

function argmin_sort_elem(block_list, m)
    sort = {}
    n = #block_list
    for i = 1, n do
        local min_i, min_v = argmin_elem(block_list,m)
        print("value is", min_v[1])
        sort[i] = min_v
        table.remove(block_list, min_i)
        
    end
    return sort
end

--print("min arg: ", argmin(list))
--data_list = {{"a",2},{"b", 1},{"c",0}}
--print("")
--print_llist(argmin_sort_elem(data_list, 2))
