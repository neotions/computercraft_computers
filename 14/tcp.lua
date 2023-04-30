os.loadAPI("p2")

success,botID,m = p2.init()

print("computer ID:")
print(botID)

function main()
    for i = 0,100 do
        print(i)
        os.sleep(1)
    end
end

event = parallel.waitForAny(main,p2.recieve)

print(event)

if event == 2 then
    print("message recieved")   
elseif event == 1 then
    print("unknown program error")
end
        
