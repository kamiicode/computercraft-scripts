local input_inventory = peripheral.find("minecraft:barrel")
local output_inventory = peripheral.find("minecraft:chest")

while true do
  for i=1, input_inventory.size() do
    if barrel.getItemDetail(i).name == "minecraft:slime" then
        input_inventory.pushItems(output_inventory.name, 1)
    else
        print(i)
    end
  end
  sleep(1)
end
