local skynet = require "skynet"
local group = require "mcgroup"

skynet.dispatch()

skynet.start(function()
	local gid = group.create()
	local gaddr = group.address(gid)
	print("=== Create Group ===",gid,skynet.address(gaddr))
	for i=1,10 do
		local address = skynet.newservice("testgroup_c", tostring(i))
		group.enter(gid , address)
	end
	skynet.sleep(1000)
	skynet.send(gaddr,"Hello World")

--	local group = skynet.query_group(1)
--	for i=1,10 do
--		local address = skynet.newservice("testgroup_c", tostring(i))
--		skynet.enter_group(1 , address)
--	end
--	skynet.send(group,"Hello World")
--	skynet.exit()
end)
