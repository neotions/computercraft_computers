start_color = math.random(1,360)
print(start_color)

next_color = start_color + math.random(1,36000)
print(next_color) 

next_color = math.mod(next_color, 360)
print(next_color)
