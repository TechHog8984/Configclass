local class = {}
local httpservice = game:GetService'HttpService'

function class:CreateConfig(filename, foldername)
	local filepath = filename
	if foldername then
		filepath = foldername .. '/' .. filename
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
end
function class:GetConfig(filepath)
	return httpservice:JSONDecode(readfile(filepath)) or nil
end

return class
