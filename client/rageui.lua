-- ====================================================================
-- RageUI Standalone Framework (Client Engine)
-- Compatible ESX / OX / Standalone
-- ====================================================================

RageUI = {}
RageUI.Menus = {}
RageUI.CurrentMenu = nil
RageUI.NextMenu = nil
RageUI.ItemIndex = 0

local controlsDisabled = false

--- Jouer un son frontend GTA V
--- @param audioRef string
--- @param audioName string
function RageUI.PlaySound(audioRef, audioName)
    PlaySoundFrontend(-1, audioName or "SELECT", audioRef or "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
end

--- Créer un menu principal
--- @param title string
--- @param subtitle string
--- @param x number
--- @param y number
--- @return table
function RageUI.CreateMenu(title, subtitle, x, y)
    local menu = {
        Title = title or "RageUI",
        Subtitle = (subtitle or ""):upper(),
        Description = nil,
        Parent = nil,
        Open = false,
        Index = 1,
        Options = 0,
        Closable = true,
        Opened = {},
        Closed = {},
        Items = {},
        Theme = "default",
        Position = "left"
    }

    function menu:SetPosition(px, py)
        self.X = tonumber(px) or self.X
        self.Y = tonumber(py) or self.Y
    end

    function menu:SetSubtitle(str)
        self.Subtitle = tostring(str):upper()
    end

    function menu:SetTitle(str)
        self.Title = tostring(str)
    end

    return menu
end

--- Créer un sous-menu récursif
--- @param parent table
--- @param title string
--- @param subtitle string
--- @return table
function RageUI.CreateSubMenu(parent, title, subtitle)
    if not parent then
        error("[RageUI] Parent menu requis pour CreateSubMenu")
    end
    local subMenu = RageUI.CreateMenu(title or parent.Title, subtitle or parent.Subtitle)
    subMenu.Parent = parent
    return subMenu
end

--- Afficher / Masquer un menu
--- @param menu table
--- @param state boolean
function RageUI.Visible(menu, state)
    if not menu then return false end

    if type(state) == "boolean" then
        if state then
            if RageUI.CurrentMenu ~= nil then
                RageUI.CurrentMenu.Open = false
            end
            RageUI.CurrentMenu = menu
            menu.Open = true
            menu.Index = 1
            menu.Items = {}
            SendNUIMessage({
                type = "open_menu",
                data = {
                    title = menu.Title,
                    subtitle = menu.Subtitle,
                    theme = menu.Theme or "default",
                    position = menu.Position or "left"
                }
            })
        else
            if RageUI.CurrentMenu == menu then
                menu.Open = false
                RageUI.CurrentMenu = nil
                SendNUIMessage({ type = "close_menu" })
            end
        end
    else
        return menu.Open
    end
end

--- Fermer tous les menus ouverts
function RageUI.CloseAll()
    if RageUI.CurrentMenu ~= nil then
        RageUI.CurrentMenu.Open = false
        RageUI.CurrentMenu = nil
        SendNUIMessage({ type = "close_menu" })
        RageUI.PlaySound("HUD_FRONTEND_DEFAULT_SOUNDSET", "BACK")
    end
end

--- Vérifier si le menu est actuellement rendu et traiter le callback
--- @param menu table
--- @param callback function
--- @return boolean
function RageUI.IsVisible(menu, callback)
    if not menu or not menu.Open or RageUI.CurrentMenu ~= menu then
        return false
    end

    menu.Items = {}
    menu.Options = 0

    if callback and type(callback) == "function" then
        callback()
    end

    RageUI.Render(menu)
    return true
end

--- Rendu NUI du menu
--- @param menu table
function RageUI.Render(menu)
    SendNUIMessage({
        type = "render_menu",
        data = {
            title = menu.Title,
            subtitle = menu.Subtitle,
            index = menu.Index,
            total = #menu.Items,
            items = menu.Items
        }
    })

    RageUI.HandleControls(menu)
end

--- Bouton standard RageUI
--- @param label string
--- @param description string
--- @param style table
--- @param enabled boolean
--- @param actions table
--- @param subMenu table
--- @return boolean
function RageUI.Button(label, description, style, enabled, actions, subMenu)
    if enabled == nil then enabled = true end
    style = style or {}
    actions = actions or {}

    local currentMenu = RageUI.CurrentMenu
    if not currentMenu then return false end

    currentMenu.Options = currentMenu.Options + 1
    local itemIndex = currentMenu.Options

    local isSelected = (currentMenu.Index == itemIndex)

    table.insert(currentMenu.Items, {
        type = "button",
        label = label or "",
        description = description or "",
        selected = isSelected,
        disabled = not enabled,
        rightLabel = style.RightLabel or "",
        rightBadge = style.RightBadge or nil
    })

    local hovered = isSelected and enabled
    local pressed = false

    if hovered then
        if actions.onSelected and type(actions.onSelected) == "function" then
            actions.onSelected()
        end

        if IsControlJustPressed(0, 176) or IsDisabledControlJustPressed(0, 176) then
            pressed = true
            RageUI.PlaySound("HUD_FRONTEND_DEFAULT_SOUNDSET", "SELECT")

            if actions.onActive and type(actions.onActive) == "function" then
                actions.onActive()
            end

            if subMenu then
                RageUI.Visible(currentMenu, false)
                RageUI.Visible(subMenu, true)
            end
        end
    end

    return pressed
end

--- Checkbox RageUI
--- @param label string
--- @param description string
--- @param checked boolean
--- @param style table
--- @param actions table
--- @return boolean
function RageUI.Checkbox(label, description, checked, style, actions)
    style = style or {}
    actions = actions or {}

    local currentMenu = RageUI.CurrentMenu
    if not currentMenu then return false end

    currentMenu.Options = currentMenu.Options + 1
    local itemIndex = currentMenu.Options
    local isSelected = (currentMenu.Index == itemIndex)

    table.insert(currentMenu.Items, {
        type = "checkbox",
        label = label or "",
        description = description or "",
        selected = isSelected,
        checked = checked or false
    })

    if isSelected then
        if IsControlJustPressed(0, 176) or IsDisabledControlJustPressed(0, 176) then
            checked = not checked
            RageUI.PlaySound("HUD_FRONTEND_DEFAULT_SOUNDSET", "SELECT")
            if actions.onChecked and checked and type(actions.onChecked) == "function" then
                actions.onChecked()
            elseif actions.onUnChecked and not checked and type(actions.onUnChecked) == "function" then
                actions.onUnChecked()
            end
            if actions.onChange and type(actions.onChange) == "function" then
                actions.onChange(checked)
            end
        end
    end

    return checked
end

--- Liste défilante RageUI
--- @param label string
--- @param items table
--- @param index number
--- @param description string
--- @param style table
--- @param enabled boolean
--- @param actions table
--- @return number
function RageUI.List(label, items, index, description, style, enabled, actions)
    if enabled == nil then enabled = true end
    items = items or {}
    index = index or 1
    actions = actions or {}

    local currentMenu = RageUI.CurrentMenu
    if not currentMenu then return index end

    currentMenu.Options = currentMenu.Options + 1
    local itemIndex = currentMenu.Options
    local isSelected = (currentMenu.Index == itemIndex)

    local currentItemText = ""
    if items[index] then
        currentItemText = type(items[index]) == "table" and (items[index].Name or items[index].label or tostring(index)) or tostring(items[index])
    end

    table.insert(currentMenu.Items, {
        type = "list",
        label = label or "",
        description = description or "",
        selected = isSelected,
        disabled = not enabled,
        value = currentItemText,
        index = index,
        max = #items
    })

    if isSelected and enabled then
        if IsControlJustPressed(0, 174) or IsDisabledControlJustPressed(0, 174) then -- Gauche
            index = index - 1
            if index < 1 then index = #items end
            RageUI.PlaySound("HUD_FRONTEND_DEFAULT_SOUNDSET", "NAV_LEFT_RIGHT")
            if actions.onListChange and type(actions.onListChange) == "function" then
                actions.onListChange(index, items[index])
            end
        elseif IsControlJustPressed(0, 175) or IsDisabledControlJustPressed(0, 175) then -- Droite
            index = index + 1
            if index > #items then index = 1 end
            RageUI.PlaySound("HUD_FRONTEND_DEFAULT_SOUNDSET", "NAV_LEFT_RIGHT")
            if actions.onListChange and type(actions.onListChange) == "function" then
                actions.onListChange(index, items[index])
            end
        elseif IsControlJustPressed(0, 176) or IsDisabledControlJustPressed(0, 176) then -- Valider
            RageUI.PlaySound("HUD_FRONTEND_DEFAULT_SOUNDSET", "SELECT")
            if actions.onSelected and type(actions.onSelected) == "function" then
                actions.onSelected(index, items[index])
            end
        end
    end

    return index
end

--- Séparateur textuel
--- @param label string
function RageUI.Separator(label)
    local currentMenu = RageUI.CurrentMenu
    if not currentMenu then return end

    currentMenu.Options = currentMenu.Options + 1

    table.insert(currentMenu.Items, {
        type = "separator",
        label = label or ""
    })
end

--- Ligne de séparation
function RageUI.Line()
    RageUI.Separator("---")
end

--- Gestion des contrôles clavier / manette lorsque le menu est ouvert
--- @param menu table
function RageUI.HandleControls(menu)
    DisableControlAction(0, 27, true)  -- Téléphone
    DisableControlAction(0, 172, true) -- Flèche Haut
    DisableControlAction(0, 173, true) -- Flèche Bas
    DisableControlAction(0, 174, true) -- Flèche Gauche
    DisableControlAction(0, 175, true) -- Flèche Droite
    DisableControlAction(0, 176, true) -- Entrée
    DisableControlAction(0, 177, true) -- Retour / Echap / Clic Droit

    if IsDisabledControlJustPressed(0, 172) then -- Haut
        menu.Index = menu.Index - 1
        if menu.Index < 1 then
            menu.Index = math.max(1, menu.Options)
        end
        RageUI.PlaySound("HUD_FRONTEND_DEFAULT_SOUNDSET", "NAV_UP_DOWN")
    elseif IsDisabledControlJustPressed(0, 173) then -- Bas
        menu.Index = menu.Index + 1
        if menu.Index > menu.Options then
            menu.Index = 1
        end
        RageUI.PlaySound("HUD_FRONTEND_DEFAULT_SOUNDSET", "NAV_UP_DOWN")
    elseif IsDisabledControlJustPressed(0, 177) then -- Retour
        RageUI.PlaySound("HUD_FRONTEND_DEFAULT_SOUNDSET", "BACK")
        if menu.Parent ~= nil then
            RageUI.Visible(menu, false)
            RageUI.Visible(menu.Parent, true)
        else
            RageUI.Visible(menu, false)
        end
    end
end

--- Export pour d'autres ressources FiveM
function GetRageUI()
    return RageUI
end
