p = peripheral.find("playerDetector")
e = peripheral.find("environmentDetector")
r1 = peripheral.wrap("redstoneIntegrator_3")
r2 = peripheral.wrap("redstoneIntegrator_4")


run = true


while run do
    lightReading = e.getDayLightLevel()
    print(lightReading)

    if lightReading > 7 then
        r1.setAnalogOutput("top",16)
        r2.setAnalogOutput("top",16)
    else
        r1.setAnalogOutput("top",0)
        r2.setAnalogOutput("top",0)
    end
    os.sleep(10)
    print(os.time())
end


    



