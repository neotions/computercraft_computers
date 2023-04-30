os.loadAPI("p2")

success,botID,m = p2.init()

while true do 
    success,message,rf = p2.recieve(m,botID)
    print(message)
    p2.send(m,rf,botID,"pong")
    os.sleep(1)
end




