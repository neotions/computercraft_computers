while true do
    term.clear()
    term.setCursorPos(0,0)
    print("time:")
    reading = os.time()
    term.write(reading)
    os.sleep(1)
end
