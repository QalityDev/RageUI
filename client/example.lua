-- ====================================================================
-- Exemple de Menu RageUI Officiel FlashBack Mihara
-- Tapez /admin ou /rageui pour ouvrir le menu
-- ====================================================================

local soundEnabled = true
local disablePeds = false
local currentHour = 13

-- Initialisation des menus avec la syntaxe de FlashBack Mihara
RageUI.CreateMenu("rpAdmin", "Admin", "GESTION DU MONDE")
RageUI.CreateSubMenu("AdminWorldMenu", "rpAdmin", "Admin", "GESTION DU MONDE")

CreateThread(function()
    while true do
        Wait(0)

        -- Menu racine Admin
        RageUI.IsVisible("rpAdmin", function()
            RageUI.Button("Gestion du monde", "Accéder aux paramètres globaux du monde", {}, true, {}, "AdminWorldMenu")
        end)

        -- Sous-Menu "Gestion du Monde" (Identique à l'image du serveur)
        RageUI.IsVisible("AdminWorldMenu", function()
            -- Boutons désactivés (Affichent le cadenas 🔒 comme dans l'image 2)
            RageUI.Button("Météo", "Gérer la météo globale", {}, false, {})
            RageUI.Button("Braquages", "Gestion des braquages", {}, false, {})

            -- Liste d'heures (< 13h >)
            RageUI.List("Heure", { "1h", "2h", "3h", "4h", "5h", "6h", "7h", "8h", "9h", "10h", "11h", "12h", "13h", "14h", "15h", "16h", "17h", "18h", "19h", "20h", "21h", "22h", "23h", "24h" }, currentHour, "Changer l'heure du monde", {}, true, {
                onListChange = function(Index, Item)
                    currentHour = Index
                end
            })

            RageUI.Button("Blackout", "Activer ou désactiver l'électricité de la ville", {}, true, {})

            -- Checkboxes
            RageUI.Checkbox("Son par les joueurs", "Activer ou désactiver la perception sonore", soundEnabled, {}, {
                onSelected = function()
                    soundEnabled = not soundEnabled
                end
            })

            RageUI.Checkbox("Désactiver le spawn des PNJ", "Prends un peu de temps avant d'être actif.", disablePeds, {}, {
                onSelected = function()
                    disablePeds = not disablePeds
                end
            })

            RageUI.Button("Désactiver les peds offline", "Gestion des PNJ déconnectés", {}, true, {})
            RageUI.Button("Fouiller les joueurs hors ligne", "Inspecter les inventaires hors ligne", {}, true, {})
            RageUI.Button("Rendre les PNJ fous", "Activer le comportement agressif PNJ", {}, true, {})
            RageUI.Button("Riot", "Déclencher l'émeute PNJ", {}, true, {})
            RageUI.Button("Activer l'alarme de la Prison", "Déclencher la sirène pénitencière", {}, true, {})
            RageUI.Button("Activer l'alarme de Cayo Perico", "Déclencher l'alarme de l'île", {}, true, {})
        end)
    end
end)

-- Commandes d'ouverture
RegisterCommand("admin", function()
    RageUI.Visible("rpAdmin", not RageUI.Visible("rpAdmin"))
end, false)

RegisterCommand("rageui", function()
    RageUI.Visible("rpAdmin", not RageUI.Visible("rpAdmin"))
end, false)
