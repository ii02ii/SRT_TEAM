Cool_Team = dofile("sudo.lua")
https = require("ssl.https")
JSON = dofile("./libs/JSON.lua")
local Ch_Dev = io.open("Spider_opening.lua")
if Ch_Dev then
Spider = {string.match(Ch_Dev:read('*all'), "^(.*)/(%d+)")}
local Text_File = io.open("sudo.lua", 'w')
Text_File:write("token = '" ..Spider[1].."'\n\nsudo_add = "..Spider[2].."" )
Text_File:close()
https.request("https://api.telegram.org/bot"..Spider[1].."/sendMessage?chat_id="..Spider[2].."&text=تجريبي !@! ")
os.execute('cd .. && rm -rf .telegram-cli')
os.execute('rm -rf Spider_opening.lua')  
os.execute('./tg -s ./SRT_TEAM.lua $@ --bot='..Spider[1])
end
function chack(tokenCk)
local getme = "https://api.telegram.org/bot" ..tokenCk.. '/getme'
local req = https.request(getme)
local data = JSON:decode(req)
if data.ok == true then
print("\27[31m✓ DONE\27[m \27[1;34m»»Now Send Sudo ID««\27[m")
local sudo_send  = io.read()
print("\27[31m✓ DONE\27[m")
local Text_File = io.open("sudo.lua", 'w')
Text_File:write("token = '" ..tokenCk.."'\n\nsudo_add = "..sudo_send.."" )
Text_File:close()
os.execute('cd .. && rm -fr .telegram-cli')
os.execute('cd && rm -fr .telegram-cli')
os.execute('./tg -s ./SRT_TEAM.lua $@ --bot='..tokenCk)
else
print("\27[31m»»This TOKEN Incorrect , Send Right TOKEN««\27[m")
local token_send = io.read()
chack(token_send)
end
end
os.execute('cd .. && rm -rf .telegram-cli')
if token and token == "TOKEN" then 
print("\27[1;34m»»Send Your Bot TOKEN««\27[m")
local token_send = io.read()
chack(token_send)
else 
os.execute('cd .. && rm -fr .telegram-cli')
os.execute('cd && rm -fr .telegram-cli')
Cool_Team = dofile("sudo.lua")
local getme = "https://api.telegram.org/bot" ..token.. '/getme'
local req = https.request(getme)
local data = JSON:decode(req)
if data.ok == true then
os.execute('./tg -s ./SRT_TEAM.lua $@ --bot='..token)
else
print("\27[31mTOKEN Incorrect , Send Right TOKEN««\27[m")
local token_send = io.read()
chack(token_send)
end
end
