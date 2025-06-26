--[[------------------------------------------------------
----       For Support - discord.gg/threeamigos       ----
---- Do not edit if you do not know what you"re doing ----
--]]------------------------------------------------------

local config <const> = require "data.config"

if not config or not lib then return end

local scully = lib.checkDependency("scully_emotemenu", "2.0.9")
local rpemotes = lib.checkDependency("rpemotes-reborn", "1.9.0")
local export = nil

if scully then
    export = exports["scully_emotemenu"]
elseif rpemotes then
    export = exports["rpemotes-reborn"]
else
    return lib.print.debug("rpemotes or scully_emotemenu is either outdated or missing or both installed. Please update and make sure you only have one of the resources installed and running.")
end

lib.locale()

---Get Radio Animations function
---@param ped any
---@return string
local function getRadioAnimation(ped)
    local props = GetResourceKvpString("TAM_BRA:props") or 'false'

    if cache.vehicle then return 'default' end

    local model = GetEntityModel(ped)

    if props == 'true' then goto props end

    if not config.clothing[model] then return 'default' end

    for component, drawables in pairs(config.clothing[model]) do
        local drawable = GetPedDrawableVariation(ped, component)
        local texture = GetPedTextureVariation(ped, component)

        return drawables[drawable] and drawables[drawable][texture] or false
    end

    ::props::

    if not config.props[model] then return 'default' end

    for component, drawables in pairs(config.props[model]) do
        local drawable = GetPedPropIndex(ped, component)
        local texture = GetPedPropTextureIndex(ped, component)

        return drawables[drawable] and drawables[drawable][texture] or false
    end

    return 'default'
end

---Handle Emote function
---@param emote? string
---@param play? boolean
local function handleEmote(emote, play)
    if not export then return end

    if scully and play then
        export:playEmoteByCommand(emote)
        return
    elseif scully then
        export:cancelEmote()
        return
    elseif rpemotes and play then
        export:EmoteCommandStart(emote)
        return
    elseif rpemotes then
        export:EmoteCancel()
        return
    end
end

---Handle Radio function
---@param bool boolean
local function handleRadio(bool)
    local ped = cache.ped
    local vehicle = cache.vehicle
    local class = GetVehicleClass(vehicle)
    local isVehicleBlacklisted = lib.table.contains(config.blacklistedClasses, class)
    local isPedBlacklisted = lib.table.contains(config.blacklistedPeds, GetEntityModel(ped))
    if isVehicleBlacklisted then return end
    if isPedBlacklisted then return end

    if not bool then return handleEmote() end

    local animType = getRadioAnimation(ped)

    if not animType then return end

    local isAiming = IsPlayerFreeAiming(cache.playerId)
    local aimingVariant =  ("%s_aiming"):format(animType)
    if isAiming and config.animations[aimingVariant] then
        animType = aimingVariant
    end

    local anim = config.animations[animType]

    handleEmote(anim, true)
end

if config.useEvent then
    if lib.checkDependency("sonoranradio", '2.18.0') then
        AddEventHandler('SonoranRadio::API:Talking', handleRadio)
    end

    AddEventHandler('pma-voice:radioActive', handleRadio)
end

if config.useKeybind then
    lib.addKeybind({
        name = "radioAnimKey",
        description = locale("keybind"),
        defaultKey = config.keybindKey,
        defaultMapper = "KEYBOARD",
        secondaryKey = config.controllerKey,
        secondaryMapper = "PAD_DIGITALBUTTON",
        onPressed = function()
            handleRadio(true)
        end,
        onReleased = function()
            handleRadio(false)
        end
    })
end

TriggerEvent('chat:addSuggestion', ('/%s'):format(locale('commands.toggleprops.label')), locale('commands.toggleprops.suggestion'), {
    {name = locale('commands.toggleprops.params.bool.label'), help = locale('commands.toggleprops.params.bool.help')}
})

RegisterCommand(locale('commands.toggleprops.label'), function(source, args)
    local options = {
        ['true'] = true, 
        ['false'] = true
    }
    local option = string.lower(args[1])

    if not options[option] then return end

    SetResourceKvp("TAM_BRA:props", option)

    lib.notify({
        title = locale('notifications.title'),
        description = (locale('notifications.messages.toggled')):format(option == 'true' and 'ON' or 'OFF'), 
        type = ("%s"):format(option == 'true' and 'success' or 'error'), 
        duration = 5000
    })
end, false)

if config.debug then
    RegisterCommand('getclothing', function()
        local v = [[{
            undershirt = { drawable = ]] .. GetPedDrawableVariation(cache.ped, 8) .. [[, texture = ]] .. GetPedTextureVariation(cache.ped, 8) .. [[ },
            mask = { drawable = ]] .. GetPedDrawableVariation(cache.ped, 1) .. [[, texture = ]] .. GetPedTextureVariation(cache.ped, 1) .. [[ },
            torso = { drawable = ]] .. GetPedDrawableVariation(cache.ped, 3) .. [[, texture = ]] .. GetPedTextureVariation(cache.ped, 3) .. [[ },
            torso2 = { drawable = ]] .. GetPedDrawableVariation(cache.ped, 11).. [[, texture = ]] .. GetPedTextureVariation(cache.ped, 11) .. [[ },
            badge = { drawable = ]] .. GetPedDrawableVariation(cache.ped, 10) .. [[, texture = ]] .. GetPedTextureVariation(cache.ped, 10) .. [[ },
            bag = { drawable = ]] .. GetPedDrawableVariation(cache.ped, 5) .. [[, texture = ]] .. GetPedTextureVariation(cache.ped, 5) .. [[ },
            shoes = { drawable = ]] .. GetPedDrawableVariation(cache.ped, 6) .. [[, texture = ]] .. GetPedTextureVariation(cache.ped, 6) .. [[ },
            accessory = { drawable = ]] .. GetPedDrawableVariation(cache.ped, 7) .. [[, texture = ]] .. GetPedTextureVariation(cache.ped, 7) .. [[ },
            kevlar = { drawable = ]] .. GetPedDrawableVariation(cache.ped, 9) .. [[, texture = ]] .. GetPedTextureVariation(cache.ped, 9) .. [[ },
            leg = { drawable = ]] .. GetPedDrawableVariation(cache.ped, 4) .. [[, texture = ]] .. GetPedTextureVariation(cache.ped, 4) .. [[ },
            watch = { drawable = ]] .. GetPedPropIndex(cache.ped, 6) .. [[, texture = ]] .. GetPedPropTextureIndex(cache.ped, 6) .. [[ },
            hat = { drawable = ]] .. GetPedPropIndex(cache.ped, 0) .. [[, texture = ]] .. GetPedPropTextureIndex(cache.ped, 0) .. [[ },
            glasses = { drawable = ]] .. GetPedPropIndex(cache.ped, 1) .. [[, texture = ]] .. GetPedPropTextureIndex(cache.ped, 1) .. [[ },
            ears = { drawable = ]] .. GetPedPropIndex(cache.ped, 2) .. [[, texture = ]] .. GetPedPropTextureIndex(cache.ped, 2) .. [[ },
            bracelets = { drawable = ]] .. GetPedPropIndex(cache.ped, 7) .. [[, texture = ]] .. GetPedPropTextureIndex(cache.ped, 7) .. [[ },
        }]]

        lib.print.info(v)
        lib.setClipboard(v)

        lib.notify({description = locale('notifications.messages.copied'), title = locale('notifications.title'), type = "success", duration = 5000})
    end, false)
end