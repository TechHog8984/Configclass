# Configclass

## Configclass is a class that allows you to use configs for synapse easily.

> How to use?
```lua
--first, get the class.
local Class = loadstring(game:HttpGet('https://raw.githubusercontent.com/TechHog8984/Configclass/main/Class.lua'))()

--then, get the config by using the Class:Config function.
--you can use this function in two ways.
--one ways is: 
--            Class:Config{filename = 'filename.extension', foldername = 'foldername'}
--another way is:
--            Class:Config{path = 'filepath'}
--path is an option incase you wanted more than one folder (maybe a folder called 'scriptname' and inside that one called 'configs')

--this function either creates a new config or loads an already created one and returns it as a table
--this allows ease of access as all you have to do is run the same function instead of manually checking and creating

--finally, all you have to do is change or get values from the config

--example

local config = Class:Config{path = 'testconfigs/config.config'}
print('old: ' .. tostring(config.value))
config.value = math.random(1, 10)
print('new: ' .. tostring(config.value))

--another more practical example

local uiconfig = Class:Config{path = 'ConfigTestScript/Configs/ui.config'}
print(uiconfig.color)
if not uiconfig.color then
    uiconfig.color = Color3.fromRGB(30, 30, 30)
end
print(config.color)
```

# If you want more examples, check out [examples](examples)
