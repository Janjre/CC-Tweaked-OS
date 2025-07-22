require("OS/config")
term.clear()
term.setCursorPos(1,1)
term.write("OS Booting...")
term.setCursorPos(1,2)

if development then
    textutils.slowPrint("Development Mode Enabled")
else
    term.write("Checking for updates...")
    shell.run("OS/update.lua")
end

term.setCursorPos(1,3)
term.write("-------------")
term.setCursorPos(1,4)
sleep(1)
textutils.slowPrint("##########")
sleep(1)
shell.run("OS/Menu")