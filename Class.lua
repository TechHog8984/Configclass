local httpservice = game:GetService'HttpService'

local class = {}

function class:Config(info)
	local filename, foldername, path = info['filename'], info['foldername'], info['path']

	local folders = {}

	if path then
		folderpath = nil
		foldername = ''
		local split = path:split('/')
		for i,v in next, split do
			if i == #split then
				filename = v
			else
				table.insert(folders, v)
			end
		end
		for i = 1, #folders do
			local name = folders[i]
			if folderpath then
				folderpath = folderpath .. '/' .. name
			else
				folderpath = name
			end
			if not isfolder(folderpath) then
				makefolder(folderpath)
			end
		end
	elseif filename then
		path = filename
		if foldername then
			if not isfolder(foldername) then
				makefolder(foldername)
			end

			path = foldername .. '/' .. path
		end
	end

	local config = {}

	if isfile(path) then
		config = httpservice:JSONDecode(readfile(path))
	end

	local index = {}
	local proxy = {}
	local mt = {
		__index = function(t, key)
			return t[index][key]
		end,
		__newindex = function(t, key, value)
			t[index][key] = value
			writefile(path, httpservice:JSONEncode(proxy[index]))
		end,
	}

	proxy[index] = config
	setmetatable(proxy, mt)
	return proxy
end

return class
