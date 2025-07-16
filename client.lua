local isScanning = false
local scanThread = nil
local scannedCoords = {}


local function scanAndSend()
    local modelHashes = {}
    for _, modelName in pairs(Config.ModelsToScan) do
        table.insert(modelHashes, GetHashKey(modelName))
    end
    local objects = GetGamePool("CObject")
    for i = 1, #objects do
        local obj = objects[i]
        if DoesEntityExist(obj) then
            local objModel = GetEntityModel(obj)
            for _, hash in pairs(modelHashes) do
                if objModel == hash then
                    local coords = GetEntityCoords(obj)
                    table.insert(scannedCoords, {
                        coords = {
                            x = coords.x,
                            y = coords.y,
                            z = coords.z
                        }
                    })
                    break
                end
            end
        end
    end
    if #scannedCoords > 0 then
        TriggerServerEvent("rose:saveModelCoords", scannedCoords)
    else
        if Config.EnableDebug == true then print("[DEBUG] No models found.") end
    end
end

RegisterCommand("scan", function()
    isScanning = not isScanning
    if isScanning then
        lib.showTextUI('Scanning started.')
        if Config.EnableDebug == true then print("[DEBUG] Scanning started.") end
        scanThread = CreateThread(function()
            while isScanning do
                scanAndSend()
                Wait(Config.ScanInterval)
            end
        end)
    else
        if Config.EnableDebug == true then print("[DEBUG] Scanning stopped.") end
        if scanThread then
            TerminateThread(scanThread)
            scanThread = nil
        end
        lib.showTextUI('Scanning stopped.')
        Wait(2000)
        lib.hideTextUI()
    end
end, false)
