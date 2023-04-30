os.loadAPI("p2")
success,botID,m = p2.init()

while true do
    p2.send(m,14,botID,"ping")
    success,message,rf = p2.recieve(m,botID)
    print(message)
    os.sleep(1)
end
