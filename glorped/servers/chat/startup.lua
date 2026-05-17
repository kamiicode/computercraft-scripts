local ANDESITE_PROTOCOL_ID = 3

local chat_box = peripheral.find("chat_box")

local function main()
  peripheral.find("modem", rednet.open)
  if not rednet.isOpen() then
    error("Failed to open modem")
  end

  while true do
    local event, username, message, uuid, isHidden, messageUtf8 = os.pullEvent("chat")
    print(event, username, message, isHidden, messageUtf8)

    if string.sub(message, 1, 5) == "!test" then
      rednet.send(COMPUTER_ANDESITE_ID, {name="kamicode", count=64})
    end
  end
end

main()
rednet.close()
