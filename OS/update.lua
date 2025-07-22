require("OS/config.lua")
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
  { url = "OS/programs/update.lua", dest = "OS/programs/update.lua"},
  { url = "OS/programs/version.txt", dest = "OS/programs/version.txt"},
  { url = "OS/programs/config.llua", dest = "OS/programs/config.lua"}
}

for _, file in ipairs(files) do
    local fullUrl = base .. file.url
    local ok, err = http.get(fullUrl)
    if ok then
        local toWrite = ok.readAll()
        local readHandle = fs.open(file.dest, "r")
        if readHandle.readAll() == toWrite then
            ok.close()
        else
            writeHandle = fs.open(file.dest, "w+") -- Use "w+" to overwrite the file
            writeHandle.write(toWrite)
            writeHandle.close()

            print("Updated file: " .. file.dest)
        end
        readHandle.close()

        ok.close()
    else
        print("Failed to update: " .. file.url)
    end
end
