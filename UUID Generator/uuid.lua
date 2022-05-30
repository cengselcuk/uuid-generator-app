math.randomseed(os.time())

local uuid = {}

local characters = {"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"}
local hyphens = {[9]=true,[14]=true,[19]=true,[24]=true}

uuid.generate = function(hyphensBool, bracesBool, uppercaseBool)

   uuid.newUUID = ""

   for i=1,36 do

      if hyphens[i] then
         uuid.newUUID = uuid.newUUID.."-"
      elseif i == 15 then
         uuid.newUUID = uuid.newUUID.."4" -- Version 4
      else
         uuid.newUUID = uuid.newUUID..characters[math.random(1,#characters)]
      end

   end

   if not hyphensBool then
      uuid.newUUID = uuid.newUUID:gsub("%-", " ")
   end
   if bracesBool then
      uuid.newUUID = "{"..uuid.newUUID.."}"
   end
   if not uppercaseBool then
      uuid.newUUID = string.lower(uuid.newUUID)
   end

   return uuid.newUUID

end

return uuid