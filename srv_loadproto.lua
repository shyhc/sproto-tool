local skynet = require "skynet"
local sprotoparser = require "sprotoparser"
local sprotoloader = require "sprotoloader"
local proto_util = require "proto_util"

local function load_proto()
    local c2s_http_protos = proto_util.load_http_protos("req")
    local s2c_http_protos = proto_util.load_http_protos("rep")
    local proto = {}
    proto.c2s = sprotoparser.parse(c2s_http_protos)
    proto.s2c = sprotoparser.parse(s2c_http_protos)
    sprotoloader.save(proto.c2s, 1)
    sprotoloader.save(proto.s2c, 2)
    local c2s_socket_protos = proto_util.load_socket_protos("req")
    local s2c_socket_protos = proto_util.load_socket_protos("rep")
    sprotoloader.save(c2s_socket_protos, 3)
    sprotoloader.save(s2c_socket_protos, 4)
end

skynet.start(function()
    skynet.error("proto load service start ...")
    load_proto()
end)