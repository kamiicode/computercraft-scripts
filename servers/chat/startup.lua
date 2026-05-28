local COMPUTER_ANDESITE_ID = 21

local chat_box = peripheral.find("chat_box")

local function main()
  peripheral.find("modem", rednet.open)

  if not rednet.isOpen() then
    error("Failed to open modem")
  end

  while true do
    local _event, username, message, _uuid, isHidden, _messageUtf8 = os.pullEvent("chat")

    if isHidden == true and string.sub(message, 1, 4) == "test" then
      rednet.send(COMPUTER_ANDESITE_ID, {name="kamicode", count=64}, "GIVE_ANDESITE")
    end
  end
end

main()
rednet.close()
