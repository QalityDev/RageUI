Config = Config or { MenuColor = { 83, 18, 127 } }

local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = type
L1_1 = pairs
L2_1 = PlaySoundFrontend
L3_1 = SendNUIMessage
L4_1 = {}
RageUI = L4_1
L4_1 = RageUI
L5_1 = {}
L4_1.Menus = L5_1
L4_1 = RageUI
L4_1.CurrentMenu = nil
L4_1 = RageUI
L4_1.NextMenu = nil
L4_1 = RageUI
L4_1.Options = 0
L4_1 = RageUI
L4_1.LastControl = false
L4_1 = RageUI
L5_1 = {}
L6_1 = {}
L5_1.items = L6_1
L5_1.nbItems = 0
L5_1.changed = true
L5_1.selectionOnly = false
L5_1.selectedItemIdx = 0
L5_1.forceUpdate = true
L4_1.RenderedNui = L5_1
L4_1 = RageUI
L5_1 = {}
L6_1 = {}
L7_1 = {}
L7_1.Enabled = true
L8_1 = {}
L9_1 = 172
L8_1[1] = L9_1
L7_1.Keys = L8_1
L7_1.Active = false
L6_1.Up = L7_1
L7_1 = {}
L7_1.Enabled = true
L8_1 = {}
L9_1 = 173
L8_1[1] = L9_1
L7_1.Keys = L8_1
L7_1.Active = false
L6_1.Down = L7_1
L7_1 = {}
L7_1.Enabled = true
L8_1 = {}
L9_1 = 174
L8_1[1] = L9_1
L7_1.Keys = L8_1
L7_1.Active = false
L6_1.Left = L7_1
L7_1 = {}
L7_1.Enabled = true
L8_1 = {}
L9_1 = 175
L8_1[1] = L9_1
L7_1.Keys = L8_1
L7_1.Active = false
L6_1.Right = L7_1
L7_1 = {}
L7_1.Enabled = true
L8_1 = {}
L9_1 = 176
L10_1 = 201
L11_1 = 191
L8_1[1] = L9_1
L8_1[2] = L10_1
L8_1[3] = L11_1
L7_1.Keys = L8_1
L7_1.Active = false
L6_1.Select = L7_1
L7_1 = {}
L7_1.Enabled = true
L8_1 = {}
L9_1 = 177
L8_1[1] = L9_1
L7_1.Keys = L8_1
L7_1.Active = false
L6_1.Back = L7_1
L5_1.Controls = L6_1
L6_1 = {}
L6_1.Use = "default"
L7_1 = {}
L8_1 = {}
L8_1.audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET"
L8_1.audioRef = "NAV_UP_DOWN"
L7_1.UpDown = L8_1
L8_1 = {}
L8_1.audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET"
L8_1.audioRef = "NAV_LEFT_RIGHT"
L7_1.LeftRight = L8_1
L8_1 = {}
L8_1.audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET"
L8_1.audioRef = "SELECT"
L7_1.Select = L8_1
L8_1 = {}
L8_1.audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET"
L8_1.audioRef = "BACK"
L7_1.Back = L8_1
L8_1 = {}
L8_1.audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET"
L8_1.audioRef = "ERROR"
L7_1.Error = L8_1
L6_1.default = L7_1
L5_1.Audio = L6_1
L4_1.Settings = L5_1
L4_1 = {}
L4_1.__index = L4_1
function L5_1(A0_2)
  local L1_2
  L1_2 = A0_2.Open
  return L1_2
end
L4_1.__call = L5_1
function L5_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = L0_1
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if "function" == L3_2 then
    L3_2 = table
    L3_2 = L3_2.insert
    L4_2 = A0_2.Opened
    L5_2 = A1_2
    L3_2(L4_2, L5_2)
  else
    L3_2 = L0_1
    L4_2 = A1_2
    L3_2 = L3_2(L4_2)
    if "string" == L3_2 then
      L3_2 = L0_1
      L4_2 = A2_2
      L3_2 = L3_2(L4_2)
      if "function" == L3_2 then
        L3_2 = A0_2.Opened
        L3_2[A1_2] = A2_2
      end
    end
  end
end
L4_1.OnOpened = L5_1
function L5_1(A0_2, A1_2)
  local L2_2
  L2_2 = A0_2.Opened
  L2_2[A1_2] = nil
end
L4_1.RemoveOnOpened = L5_1
function L5_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = L0_1
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if "function" == L3_2 then
    L3_2 = table
    L3_2 = L3_2.insert
    L4_2 = A0_2.Closed
    L5_2 = A1_2
    L3_2(L4_2, L5_2)
  else
    L3_2 = L0_1
    L4_2 = A1_2
    L3_2 = L3_2(L4_2)
    if "string" == L3_2 then
      L3_2 = A0_2.Closed
      L3_2[A1_2] = A2_2
    end
  end
end
L4_1.OnClosed = L5_1
function L5_1(A0_2, A1_2)
  local L2_2
  L2_2 = A0_2.Closed
  L2_2[A1_2] = nil
end
L4_1.RemoveOnClosed = L5_1
function L5_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  L3_2 = tonumber
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = A0_2.X
  end
  A0_2.X = L3_2
  L3_2 = tonumber
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = A0_2.Y
  end
  A0_2.Y = L3_2
end
L4_1.SetPosition = L5_1
L5_1 = RageUI
function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = L2_1
  L3_2 = -1
  L4_2 = A1_2
  L5_2 = A0_2
  L6_2 = true
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L5_1.PlaySound = L6_1
L5_1 = RageUI
function L6_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = assert
  L4_2 = L0_1
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L4_2 = "string" == L4_2
  L5_2 = "Menu ref must be a string"
  L3_2(L4_2, L5_2)
  L3_2 = Config
  L3_2 = L3_2.MenuColor
  if L3_2 then
    L3_2 = "rgb:"
    L4_2 = Config
    L4_2 = L4_2.MenuColor
    L4_2 = L4_2[1]
    L5_2 = ","
    L6_2 = Config
    L6_2 = L6_2.MenuColor
    L6_2 = L6_2[2]
    L7_2 = ","
    L8_2 = Config
    L8_2 = L8_2.MenuColor
    L8_2 = L8_2[3]
    L3_2 = L3_2 .. L4_2 .. L5_2 .. L6_2 .. L7_2 .. L8_2
    if L3_2 then
      goto lbl_31
    end
  end
  L3_2 = "flashfa"
  ::lbl_31::
  L4_2 = rawget
  L5_2 = _G
  L6_2 = "PlayerOptions"
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 then
    L5_2 = L4_2.menuBackgroundWhite
    if L5_2 then
      L5_2 = "whitehover:"
      L6_2 = L3_2
      L5_2 = L5_2 .. L6_2
      if L5_2 then
        goto lbl_46
      end
    end
  end
  L5_2 = L3_2
  ::lbl_46::
  if L4_2 then
    L6_2 = L4_2.menuRight
    if L6_2 then
      L6_2 = "right"
      if L6_2 then
        goto lbl_55
      end
    end
  end
  L6_2 = "left"
  ::lbl_55::
  L7_2 = {}
  L7_2.Ref = A0_2
  L8_2 = A1_2 or L8_2
  if not A1_2 then
    L8_2 = ""
  end
  L7_2.Title = L8_2
  L8_2 = A2_2 or L8_2
  if not A2_2 then
    L8_2 = ""
  end
  L9_2 = L8_2
  L8_2 = L8_2.upper
  L8_2 = L8_2(L9_2)
  L7_2.Subtitle = L8_2
  L7_2.Description = nil
  L7_2.HeaderImg = nil
  L7_2.Parent = nil
  L7_2.Open = false
  L7_2.Index = 1
  L7_2.Options = 0
  L7_2.Closable = true
  L8_2 = {}
  L7_2.Opened = L8_2
  L8_2 = {}
  L7_2.Closed = L8_2
  L7_2.onIndexChange = nil
  L7_2.Theme = L5_2
  L7_2.Position = L6_2
  L8_2 = {}
  L8_2.Minimum = 1
  L8_2.Maximum = 16
  L8_2.Total = 16
  L7_2.Pagination = L8_2
  L8_2 = setmetatable
  L9_2 = L7_2
  L10_2 = L4_1
  L8_2(L9_2, L10_2)
  L8_2 = RageUI
  L8_2 = L8_2.Menus
  L8_2[A0_2] = L7_2
  return L7_2
end
L5_1.CreateMenu = L6_1
L5_1 = RageUI
function L6_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2
  L4_2 = assert
  L5_2 = L0_1
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  L5_2 = "string" == L5_2
  L6_2 = "SubMenu ref must be a string"
  L4_2(L5_2, L6_2)
  L4_2 = assert
  L5_2 = L0_1
  L6_2 = A1_2
  L5_2 = L5_2(L6_2)
  L5_2 = "string" == L5_2
  L6_2 = "Parent ref must be a string"
  L4_2(L5_2, L6_2)
  L4_2 = RageUI
  L4_2 = L4_2.Menus
  L4_2 = L4_2[A1_2]
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = RageUI
    L0_3 = L0_3.CreateMenu
    L1_3 = A0_2
    L2_3 = A2_2
    if not L2_3 then
      L2_3 = L4_2.Title
    end
    L3_3 = A3_2
    if not L3_3 then
      L3_3 = L4_2.Subtitle
    end
    L0_3 = L0_3(L1_3, L2_3, L3_3)
    L1_3 = L4_2
    L0_3.Parent = L1_3
    return L0_3
  end
  if L4_2 then
    L6_2 = L5_2
    return L6_2()
  end
  L6_2 = CreateThread
  function L7_2()
    local L0_3, L1_3
    while true do
      L0_3 = RageUI
      L0_3 = L0_3.Menus
      L1_3 = A1_2
      L0_3 = L0_3[L1_3]
      if L0_3 then
        break
      end
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
    end
    L0_3 = RageUI
    L0_3 = L0_3.Menus
    L1_3 = A1_2
    L0_3 = L0_3[L1_3]
    L4_2 = L0_3
    L0_3 = L5_2
    L0_3()
  end
  L6_2(L7_2)
end
L5_1.CreateSubMenu = L6_1
L5_1 = RageUI
function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if not A0_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = L0_1
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if "boolean" ~= L2_2 then
    L2_2 = A0_2.Open
    return L2_2
  end
  if A1_2 then
    L2_2 = RageUI
    L2_2 = L2_2.CurrentMenu
    if L2_2 then
      L2_2 = RageUI
      L2_2 = L2_2.CurrentMenu
      if L2_2 ~= A0_2 then
        L2_2 = RageUI
        L2_2 = L2_2.CurrentMenu
        L2_2.Open = false
      end
    end
    A0_2.Open = true
    L2_2 = A0_2.Index
    if L2_2 then
      L2_2 = A0_2.Index
      if not (L2_2 < 1) then
        goto lbl_33
      end
    end
    A0_2.Index = 1
    ::lbl_33::
    L2_2 = A0_2.Index
    L3_2 = A0_2.Pagination
    L3_2 = L3_2.Total
    if L2_2 > L3_2 then
      L4_2 = A0_2.Pagination
      L5_2 = math
      L5_2 = L5_2.max
      L6_2 = 1
      L7_2 = L2_2 - L3_2
      L7_2 = L7_2 + 1
      L5_2 = L5_2(L6_2, L7_2)
      L4_2.Minimum = L5_2
      L4_2 = A0_2.Pagination
      L4_2.Maximum = L2_2
    else
      L4_2 = A0_2.Pagination
      L4_2.Minimum = 1
      L4_2 = A0_2.Pagination
      L4_2.Maximum = L3_2
    end
    L4_2 = RageUI
    L4_2.CurrentMenu = A0_2
    L4_2 = RageUI
    L4_2.Options = 0
    L4_2 = RageUI
    L4_2.TransitionConsumeSelect = true
    L4_2 = RageUI
    L4_2 = L4_2.Settings
    if L4_2 then
      L4_2 = RageUI
      L4_2 = L4_2.Settings
      L4_2 = L4_2.Controls
    end
    if L4_2 then
      L5_2 = L4_2.Select
      if L5_2 then
        L5_2 = L4_2.Select
        L5_2.Active = false
      end
    end
    L5_2 = RageUI
    L5_2.LastControl = false
    L5_2 = L1_1
    L6_2 = A0_2.Opened
    L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
    for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
      L11_2 = L0_1
      L12_2 = L10_2
      L11_2 = L11_2(L12_2)
      if "function" == L11_2 then
        L11_2 = L10_2
        L11_2()
      end
    end
    L5_2 = RageUI
    L5_2 = L5_2.RenderedNui
    L5_2.forceUpdate = true
    L5_2 = L3_1
    L6_2 = {}
    L6_2.action = "menu:show"
    L5_2(L6_2)
  else
    A0_2.Open = false
    L2_2 = RageUI
    L2_2 = L2_2.CurrentMenu
    if L2_2 == A0_2 then
      L2_2 = RageUI
      L2_2.CurrentMenu = nil
    end
    L2_2 = L0_1
    L3_2 = A0_2.Closed
    L2_2 = L2_2(L3_2)
    if "function" == L2_2 then
      L2_2 = A0_2.Closed
      L2_2()
    else
      L2_2 = L0_1
      L3_2 = A0_2.Closed
      L2_2 = L2_2(L3_2)
      if "table" == L2_2 then
        L2_2 = L1_1
        L3_2 = A0_2.Closed
        L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
        for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
          L8_2 = L0_1
          L9_2 = L7_2
          L8_2 = L8_2(L9_2)
          if "function" == L8_2 then
            L8_2 = L7_2
            L8_2()
          end
        end
      end
    end
    L2_2 = L3_1
    L3_2 = {}
    L3_2.action = "menu:hide"
    L2_2(L3_2)
  end
  L2_2 = RageUI
  L2_2.Options = 0
  L2_2 = RageUI
  L2_2.LastControl = false
end
L5_1.Visible = L6_1

function RageUI.IsVisible(menuRef, callback)
    local menu = type(menuRef) == "string" and RageUI.Menus[menuRef] or menuRef
    if menu and menu.Open then
        RageUI.CurrentMenu = menu
        if callback and type(callback) == "function" then
            callback()
        end
        return true
    end
    return false
end

local origVisible = RageUI.Visible
function RageUI.Visible(menuRef, state)
    local menu = type(menuRef) == "string" and RageUI.Menus[menuRef] or menuRef
    if menu then
        if state == true then
            if RageUI.RenderedNui then
                RageUI.RenderedNui.forceUpdate = true
                RageUI.RenderedNui.changed = true
                RageUI.RenderedNui.selectionOnly = false
                RageUI.RenderedNui._selectedIndex = nil
                RageUI.RenderedNui._title = nil
                RageUI.RenderedNui._subtitle = nil
                RageUI.RenderedNui._option = nil
            end
        end
        return origVisible(menu, state)
    end
    return false
end
L5_1 = RageUI
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = RageUI
  L0_2 = L0_2.CurrentMenu
  if not L0_2 then
    return
  end
  L0_2 = RageUI
  L0_2 = L0_2.Settings
  L0_2 = L0_2.Audio
  L1_2 = RageUI
  L1_2 = L1_2.PlaySound
  L2_2 = L0_2.Use
  L2_2 = L0_2[L2_2]
  L2_2 = L2_2.Back
  L2_2 = L2_2.audioName
  L3_2 = L0_2.Use
  L3_2 = L0_2[L3_2]
  L3_2 = L3_2.Back
  L3_2 = L3_2.audioRef
  L1_2(L2_2, L3_2)
  L1_2 = RageUI
  L1_2 = L1_2.CurrentMenu
  L1_2 = L1_2.Parent
  if L1_2 then
    L2_2 = RageUI
    L2_2.NextMenu = L1_2
  else
    L2_2 = RageUI
    L2_2 = L2_2.Visible
    L3_2 = RageUI
    L3_2 = L3_2.CurrentMenu
    L4_2 = false
    L2_2(L3_2, L4_2)
  end
end
L5_1.Close = L6_1
L5_1 = RageUI
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = RageUI
  L0_2 = L0_2.CurrentMenu
  if not L0_2 then
    return
  end
  L0_2 = RageUI
  L0_2 = L0_2.CurrentMenu
  while L0_2 do
    L1_2 = L0_2.Parent
    L0_2.Open = false
    L2_2 = L0_1
    L3_2 = L0_2.Closed
    L2_2 = L2_2(L3_2)
    if "function" == L2_2 then
      L2_2 = L0_2.Closed
      L2_2()
    else
      L2_2 = L0_1
      L3_2 = L0_2.Closed
      L2_2 = L2_2(L3_2)
      if "table" == L2_2 then
        L2_2 = L1_1
        L3_2 = L0_2.Closed
        L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
        for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
          L8_2 = L0_1
          L9_2 = L7_2
          L8_2 = L8_2(L9_2)
          if "function" == L8_2 then
            L8_2 = L7_2
            L8_2()
          end
        end
      end
    end
    L0_2 = L1_2
  end
  L1_2 = RageUI
  L1_2.CurrentMenu = nil
  L1_2 = RageUI
  L1_2.Options = 0
  L1_2 = L3_1
  L2_2 = {}
  L2_2.action = "menu:hide"
  L1_2(L2_2)
end
L5_1.CloseAll = L6_1
L5_1 = RageUI
function L6_1(A0_2)
  local L1_2
  L1_2 = RageUI
  L1_2 = L1_2.CurrentMenu
  L1_2 = L1_2 == A0_2
  return L1_2
end
L5_1.VisibleOrChild = L6_1
L5_1 = RageUI
function L6_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = RageUI
    L0_3 = L0_3.Menus
    L1_3 = A0_2
    L0_3 = L0_3[L1_3]
    L1_3 = L0_3
    L0_3 = L0_3.OnOpened
    L2_3 = A1_2
    L3_3 = A2_2
    L0_3(L1_3, L2_3, L3_3)
  end
  L4_2 = RageUI
  L4_2 = L4_2.Menus
  L4_2 = L4_2[A0_2]
  if L4_2 then
    L4_2 = L3_2
    L4_2()
  else
    L4_2 = CreateThread
    function L5_2()
      local L0_3, L1_3
      while true do
        L0_3 = RageUI
        L0_3 = L0_3.Menus
        L1_3 = A0_2
        L0_3 = L0_3[L1_3]
        if L0_3 then
          break
        end
        L0_3 = Wait
        L1_3 = 0
        L0_3(L1_3)
      end
      L0_3 = L3_2
      L0_3()
    end
    L4_2(L5_2)
  end
end
L5_1.OnOpened = L6_1
L5_1 = RageUI
function L6_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = RageUI
    L0_3 = L0_3.Menus
    L1_3 = A0_2
    L0_3 = L0_3[L1_3]
    L1_3 = L0_3
    L0_3 = L0_3.OnClosed
    L2_3 = A1_2
    L3_3 = A2_2
    L0_3(L1_3, L2_3, L3_3)
  end
  L4_2 = RageUI
  L4_2 = L4_2.Menus
  L4_2 = L4_2[A0_2]
  if L4_2 then
    L4_2 = L3_2
    L4_2()
  else
    L4_2 = CreateThread
    function L5_2()
      local L0_3, L1_3
      while true do
        L0_3 = RageUI
        L0_3 = L0_3.Menus
        L1_3 = A0_2
        L0_3 = L0_3[L1_3]
        if L0_3 then
          break
        end
        L0_3 = Wait
        L1_3 = 0
        L0_3(L1_3)
      end
      L0_3 = L3_2
      L0_3()
    end
    L4_2(L5_2)
  end
end
L5_1.OnClosed = L6_1
