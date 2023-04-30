s = peripheral.find("geoScanner")
os.loadAPI("easy_string.lua")
os.loadAPI("easy_sort.lua")
os.loadAPI("move.lua")
get_block_name = easy_string.get_block_name

function scan()
    print(s.cost(8))
    data, reason = s.scan(8)
    return data
end

function get_count(item, data)
    local total = 0
    if (not(data == nil)) then
        for key, block in pairs(data) do
            if (get_block_name(block.name) == item) then
                total = total + 1
            end
        end
    end
    --print(item, " count: ", total)
    return total
end

function block_dist(block)
    return (block.x^2 + block.y^2 + block.z^2)^(1/2) 
end

function read_data(item, data)
    block_list = {}
    if (not (data == nil)) then
        for key, block in pairs(data) do
            if (get_block_name(block.name) == item) then
               -- print(item, " at: ", block.x, block.y, block.z)                --print(j,k)
                result = {block, block_dist(block)}
                table.insert(block_list, result)
            end
        end
    end
    easy_sort.print_list(block_list)
    return block_list
end 

function go_to_block(block, curr_pos)
    if (not (block == nil)) then
        
        cx = curr_pos[1]
        cy = curr_pos[2]
        cz = curr_pos[3]
        
        print("curr pos is: ", cx, cy, cz)
        print("block is at: ", block.x, block.y, block.z)
        print("going to: ", block.x-cx, block.y-cy, block.z-cz)
    
        local x = move.right(block.x - cx)
        local z = move.back(block.z - cz)
        
        -- bedrock rejection
        local y = move.up(block.y - cy)
        print("moved by: ", x, y, z)
        
        --return {cx + x, cy+y, cz+z}
        return {block.x, block.y, block.z}
        --move.up(-block.y)
        --move.back(-block.z)
        --move.right(-block.x)
    else
        print("no coords")
    end
end

function print_block(block)
    print(block.name, " at x: ", block.x, " y: ", block.y, " z: ", block.z)
end

function make_2d_arr(r,c)
    grid = {}
    for i = 1, r do
        grid[i] = {}
        for j = 1, c do
            grid[i][j] = 0
        end
    end
    return grid
end

function print_block_list(block_list)
--function read_chunk_analyze()
    im = make_2d_arr(16+1, 16+1)
--    im = add_axis(im, 16+1. 16+1)
    local x
    local z
    for i = 1, #block_list do
        print(block_list[i][1].x)
        x = block_list[i][1].x
        z = block_list[i][1].z
        im[z+9][x+9] = im[z+9][x+9] + 1
    end    

    --fostr = ""

    for i = 1, #im do
        str = ""
        for j = 1, #im[1] do
            if (im[i][j] == 0) then
                str = str.." "
            else
                str = str.."#"
            end
        end
        print(str)
        os.sleep(0.20)
        --str = str.."\n"
    end
    print(str)
end

ore_list = {"emerald_ore",
            "deepslate_emerald_ore",
            "diamond_ore",
            "deepslate_diamond_ore",
            "gold_ore",
            "deepslate_goal_ore",
            "iron_ore",
            "deepslate_iron_ore",
            "coal_ore",
            "deepslate_coal_ore",
            "ancient_debris"}

data = scan()
print("")

for i = 1, #ore_list do
    count = get_count(ore_list[i], data)
    
    if (count > 0) then
        print(i, ": ", ore_list[i], "count: ", count)
    end
end
print("Which ore?")
local name = ore_list[tonumber(io.read())]
if (name == none) then
    return
end
local block_list = read_data(name, data)
print_block_list(block_list)

local ind, closest_block = easy_sort.argmin_elem(block_list, 2)

local sorted_block_list = easy_sort.argmin_sort_elem(block_list, 2)

--local closest_block = easy_sort.argmin_elem(block_list, 2)

if (sorted_block_list == nil) then
    print("no",name,"nearby")
else
    easy_sort.print_llist(sorted_block_list)
    
    print_block(sorted_block_list[1][1])
    
    print_block(closest_block[1])
    print("go to block? 1 yes, 0 no")
    local go = io.read()
    curr_pos = {0,0,0}
    if (go == "1") then
        for i=1, #sorted_block_list do
            curr_pos = go_to_block(sorted_block_list[i][1], curr_pos)
        end
        home = {}
        home.x = 0
        home.y = 0
        home.z = 0
        go_to_block(home, curr_pos)
    end
end
    
print("done")

--print(textutils.serialize(s.chunkAnalyze()))
