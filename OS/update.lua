require("config")
base = autoupdateTarget or "https://raw.githubusercontent.com/ScaryWizard69/CC-Tweaked-OS/main/"

local files = {
  { url = "startup.lua", dest = "startup.lua" },
  { url = "OS/Menu.lua", dest = "OS/Menu.lua" },
  { url = "OS/back.lua", dest = "OS/back.lua" },
  { url = "OS/Command.lua", dest = "OS/Command.lua" },
  { url = "OS/uninstall.lua", dest = "OS/uninstall.lua"},
  { url = "OS/programs.lua", dest = "OS/programs.lua"},
  { url = "OS/programs/chat.lua", dest = "OS/programs/chat.lua"},
  { url = "OS/programs/sendfile.lua", dest = "OS/programs/sendfile.lua"},
  { url = "OS/programs/recvfile.lua", dest = "OS/programs/recvfile.lua"},
  { url = "OS/update.lua", dest = "OS/update.lua"},
  { url = "OS/version.txt", dest = "OS/version.txt"},
--   { url = "OS/programs/config.llua", dest = "OS/programs/config.lua"}
}

for _, file in ipairs(files) do
    local fullUrl = base .. file.url
    local response = http.get(fullUrl)
    if response then
        local newData = response.readAll()
        response.close()

        local needsUpdate = true
        if fs.exists(file.dest) then
            local readHandle = fs.open(file.dest, "r")
            local oldData = readHandle.readAll()
            readHandle.close()

            if oldData == newData then
                needsUpdate = false
            end
        end

        if needsUpdate then
            local writeHandle = fs.open(file.dest, "w")
            writeHandle.write(newData)
            writeHandle.close()
            print("Updated file: " .. file.dest)
        end
    else
        print("Failed to update: " .. file.url)
    end
end
