# Configclass

## Configclass is a class that allows you to use configs for synapse easily.
### All you have to do is run the :CreateClass function and then edit the table as you wish.

> How to use?
```lua
--first, get the class.
local class = loadstring(game:HttpGet('https://raw.githubusercontent.com/TechHog8984/Configclass/main/Class.lua')()

--to create a config, just run class:CreateConfig(filename, foldername)
--filename is required, but foldername is optional
local config, filepath = class:CreateConfig('config.config', 'awesome config test') --this function returns a table that you can edit as you config (more detailed
                                                                                    --explanation later on) and the filepath(incase you don't want to get it yourself)
                                                                                    --the filepath is used for the class:GetConfig function.
--to edit a config simply just edit the table's values like below
config.awesome = true
config.aimbot = true
config.aimbotkey = 'e'

--to get a config that is already created, just run class:GetConfig(filepath)       --this is why class:CreateConfig also returns the file path
local config = class:GetConfig(filepath)

--then to edit the config just edit the table's values again.
config.aimbot = false
config.aimbotkey = 'f'
```
