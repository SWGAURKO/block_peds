-- 🚫 ADD THE PED MODELS YOU WANT TO BLOCK IN THIS LIST
local BlacklistedPeds = {
    "a_c_boar", -- Example: Skater Ped
    "a_c_pig"    -- Example: Cop Ped

    -- Add any other ped model names here, separated by commas
}

local BlacklistedHashes = {}

-- Convert model names to hashes on script startup
Citizen.CreateThread(function()
    for _, modelName in ipairs(BlacklistedPeds) do
        local hash = GetHashKey(modelName)
        BlacklistedHashes[hash] = true
    end
end)

-- Main loop to detect and delete blacklisted peds
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500) -- Check every 500ms to maintain great server performance

        local handle, ped = FindFirstPed()
        local success
        
        repeat
            -- Check if the entity exists and is not a real player
            if DoesEntityExist(ped) and not IsPedAPlayer(ped) then
                local pedModel = GetEntityModel(ped)

                -- If the ped model is in our blacklist table, delete it instantly
                if BlacklistedHashes[pedModel] then
                    DeleteEntity(ped)
                end
            end
            
            success, ped = FindNextPed(handle)
        until not success
        
        EndFindPed(handle)
    end
end)
