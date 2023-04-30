mon = peripheral.wrap("left")
mon.setBackgroundColor(2)
mon.clear()
while true do
    local event, button, x, y = os.pullEvent("monitor_touch")
    mon.setBackgroundColor(1)
    mon.setCursorPos(x,y)
    mon.write(" ")
end
