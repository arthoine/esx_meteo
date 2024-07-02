RegisterNetEvent('updateWeather')
AddEventHandler('updateWeather', function(weather)
    SetWeatherTypePersist(weather)
    SetWeatherTypeNowPersist(weather)
    SetWeatherTypeNow(weather)
    SetOverrideWeather(weather)
    NetworkOverrideClockTime(12, 00, 00)  -- Heure fixe à midi pour des effets météorologiques clairs
end)
