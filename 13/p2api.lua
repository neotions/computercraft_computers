function init()
    botID = tonumber(os.getComputerID())
    m = peripheral.find("modem")
    print("opened ports:")
        print(botID)
    return true,botID,m
end

function send(m,port,botID,message)
    m.open(port)
    m.transmit(port,botID,message)
    return true
end

function recieve(m,botID)
    m.open(botID)
    event,side,f,rf,message,dist = os.pullEvent("modem_message") 
    return true, message,rf
end

    
    
