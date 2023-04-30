print(string.match("minecraft:spruce_saplin", "sapling"))
word = "minecraft:spruce_sapling"
prefix = "minecraft:"
str, _ = string.gsub(word, prefix, "")
print(str)
