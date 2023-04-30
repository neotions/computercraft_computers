function line(x1,y1,x2,y2)
    local dx = x2 - x1
    local dy = y2 - y1
    
    len = math.max(math.abs(dx), math.abs(dy))
    
    for t = 0, len do
        x = dx/len*t + x1
        y = dy/len*t + y1
        x = math.floor(x)
        y = math.floor(y)
        term.setCursorPos(x,y)
        term.write("x")
    end
end

w,h = term.getSize()

line(w/2,h/2, w/2 +5, h/2 - 8)
