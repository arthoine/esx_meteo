local currentWeather = 'CLEAR'  -- Initialisation avec un type de temps clair
local lastWeatherChange = os.time()

-- Fonction pour mettre à jour la météo de manière périodique
function updateWeather()
    local possibleWeathers = {'CLEAR', 'EXTRASUNNY', 'CLOUDS', 'OVERCAST', 'RAIN', 'CLEARING', 'THUNDER', 'SMOG', 'FOGGY'}
    local newWeather = possibleWeathers[math.random(#possibleWeathers)]

    -- Changez la météo toutes les 10 minutes
    if os.time() - lastWeatherChange > 600 then
        currentWeather = newWeather
        lastWeatherChange = os.time()
        TriggerClientEvent('updateWeather', -1, currentWeather)
        print('Weather changed to: ' .. currentWeather)
    end
end

-- Thread pour mettre à jour la météo toutes les 5 minutes
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(300000)  -- 300000 milliseconds = 5 minutes
        updateWeather()
    end
end)

-- Écouteur pour mettre à jour la météo pour les nouveaux joueurs lors de leur connexion
AddEventHandler('playerConnecting', function()
    TriggerClientEvent('updateWeather', source, currentWeather)
end)
