local input_inventory = peripheral.find("sophisticatedstorage:barrel")
local output_inventory = peripheral.find("minecraft:chest")

while true do
  for slot, item in pairs(input_inventory.list()) do
    if input_inventory.getItemDetail(slot).name == "minecraft:slime_ball" then
        input_inventory.pushItems(peripheral.getName(output_inventory), slot)
        redstone.setOutput("left", true)
        sleep(3*item.count)
        redstone.setOutput("left", false)
    else
        print(slot, item.name)
    end
  end
  sleep(1)
end
