local function objectMetatable()
	local meta = {
		__call = function(t, ...)
			
		end,
		__index = function(t, index)
			
		end
	}
	return meta
end

local accountMeta = objectMetatable()
accountMeta.__index = function(t, index)
	print(index)
	if index == "increase" then
		t.amount = t.amount + 5
	end
end

local Account = {}
function Account.new()
	local t = {}
	t.amount = 0
	setmetatable(t, accountMeta)
	return t
end 

local acc = Account.new()
acc["increase"] = 1
print(rawget(acc, "amount"))

--[[
local Object = {}

function Object:newObject(d)
	local t = {}
	setmetatable(t, d)
	self.__index = d
	return t	
end

local classDef = objectMetatable
rawset(classDef, "amount", 0)
rawset(classDef, "deposit", function(t)
	self.amount = self.amount + t
end)
local account = Object:newObject(classDef)
]]