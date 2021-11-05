local class = {}
local httpservice = game:GetService'HttpService'

function class:CreateConfig(filename, foldername)
	if filename then
		local filepath = filename
		if foldername then
			filepath = foldername .. '/' .. filename
			if not isfolder(foldername) then
				makefolder(foldername)
			end
		end

		local config = {}

		local function update()
			writefile(filepath, httpservice:JSONEncode(config))
		end

		return setmetatable({}, {
			__index = function(self, index)
				return config[index]
			end,
			__newindex = function(self, index, value)
				config[index] = value
				update()
			end,
		}), filepath
	else
		return 'filename is required'
	end
	return 'error'
end
function class:GetConfig(filepath)
	local success, config = pcall(function() return httpservice:JSONDecode(readfile(filepath)) end)
	if success then
		return config
	else
		return nil
	end
end

return class
