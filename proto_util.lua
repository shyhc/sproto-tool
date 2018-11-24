local lfs = require "lfs"

local root = {}

-- 读取协议文件
local function read(file)
    local f = assert(io.open(file), file)
    local source = f:read "*a"
    f:close()
    return source
end

-- 读取http协议文件
function root.load_http_protos(type)
    local files = {}
    local proto_path = "../skynet_test/proto/"
    for file in lfs.dir(proto_path) do
        if not string.find(file, "http") then
            goto continue
        end
        if type == "req" and not string.find(file, "c2s") then
            goto continue 
        end
        if type == "rep" and not string.find(file, "s2c") then
            goto continue 
        end
        file = proto_path .. file
        table.insert(files, read(file))
        ::continue::
    end
	return table.concat(files, "\n")
end

-- 读取socket协议文件
function root.load_socket_protos(type)
    local files = {}
    local proto_path = "../skynet_test/proto/"
    for file in lfs.dir(proto_path) do
        if not string.find(file, "socket") then
            goto continue
        end
        if type == "req" and not string.find(file, "c2s") then
            goto continue 
        end
        if type == "rep" and not string.find(file, "s2c") then
            goto continue 
        end
        file = proto_path .. file
        table.insert(files, read(file))
        ::continue::
    end
	return table.concat(files, "\n")
end

return root