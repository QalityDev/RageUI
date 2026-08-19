-- ====================================================================
-- Exemple de Menu RageUI Standalone pour FiveM (ESX / OX Compatible)
-- Tapez /rageui ou /menu en jeu pour tester le menu
-- ====================================================================

local mainMenu = RageUI.CreateMenu("RageUI LocalHost", "MENU DE TEST ESX / OX")
local subMenuPlayer = RageUI.CreateSubMenu(mainMenu, "Option Joueur", "PARAMÈTRES DU JOUEUR")
local subMenuVehicles = RageUI.CreateSubMenu(mainMenu, "Véhicules", "GESTION DU VÉHICULE")

-- Variables d'état pour les tests
local checkboxTest = false
local listIndex = 1
local listItems = { "Option A", "Option B", "Option C", "Option D" }

-- Boucle de rendu du menu
CreateThread(function()
    while true do
        Wait(0)

        -- Menu Principal
        if RageUI.IsVisible(mainMenu, function()
            RageUI.Separator("~b~--- Menu Démonstration Standalone ---~s~")

            RageUI.Button("Options Joueur", "Accéder aux sous-options du personnage", {}, true, {}, subMenuPlayer)
            RageUI.Button("Options Véhicule", "Accéder aux actions sur le véhicule", {}, true, {}, subMenuVehicles)

            RageUI.Line()

            checkboxTest = RageUI.Checkbox("Mode Invicible / Mod-Test", "Activer ou désactiver l'invincibilité de test", checkboxTest, {}, {
                onChecked = function()
                    SetEntityInvincible(PlayerPedId(), true)
                    TriggerEvent("chat:addMessage", { args = { "^2[RageUI]", "Invincibilité activée !" } })
                end,
                onUnChecked = function()
                    SetEntityInvincible(PlayerPedId(), false)
                    TriggerEvent("chat:addMessage", { args = { "^1[RageUI]", "Invincibilité désactivée !" } })
                end
            })

            listIndex = RageUI.List("Choix de sélection", listItems, listIndex, "Sélectionnez un élément dans la liste", {}, true, {
                onListChange = function(index, item)
                    print("[RageUI] Changement liste index : " .. tostring(index) .. " -> " .. tostring(item))
                end,
                onSelected = function(index, item)
                    TriggerEvent("chat:addMessage", { args = { "^3[RageUI]", "Option sélectionnée : " .. tostring(item) } })
                end
            })
        end) then
        end

        -- Sous-Menu Joueur
        if RageUI.IsVisible(subMenuPlayer, function()
            RageUI.Separator("~g~--- Santé & Armure ---~s~")

            RageUI.Button("Soigner le joueur", "Rétablir la vie à 100%", {}, true, {
                onSelected = function()
                    SetEntityHealth(PlayerPedId(), 200)
                    TriggerEvent("chat:addMessage", { args = { "^2[RageUI]", "Vie rétablie !" } })
                end
            })

            RageUI.Button("Donner du gilet par-balles", "Rétablir le gilet par-balles à 100%", {}, true, {
                onSelected = function()
                    SetPedArmour(PlayerPedId(), 100)
                    TriggerEvent("chat:addMessage", { args = { "^2[RageUI]", "Gilet par-balles max !" } })
                end
            })
        end) then
        end

        -- Sous-Menu Véhicules
        if RageUI.IsVisible(subMenuVehicles, function()
            RageUI.Separator("~y~--- Actions Véhicules ---~s~")

            RageUI.Button("Réparer le véhicule", "Réparer le moteur et la carrosserie", {}, true, {
                onSelected = function()
                    local ped = PlayerPedId()
                    local veh = GetVehiclePedIsIn(ped, false)
                    if veh ~= 0 then
                        SetVehicleFixed(veh)
                        SetVehicleDirtLevel(veh, 0.0)
                        TriggerEvent("chat:addMessage", { args = { "^2[RageUI]", "Véhicule réparé !" } })
                    else
                        TriggerEvent("chat:addMessage", { args = { "^1[RageUI]", "Vous n'êtes pas dans un véhicule !" } })
                    end
                end
            })
        end) then
        end
    end
end)

-- Commande pour ouvrir/fermer le menu
RegisterCommand("rageui", function()
    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
end, false)

RegisterCommand("menu", function()
    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
end, false)

-- Suggestion de commande dans le chat
TriggerEvent("chat:addSuggestion", "/rageui", "Ouvrir le menu RageUI de démonstration")
TriggerEvent("chat:addSuggestion", "/menu", "Ouvrir le menu RageUI de démonstration")
