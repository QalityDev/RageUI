-- ====================================================================
-- Script Serveur RageUI Standalone
-- ====================================================================

print("^2[RageUI Standalone]^7 Ressource initialisée et prête.")

-- Exemple de callback / event serveur si nécessaire
RegisterNetEvent("rageui:server:log", function(message)
    local src = source
    print(string.format("^3[RageUI Log]^7 (Joueur ID %s): %s", src, tostring(message)))
end)
