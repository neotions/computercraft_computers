function find_obj(name)
    -- use to find objects immediately
    -- surrounding the turtle
    -- must pass in string of
    -- object exactly    
    -- e.g. find_obj("minecraft:chest")
    
    local dir = -1
    for i=0,3 do 
                
        local succ, data = turtle.inspect()
        if (name == data.name) then
            print("Found: ", name, " at ", i)
            dir = i
        end
        turtle.turnRight()
    end
    -- return -1 if no chest
    return dir
end

function find_obj_inv(name)
    -- store the current pos of the
    -- inventory selected pos
    local orig_inv_pos = turtle.getSelectedSlot()
    
    local obj_pos = -1
    for i=1,16 do
        turtle.select(i)
        obj,_,__ = turtle.getItemDetail(i)
        
        if (not (obj == nil)) then
            print(obj.name)
            if (obj.name == name) then
                obj_pos = i
                turtle.select(orig_inv_pos)
                return i
            end
        end
    end
    
    -- put the inventory pos back
    -- to where it was before
    turtle.select(orig_inv_pos)
    return -1
end

function chop_tree()
    -- move forward, dig straight
    -- up. move back down and return
    -- home. Does not work with 
    -- large oak tree.  Use only with
    -- 1 block width straight up
    -- trees
    succ, data = turtle.inspect()
    
    if (data.name == "minecraft:spruce_log") then
        turtle.dig()
        print(turtle.forward())
        local max_height = 0
        while(turtle.detectUp()) do 
            turtle.digUp()
            turtle.up()
            max_height = max_height + 1
        end 
    
        for i=0, max_height do
            turtle.down()
        end
        turtle.back()
    end
end

function is_coal(name)
    -- checks if item is coal
    -- or charcoal
    if (name == "minecraft:coal" or
        name == "minecraft:charcoal") then
        return true
    else 
        return false
    end
end

function aggr_refuel(set_point)
    -- function to attempt to
    -- refuel using any coal or 
    -- charcoal in the 
    -- inventory up to a set point
    local inv_pos = turtle.getSelectedSlot()
    
    local fuel_lvl = turtle.getFuelLevel()
    --if (if fuel_lvl >= set_point)
    for i = 1, 16 do
        turtle.select(i)
        id,_,__ = turtle.getItemDetail()
        
        if (not (id == nil)) then
            if(is_coal(id.name)) then
                turtle.refuel()
            end
        end
    end
    -- return inventory pos to beginning
    turtle.select(inv_pos)    
end

-- find sapling in inventory 
-- and then attempt to place

function plant_sap()
    if not turtle.detect() then
        print("empty space, trying to place sapling...")
        local sap_loc = find_obj_inv("minecraft:spruce_sapling")
        print("sap at ", sap_loc)
        if (not(sap_loc == -1)) then
            turtle.select(sap_loc)
            turtle.place()
        end
    end
end

function use_bone_meal()

    succ, data = turtle.inspect()
    -- if sapling
    if (data.name == "minecraft:spruce_sapling") then
    
        -- find bonemeal
        local bone_pos = find_obj_inv("minecraft:bone_meal")
        if (not(bone_pos == -1)) then
            turtle.select(bone_pos)
            turtle.place()
        end
    end
end        

--turtle.select(1)
--aggr_refuel(10)

--chop_tree()

--suc, data = turtle.inspect()
--print(data.name)

--local chest_loc = find_obj("minecraft:chest")
--local furn_loc = find_obj("minecraft:furnace")
--print(chest_loc)
--print(furn_loc)
--while (true) do
--    plant_sap()
--    use_bone_meal()
--    chop_tree()
--end
