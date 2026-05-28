local CHAT_COMPUTER_ID = 24

local inventory_managers = {
    {manager=peripheral.wrap("inventory_manager_2"), side="right"},
    {manager=peripheral.wrap("inventory_manager_3"), side="left"}
}

local function waitForInventoryOwner()
  while true do

    for _,manager in pairs(inventory_managers) do
      if manager.manager.getOwner() ~= nil then
        return
      end
    end

    print("Both inventories misses an owner.\nPress ENTER to try again")
    read()
  end
end

local function giveAndesiteToPlayer(name, count)
  for _,manager in pairs(inventory_managers) do
    if manager.manager.getOwner() == name then
      manager.manager.addItemToPlayer(manager.side, {name="minecraft:andesite", count=count})
      return true
    end
  end

  return false
end

waitForInventoryOwner()

local function main()
  peripheral.find("modem", rednet.open)

  if not rednet.isOpen() then
    error("Failed to open modem")
  end

  while true do
    local id, data, _protocol = rednet.receive("GIVE_ANDESITE")
    if id == CHAT_COMPUTER_ID and type(data) == "table" then
      if not giveAndesiteToPlayer(data.name, data.count) then
        print("Player " .. data.name .. " is not registered")
      end
    end
  end
end

main()
rednet.close()
