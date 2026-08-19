PlayerOptions = PlayerOptions or {}

local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = type
L1_1 = pairs
L2_1 = math
L2_1 = L2_1.max
L3_1 = SendNUIMessage
L4_1 = RageUI
function L5_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = L0_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "string" == L2_2 then
    L2_2 = RageUI
    L2_2 = L2_2.Menus
    A0_2 = L2_2[A0_2]
  end
  if not A0_2 then
    return
  end
  L2_2 = RageUI
  L2_2 = L2_2.CurrentMenu
  if L2_2 ~= A0_2 then
    return
  end
  L2_2 = A0_2
  L2_2 = L2_2()
  if not L2_2 then
    return
  end
  L2_2 = RageUI
  L2_2 = L2_2.ProcessControls
  L2_2()
  L2_2 = RageUI
  L2_2 = L2_2.RenderedNui
  L2_2.nbItems = 0
  L2_2.changed = false
  L2_2.selectionOnly = true
  L2_2.selectedItemIdx = 0
  L3_2 = RageUI
  L3_2.Options = 0
  if A1_2 then
    L3_2 = A1_2
    L3_2()
  end
  L3_2 = RageUI
  L3_2 = L3_2.Render
  L3_2()
end
L4_1.IsVisible = L5_1
L4_1 = RageUI
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L0_2 = RageUI
  L0_2 = L0_2.CurrentMenu
  if L0_2 then
    L1_2 = L0_2
    L1_2 = L1_2()
    if L1_2 then
      goto lbl_10
    end
  end
  do return end
  ::lbl_10::
  L1_2 = RageUI
  L1_2 = L1_2.Options
  L0_2.Options = L1_2
  L1_2 = L0_2.Options
  if L1_2 > 0 then
    L1_2 = L0_2.Index
    L2_2 = L0_2.Options
    if L1_2 > L2_2 then
      L1_2 = L0_2.Options
      L0_2.Index = L1_2
    end
    L1_2 = L0_2.Index
    if L1_2 < 1 then
      L0_2.Index = 1
    end
    L1_2 = L0_2.Pagination
    if L1_2 then
      L2_2 = L1_2.Total
      if L2_2 then
        L2_2 = L1_2.Minimum
        if not L2_2 then
          L2_2 = 1
        end
        L3_2 = L1_2.Maximum
        if not L3_2 then
          L3_2 = L1_2.Total
        end
        L4_2 = L0_2.Index
        if not (L2_2 > L4_2) then
          L4_2 = L0_2.Index
          if not (L3_2 < L4_2) then
            L4_2 = L0_2.Options
            if not (L2_2 > L4_2) then
              goto lbl_72
            end
          end
        end
        L4_2 = L0_2.Index
        L5_2 = L1_2.Total
        if L4_2 > L5_2 then
          L4_2 = L0_2.Index
          L5_2 = L1_2.Total
          L4_2 = L4_2 - L5_2
          L4_2 = L4_2 + 1
          L1_2.Minimum = L4_2
          L4_2 = L0_2.Index
          L1_2.Maximum = L4_2
        else
          L1_2.Minimum = 1
          L4_2 = L1_2.Total
          L1_2.Maximum = L4_2
        end
        L4_2 = RageUI
        L4_2 = L4_2.RenderedNui
        if L4_2 then
          L4_2.changed = true
          L4_2.selectionOnly = false
        end
      end
    end
  end
  ::lbl_72::
  L1_2 = RageUI
  L1_2 = L1_2.RenderedNui
  L2_2 = RageUI
  L2_2 = L2_2.NextMenu
  if L2_2 then
    L1_2.selectionOnly = false
    L1_2.forceUpdate = true
    L2_2 = RageUI
    L2_2 = L2_2.NextMenu
    L3_2 = RageUI
    L3_2.NextMenu = nil
    L3_2 = RageUI
    L3_2.TransitionConsumeSelect = true
    L3_2 = RageUI
    L3_2 = L3_2.Settings
    L3_2 = L3_2.Controls
    if L3_2 then
      L4_2 = L3_2.Select
      if L4_2 then
        L4_2 = L3_2.Select
        L4_2.Active = false
      end
    end
    L4_2 = RageUI
    L4_2.LastControl = false
    L4_2 = RageUI
    L4_2 = L4_2.CurrentMenu
    if L4_2 then
      L4_2 = RageUI
      L4_2 = L4_2.CurrentMenu
      L4_2.Open = false
    end
    L2_2.Open = true
    L4_2 = L2_2.Index
    L5_2 = L2_2.Pagination
    L5_2 = L5_2.Total
    if L4_2 > L5_2 then
      L6_2 = L2_2.Pagination
      L7_2 = L2_1
      L8_2 = 1
      L9_2 = L4_2 - L5_2
      L9_2 = L9_2 + 1
      L7_2 = L7_2(L8_2, L9_2)
      L6_2.Minimum = L7_2
      L6_2 = L2_2.Pagination
      L6_2.Maximum = L4_2
    else
      L6_2 = L2_2.Pagination
      L6_2.Minimum = 1
      L6_2 = L2_2.Pagination
      L6_2.Maximum = L5_2
    end
    L6_2 = RageUI
    L6_2.CurrentMenu = L2_2
    L6_2 = L1_1
    L7_2 = L2_2.Opened
    L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
    for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
      L12_2 = L0_1
      L13_2 = L11_2
      L12_2 = L12_2(L13_2)
      if "function" == L12_2 then
        L12_2 = L11_2
        L12_2()
      end
    end
  end
  L2_2 = L1_2.nbItems
  L3_2 = L1_2.items
  L4_2 = #L3_2
  if L2_2 < L4_2 then
    L5_2 = L4_2
    L6_2 = L2_2 + 1
    L7_2 = -1
    for L8_2 = L5_2, L6_2, L7_2 do
      L3_2[L8_2] = nil
    end
    L1_2.changed = true
    L1_2.selectionOnly = false
  end
  L5_2 = L0_2.Title
  if not L5_2 then
    L5_2 = ""
  end
  L6_2 = L0_2.Subtitle
  if not L6_2 then
    L6_2 = ""
  end
  L7_2 = L0_2.Index
  L8_2 = L0_2.Options
  L9_2 = L0_2.Theme
  if not L9_2 then
    L9_2 = "flashfa"
  end
  L10_2 = L0_2.Position
  if not L10_2 then
    L10_2 = "left"
  end
  L11_2 = L1_2._title
  if L11_2 ~= L5_2 then
    L1_2._title = L5_2
    L1_2.changed = true
    L1_2.selectionOnly = false
  end
  L11_2 = L1_2._subtitle
  if L11_2 ~= L6_2 then
    L1_2._subtitle = L6_2
    L1_2.changed = true
    L1_2.selectionOnly = false
  end
  L11_2 = L1_2._selectedIndex
  if L11_2 ~= L7_2 then
    L1_2._selectedIndex = L7_2
    L1_2.changed = true
  end
  L11_2 = L1_2._option
  if L11_2 ~= L8_2 then
    L1_2._option = L8_2
    L1_2.changed = true
    L1_2.selectionOnly = false
  end
  L11_2 = L1_2._theme
  if L11_2 ~= L9_2 then
    L1_2._theme = L9_2
    L1_2.changed = true
    L1_2.selectionOnly = false
  end
  L11_2 = L1_2._position
  if L11_2 ~= L10_2 then
    L1_2._position = L10_2
    L1_2.changed = true
    L1_2.selectionOnly = false
  end
  L11_2 = L1_2.changed
  if not L11_2 then
    L11_2 = L1_2.forceUpdate
    if not L11_2 then
      goto lbl_266
    end
  end
  L11_2 = L1_2.selectionOnly
  if L11_2 then
    L11_2 = L1_2.forceUpdate
    if not L11_2 then
      L11_2 = L1_2.selectedItemIdx
      L11_2 = L3_2[L11_2]
      L12_2 = L3_1
      L13_2 = {}
      L13_2.action = "menu:select"
      L14_2 = {}
      L14_2.index = L7_2
      L14_2.option = L8_2
      L15_2 = L1_2.selectedItemIdx
      L15_2 = L15_2 - 1
      L14_2.itemIdx = L15_2
      L14_2.items = L3_2
      if L11_2 then
        L15_2 = L11_2.description
        if L15_2 then
          goto lbl_243
        end
      end
      L15_2 = nil
      ::lbl_243::
      L14_2.description = L15_2
      L13_2.data = L14_2
      L12_2(L13_2)
  end
  else
    L1_2.forceUpdate = false
    L11_2 = L3_1
    L12_2 = {}
    L12_2.action = "menu:update"
    L13_2 = {}
    L13_2.headingTitle = L5_2
    L13_2.headingSubtitle = L6_2
    L13_2.selectedIndex = L7_2
    L13_2.option = L8_2
    L13_2.theme = L9_2
    L13_2.position = L10_2
    L14_2 = L0_2.HeaderImg
    L13_2.headerImg = L14_2
    L13_2.items = L3_2
    L12_2.data = L13_2
    L11_2(L12_2)
  end
  L1_2.changed = false
  ::lbl_266::
end
L4_1.Render = L5_1
L4_1 = RageUI
function L5_1(A0_2, A1_2, A2_2)
  if A2_2 then
  end
end
L4_1.ItemsDescription = L5_1
L4_1 = {}
MenuLoops = L4_1
L4_1 = {}
MenuTickFunctions = L4_1
L4_1 = RageUI
function L5_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = L0_1
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if "table" == L3_2 then
    L3_2 = ipairs
    L4_2 = A0_2
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = RageUI
      L9_2 = L9_2.CreateLoop
      L10_2 = L8_2
      L11_2 = A1_2
      L12_2 = A2_2
      L9_2(L10_2, L11_2, L12_2)
    end
    return
  end
  L3_2 = MenuLoops
  L3_2 = L3_2[A0_2]
  if not L3_2 then
    L3_2 = MenuLoops
    L4_2 = {}
    L3_2[A0_2] = L4_2
  end
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = MenuLoops
  L4_2 = L4_2[A0_2]
  L5_2 = {}
  L6_2 = A1_2 or L6_2
  if not A1_2 then
    L6_2 = 0
  end
  L5_2.Interval = L6_2
  L5_2.Func = A2_2
  L3_2(L4_2, L5_2)
end
L4_1.CreateLoop = L5_1
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = ipairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = MenuTickFunctions
    L8_2[L7_2] = A1_2
  end
end
AddTickMenu = L4_1
L4_1 = CreateThread
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = false
  while true do
    L1_2 = RageUI
    L1_2 = L1_2.CurrentMenu
    if L1_2 then
      L1_2 = RageUI
      L1_2 = L1_2.CurrentMenu
      L1_2 = L1_2.Ref
      L2_2 = PlayerOptions
      L2_2 = L2_2.hideChatWhenMenu
      if L2_2 and not L0_2 then
        L2_2 = pcall
        function L3_2()
          local L0_3, L1_3, L2_3
          L0_3 = exports
          L0_3 = L0_3.chat
          L1_3 = L0_3
          L0_3 = L0_3.SetMenuDisplaying
          L2_3 = true
          L0_3(L1_3, L2_3)
        end
        L2_2(L3_2)
        L0_2 = true
      else
        L2_2 = PlayerOptions
        L2_2 = L2_2.hideChatWhenMenu
        if not L2_2 and L0_2 then
          L2_2 = pcall
          function L3_2()
            local L0_3, L1_3, L2_3
            L0_3 = exports
            L0_3 = L0_3.chat
            L1_3 = L0_3
            L0_3 = L0_3.SetMenuDisplaying
            L2_3 = false
            L0_3(L1_3, L2_3)
          end
          L2_2(L3_2)
          L0_2 = false
        end
      end
      L2_2 = MenuTickFunctions
      L2_2 = L2_2[L1_2]
      if L2_2 then
        L2_2 = MenuTickFunctions
        L2_2 = L2_2[L1_2]
        L2_2()
      end
      L2_2 = MenuLoops
      L2_2 = L2_2[L1_2]
      if L2_2 then
        L2_2 = ipairs
        L3_2 = MenuLoops
        L3_2 = L3_2[L1_2]
        L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
        for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
          L8_2 = L7_2.LastTime
          if L8_2 then
            L8_2 = GetGameTimer
            L8_2 = L8_2()
            L9_2 = L7_2.LastTime
            L8_2 = L8_2 - L9_2
            L9_2 = L7_2.Interval
            if not L9_2 then
              L9_2 = 0
            end
            if not (L8_2 >= L9_2) then
              goto lbl_65
            end
          end
          L8_2 = GetGameTimer
          L8_2 = L8_2()
          L7_2.LastTime = L8_2
          L8_2 = L7_2.Func
          L8_2()
          ::lbl_65::
        end
      end
      L2_2 = Wait
      L3_2 = 0
      L2_2(L3_2)
    else
      if L0_2 then
        L1_2 = pcall
        function L2_2()
          local L0_3, L1_3, L2_3
          L0_3 = exports
          L0_3 = L0_3.chat
          L1_3 = L0_3
          L0_3 = L0_3.SetMenuDisplaying
          L2_3 = false
          L0_3(L1_3, L2_3)
        end
        L1_2(L2_2)
        L0_2 = false
      end
      L1_2 = Wait
      L2_2 = 200
      L1_2(L2_2)
    end
  end
end
L4_1(L5_1)
L4_1 = AddEventHandler
L5_1 = "onResourceStart"
function L6_1(A0_2)
  local L1_2, L2_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if L1_2 ~= A0_2 then
    return
  end
  L1_2 = pcall
  function L2_2()
    local L0_3, L1_3, L2_3
    L0_3 = exports
    L0_3 = L0_3.chat
    L1_3 = L0_3
    L0_3 = L0_3.SetMenuDisplaying
    L2_3 = false
    L0_3(L1_3, L2_3)
  end
  L1_2(L2_2)
end
L4_1(L5_1, L6_1)
L4_1 = AddEventHandler
L5_1 = "onResourceStop"
function L6_1(A0_2)
  local L1_2, L2_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if L1_2 ~= A0_2 then
    return
  end
  L1_2 = RageUI
  L1_2 = L1_2.CloseAll
  L1_2()
  L1_2 = pcall
  function L2_2()
    local L0_3, L1_3, L2_3
    L0_3 = exports
    L0_3 = L0_3.chat
    L1_3 = L0_3
    L0_3 = L0_3.SetMenuDisplaying
    L2_3 = false
    L0_3(L1_3, L2_3)
  end
  L1_2(L2_2)
end
L4_1(L5_1, L6_1)
L4_1 = exports
L5_1 = "HasMenuOpen"
function L6_1()
  local L0_2, L1_2
  L0_2 = RageUI
  L0_2 = L0_2.CurrentMenu
  L0_2 = nil ~= L0_2
  return L0_2
end
L4_1(L5_1, L6_1)
L4_1 = RageUI
L5_1 = RageUI
L5_1 = L5_1._InputFocusHolders
if not L5_1 then
  L5_1 = {}
end
L4_1._InputFocusHolders = L5_1
L4_1 = RageUI
L4_1._InputFocusLastSet = 0
function L4_1()
  local L0_2, L1_2, L2_2
  L0_2 = next
  L1_2 = RageUI
  L1_2 = L1_2._InputFocusHolders
  L0_2 = L0_2(L1_2)
  L0_2 = nil ~= L0_2
  L1_2 = RageUI
  L1_2.InputFocus = L0_2
  if L0_2 then
    L1_2 = RageUI
    L2_2 = GetGameTimer
    L2_2 = L2_2()
    L1_2._InputFocusLastSet = L2_2
  end
end
L5_1 = exports
L6_1 = "SetInputFocus"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = GetInvokingResource
  L1_2 = L1_2()
  if not L1_2 then
    L1_2 = "unknown"
  end
  if true == A0_2 then
    L2_2 = RageUI
    L2_2 = L2_2._InputFocusHolders
    L3_2 = GetGameTimer
    L3_2 = L3_2()
    L2_2[L1_2] = L3_2
  else
    L2_2 = RageUI
    L2_2 = L2_2._InputFocusHolders
    L2_2[L1_2] = nil
  end
  L2_2 = L4_1
  L2_2()
end
L5_1(L6_1, L7_1)
L5_1 = AddEventHandler
L6_1 = "onClientResourceStop"
function L7_1(A0_2)
  local L1_2
  L1_2 = RageUI
  L1_2 = L1_2._InputFocusHolders
  L1_2 = L1_2[A0_2]
  if L1_2 then
    L1_2 = RageUI
    L1_2 = L1_2._InputFocusHolders
    L1_2[A0_2] = nil
    L1_2 = L4_1
    L1_2()
  end
end
L5_1(L6_1, L7_1)
L5_1 = CreateThread
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = 0
  while true do
    L1_2 = Wait
    L2_2 = 2000
    L1_2(L2_2)
    L1_2 = RageUI
    L1_2 = L1_2.InputFocus
    if L1_2 then
      L1_2 = false
      L2_2 = L1_1
      L3_2 = RageUI
      L3_2 = L3_2._InputFocusHolders
      L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
      for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
        L8_2 = GetResourceState
        L9_2 = L6_2
        L8_2 = L8_2(L9_2)
        if "started" == L8_2 then
          L1_2 = true
          break
        end
      end
      if not L1_2 then
        L2_2 = RageUI
        L3_2 = {}
        L2_2._InputFocusHolders = L3_2
        L2_2 = RageUI
        L2_2.InputFocus = false
        L0_2 = 0
        L2_2 = print
        L3_2 = "^3[ui_lib] InputFocus auto-released (no live holder)^7"
        L2_2(L3_2)
      else
        L2_2 = IsNuiFocused
        L2_2 = L2_2()
        if not L2_2 then
          if 0 == L0_2 then
            L2_2 = GetGameTimer
            L2_2 = L2_2()
            L0_2 = L2_2
          else
            L2_2 = GetGameTimer
            L2_2 = L2_2()
            L2_2 = L2_2 - L0_2
            L3_2 = 5000
            if L2_2 > L3_2 then
              L2_2 = {}
              L3_2 = L1_1
              L4_2 = RageUI
              L4_2 = L4_2._InputFocusHolders
              L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
              for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
                L9_2 = #L2_2
                L9_2 = L9_2 + 1
                L2_2[L9_2] = L7_2
              end
              L3_2 = RageUI
              L4_2 = {}
              L3_2._InputFocusHolders = L4_2
              L3_2 = RageUI
              L3_2.InputFocus = false
              L0_2 = 0
              L3_2 = print
              L4_2 = "^3[ui_lib] InputFocus auto-released (NUI not focused, holders=[%s])^7"
              L5_2 = L4_2
              L4_2 = L4_2.format
              L6_2 = table
              L6_2 = L6_2.concat
              L7_2 = L2_2
              L8_2 = ", "
              L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2, L8_2)
              L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
              L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
            end
          end
        else
          L0_2 = 0
        end
      end
    else
      L0_2 = 0
    end
  end
end
L5_1(L6_1)
L5_1 = RegisterCommand
L6_1 = "uifix"
function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = {}
  L1_2 = L1_1
  L2_2 = RageUI
  L2_2 = L2_2._InputFocusHolders
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = #L0_2
    L7_2 = L7_2 + 1
    L8_2 = "%s (since %.1fs)"
    L9_2 = L8_2
    L8_2 = L8_2.format
    L10_2 = L5_2
    L11_2 = GetGameTimer
    L11_2 = L11_2()
    L11_2 = L11_2 - L6_2
    L11_2 = L11_2 / 1000
    L8_2 = L8_2(L9_2, L10_2, L11_2)
    L0_2[L7_2] = L8_2
  end
  L1_2 = print
  L2_2 = "^3[ui_lib] /uifix \226\128\148 InputFocus="
  L3_2 = tostring
  L4_2 = RageUI
  L4_2 = L4_2.InputFocus
  L3_2 = L3_2(L4_2)
  L4_2 = " | NuiFocused="
  L5_2 = tostring
  L6_2 = IsNuiFocused
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L6_2()
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L6_2 = " | CurrentMenu="
  L7_2 = tostring
  L8_2 = RageUI
  L8_2 = L8_2.CurrentMenu
  if L8_2 then
    L8_2 = RageUI
    L8_2 = L8_2.CurrentMenu
    L8_2 = L8_2.Ref
    if L8_2 then
      goto lbl_48
    end
  end
  L8_2 = "nil"
  ::lbl_48::
  L7_2 = L7_2(L8_2)
  L8_2 = " | Holders=["
  L9_2 = table
  L9_2 = L9_2.concat
  L10_2 = L0_2
  L11_2 = ", "
  L9_2 = L9_2(L10_2, L11_2)
  L10_2 = "]^7"
  L2_2 = L2_2 .. L3_2 .. L4_2 .. L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2
  L1_2(L2_2)
  L1_2 = RageUI
  L2_2 = {}
  L1_2._InputFocusHolders = L2_2
  L1_2 = RageUI
  L1_2.InputFocus = false
  L1_2 = print
  L2_2 = "^2[ui_lib] InputFocus force-cleared. Try the menu now.^7"
  L1_2(L2_2)
end
L8_1 = false
L5_1(L6_1, L7_1, L8_1)
L5_1 = TriggerEvent
L6_1 = "chat:addSuggestion"
L7_1 = "/uifix"
L8_1 = "Force-d\195\169bloque les inputs ui_lib si le menu ne r\195\169pond plus"
L5_1(L6_1, L7_1, L8_1)
L5_1 = AddEventHandler
L6_1 = "esx:playerLoaded"
function L7_1()
  local L0_2, L1_2
  L0_2 = RageUI
  L1_2 = {}
  L0_2._InputFocusHolders = L1_2
  L0_2 = RageUI
  L0_2.InputFocus = false
  L0_2 = RageUI
  L0_2._InputFocusLastSet = 0
  L0_2 = pcall
  function L1_2()
    local L0_3, L1_3, L2_3
    L0_3 = IsNuiFocused
    L0_3 = L0_3()
    if L0_3 then
      L0_3 = SetNuiFocus
      L1_3 = false
      L2_3 = false
      L0_3(L1_3, L2_3)
    end
  end
  L0_2(L1_2)
end
L5_1(L6_1, L7_1)
L5_1 = AddEventHandler
L6_1 = "playerSpawned"
function L7_1()
  local L0_2, L1_2
  L0_2 = RageUI
  L0_2 = L0_2.InputFocus
  if L0_2 then
    L0_2 = next
    L1_2 = RageUI
    L1_2 = L1_2._InputFocusHolders
    L0_2 = L0_2(L1_2)
    if nil == L0_2 then
      L0_2 = RageUI
      L0_2.InputFocus = false
    end
  end
end
L5_1(L6_1, L7_1)
L5_1 = exports
L6_1 = "CloseMenu"
function L7_1()
  local L0_2, L1_2
  L0_2 = RageUI
  L0_2 = L0_2.CloseAll
  L0_2()
end
L5_1(L6_1, L7_1)
L5_1 = exports
L6_1 = "GetRageUI"
function L7_1()
  local L0_2, L1_2
  L0_2 = RageUI
  return L0_2
end
L5_1(L6_1, L7_1)
L5_1 = exports
L6_1 = "GetPlayerOptions"
function L7_1()
  local L0_2, L1_2
  L0_2 = PlayerOptions
  return L0_2
end
L5_1(L6_1, L7_1)
L5_1 = exports
L6_1 = "GetPlayerOption"
function L7_1(A0_2)
  local L1_2
  L1_2 = PlayerOptions
  if L1_2 then
    L1_2 = PlayerOptions
    L1_2 = L1_2[A0_2]
    return L1_2
  end
  L1_2 = nil
  return L1_2
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "ui_lib:openMenu"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = RageUI
  L1_2 = L1_2.Menus
  L1_2 = L1_2[A0_2]
  if L1_2 then
    L2_2 = RageUI
    L2_2 = L2_2.Visible
    L3_2 = L1_2
    L4_2 = true
    L2_2(L3_2, L4_2)
  end
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "ui_lib:closeMenu"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if A0_2 then
    L1_2 = RageUI
    L1_2 = L1_2.Menus
    L1_2 = L1_2[A0_2]
    if L1_2 then
      L2_2 = RageUI
      L2_2 = L2_2.Visible
      L3_2 = L1_2
      L4_2 = false
      L2_2(L3_2, L4_2)
    end
  else
    L1_2 = RageUI
    L1_2 = L1_2.CloseAll
    L1_2()
  end
end
L5_1(L6_1, L7_1)
L5_1 = CreateThread
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2
  L0_2 = GetCurrentResourceName
  L0_2 = L0_2()
  L1_2 = {}
  L2_2 = "animals.ytd"
  L3_2 = "fb_overlay_txd.ytd"
  L4_2 = "flashback.ytd"
  L5_2 = "minimap.ytd"
  L6_2 = "mp_gamer_info.ytd"
  L7_2 = "other.ytd"
  L8_2 = "pointer.ytd"
  L9_2 = "rope.ytd"
  L10_2 = "sim_brand.ytd"
  L11_2 = "switchgame.ytd"
  L12_2 = "ui_drift.ytd"
  L13_2 = "aAnotherTag.gfx"
  L14_2 = "aAttackGraffiti.gfx"
  L15_2 = "adrip1.gfx"
  L16_2 = "BlankRiver.gfx"
  L17_2 = "Bombing.gfx"
  L18_2 = "Breachsub.gfx"
  L19_2 = "Breachtitle.gfx"
  L20_2 = "docallismeonstreet.gfx"
  L21_2 = "DonGraffiti.gfx"
  L22_2 = "forza.gfx"
  L23_2 = "Gemstone.gfx"
  L24_2 = "GhoustSolid.gfx"
  L25_2 = "Gotham.gfx"
  L26_2 = "GothamBoldItalic.gfx"
  L27_2 = "graffiti1.gfx"
  L28_2 = "graffiti2.gfx"
  L29_2 = "graffiti3.gfx"
  L30_2 = "graffiti4.gfx"
  L31_2 = "graffiti5.gfx"
  L32_2 = "JamstreetGraffiti.gfx"
  L33_2 = "Mostwasted.gfx"
  L34_2 = "mp_car_stats_01.gfx"
  L35_2 = "mp_gamer_info.gfx"
  L36_2 = "ninja.gfx"
  L37_2 = "pmms_texture_renderer.gfx"
  L38_2 = "pmms_texture_renderer1.gfx"
  L39_2 = "pmms_texture_renderer2.gfx"
  L40_2 = "pmms_texture_renderer3.gfx"
  L41_2 = "pmms_texture_renderer4.gfx"
  L42_2 = "pmms_texture_renderer5.gfx"
  L43_2 = "SOUTH-CREW.gfx"
  L44_2 = "Streetbomber.gfx"
  L45_2 = "THEJACATRA.gfx"
  L46_2 = "UrbanHeroes.gfx"
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L1_2[3] = L4_2
  L1_2[4] = L5_2
  L1_2[5] = L6_2
  L1_2[6] = L7_2
  L1_2[7] = L8_2
  L1_2[8] = L9_2
  L1_2[9] = L10_2
  L1_2[10] = L11_2
  L1_2[11] = L12_2
  L1_2[12] = L13_2
  L1_2[13] = L14_2
  L1_2[14] = L15_2
  L1_2[15] = L16_2
  L1_2[16] = L17_2
  L1_2[17] = L18_2
  L1_2[18] = L19_2
  L1_2[19] = L20_2
  L1_2[20] = L21_2
  L1_2[21] = L22_2
  L1_2[22] = L23_2
  L1_2[23] = L24_2
  L1_2[24] = L25_2
  L1_2[25] = L26_2
  L1_2[26] = L27_2
  L1_2[27] = L28_2
  L1_2[28] = L29_2
  L1_2[29] = L30_2
  L1_2[30] = L31_2
  L1_2[31] = L32_2
  L1_2[32] = L33_2
  L1_2[33] = L34_2
  L1_2[34] = L35_2
  L1_2[35] = L36_2
  L1_2[36] = L37_2
  L1_2[37] = L38_2
  L1_2[38] = L39_2
  L1_2[39] = L40_2
  L1_2[40] = L41_2
  L1_2[41] = L42_2
  L1_2[42] = L43_2
  L1_2[43] = L44_2
  L1_2[44] = L45_2
  L1_2[45] = L46_2
  L2_2 = ipairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = pcall
    L9_2 = RegisterStreamingFileFromResource
    L10_2 = L0_2
    L11_2 = "data/"
    L12_2 = L7_2
    L11_2 = L11_2 .. L12_2
    L8_2(L9_2, L10_2, L11_2)
  end
end
L5_1(L6_1)
