-------- RUN THIS IN LUA IF YOU WANT TO KNOW MORE ABOUT MUTT


local function Gaynificator(name)
    return name .. ' and gay'
end

local function Smelliator(name)
    return name .. ' is smelly'
end

local name = 'Mutty Wutty'

local Smelly = Smelliator(name)

local Gay = Gaynificator(Smelly)

print(Gay)