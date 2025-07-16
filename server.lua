RegisterNetEvent("rose:saveModelCoords", function(data)
    local existing = LoadResourceFile(GetCurrentResourceName(), Config.OutputFileName)
    local lines = {}
    if existing then
        for line in existing:gmatch("[^\r\n]+") do
            table.insert(lines, line)
        end
    end
    for i = 1, #data do
        local entry = data[i]
        local coords = entry.coords
        if coords and type(coords.x) == "number" and type(coords.y) == "number" and type(coords.z) == "number" then
            local line = string.format("vector3(%.2f, %.2f, %.2f),", coords.x, coords.y, coords.z)
            local alreadyExists = false
            for _, l in pairs(lines) do
                if l == line then
                    alreadyExists = true
                    break
                end
            end
            if not alreadyExists then
                table.insert(lines, line)
            end
        else
            if Config.EnableDebug == true then print("[DEBUG] Invalid coordinate data received:", json.encode(entry)) end
        end
    end
    local finalContent = table.concat(lines, "\n")
    SaveResourceFile(GetCurrentResourceName(), Config.OutputFileName, finalContent, -1) -- The found_coords.txt file is created automatically.
    if Config.EnableDebug == true then print("[DEBUG] New coordinates saved.") end
end)
