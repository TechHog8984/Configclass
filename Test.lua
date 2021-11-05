local foldername = __FolderName__ or 'default_confighandler'
local filename = __FileName__ or 'config.config'

local httpservice = game:GetService'HttpService'
local tostring = loadstring(game:HttpGet('https://pastebin.com/raw/h8kVTUVc'))().tostring

if filename then
	local path = filename
	if foldername and not isfolder(foldername) then
		makefolder(foldername)
		path = foldername .. '/' .. path
	end

	local config = {}
	if isfile(path) then
		config = httpservice:JSONDecode(readfile(path))
	end

	return setmetatable({},{
		__index = function(self, index)
			return config[index]
		end,
		__newindex = function(self, index, value)
			config[index] = value
			if isfile(path) then
				writefile(path, httpservice:JSONEncode(readfile(path)))
			end
		end,
	})
end

return
