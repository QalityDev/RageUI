local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = type
L1_1 = tostring
L2_1 = tonumber
L3_1 = RageUI
function L4_1(A0_2)
  local L1_2
  if A0_2 <= 0 then
    return
  end
  L1_2 = L3_1.Options
  L1_2 = L1_2 + A0_2
  L3_1.Options = L1_2
end
L3_1.SkipItems = L4_1
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if A0_2 <= 0 then
    return
  end
  L2_2 = L3_1.CurrentMenu
  if L2_2 then
    L3_2 = L2_2.Open
    if L3_2 then
      goto lbl_11
    end
  end
  do return end
  ::lbl_11::
  L3_2 = L2_2.Pagination
  L4_2 = L3_1.Options
  L4_2 = L4_2 + 1
  L5_2 = L3_2.Minimum
  L5_2 = L5_2 - L4_2
  L5_2 = L5_2 + 1
  L6_2 = L3_2.Maximum
  L6_2 = L6_2 - L4_2
  L6_2 = L6_2 + 1
  if L5_2 < 1 then
    L5_2 = 1
  end
  if A0_2 < L6_2 then
    L6_2 = A0_2
  end
  if L5_2 > 1 then
    L7_2 = L3_1.Options
    L8_2 = L5_2 - 1
    L7_2 = L7_2 + L8_2
    L3_1.Options = L7_2
  end
  L7_2 = L5_2
  L8_2 = L6_2
  L9_2 = 1
  for L10_2 = L7_2, L8_2, L9_2 do
    L11_2 = A1_2
    L12_2 = L10_2
    L11_2(L12_2)
  end
  if A0_2 > L6_2 then
    L7_2 = L3_1.Options
    L8_2 = A0_2 - L6_2
    L7_2 = L7_2 + L8_2
    L3_1.Options = L7_2
  end
end
L3_1.ForEachVisible = L4_1
function L4_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L6_2 = L3_1.CurrentMenu
  if L6_2 then
    L7_2 = L6_2.Open
    if L7_2 then
      goto lbl_8
    end
  end
  do return end
  ::lbl_8::
  L7_2 = L3_1.Options
  L7_2 = L7_2 + 1
  L3_1.Options = L7_2
  L8_2 = L6_2.Pagination
  L9_2 = L8_2.Minimum
  if not (L7_2 < L9_2) then
    L9_2 = L8_2.Maximum
    if not (L7_2 > L9_2) then
      goto lbl_20
    end
  end
  do return end
  ::lbl_20::
  L9_2 = L3_1.RenderedNui
  L10_2 = L6_2.Index
  L10_2 = L10_2 == L7_2
  if A3_2 and L10_2 then
    if A4_2 then
      L11_2 = A4_2.onActive
      if L11_2 then
        L12_2 = L11_2
        L12_2()
      end
    end
    L11_2 = L3_1.Settings
    L11_2 = L11_2.Controls
    L11_2 = L11_2.Select
    L11_2 = L11_2.Active
    if L11_2 then
      L11_2 = L3_1.Settings
      L11_2 = L11_2.Audio
      L12_2 = L11_2.Use
      L12_2 = L11_2[L12_2]
      L13_2 = L3_1.PlaySound
      L14_2 = L12_2.Select
      L14_2 = L14_2.audioName
      L15_2 = L12_2.Select
      L15_2 = L15_2.audioRef
      L13_2(L14_2, L15_2)
      if A5_2 then
        L13_2 = A5_2
        L14_2 = L0_1
        L15_2 = L13_2
        L14_2 = L14_2(L15_2)
        if "string" == L14_2 then
          L14_2 = L3_1.Menus
          L13_2 = L14_2[L13_2]
        end
        if L13_2 then
          L3_1.NextMenu = L13_2
        end
      end
      if A4_2 then
        L13_2 = A4_2.onSelected
        if L13_2 then
          L13_2 = A4_2.onSelected
          L13_2()
        end
      end
    end
  end
  if A2_2 then
    L11_2 = A2_2.RightLabel
    if L11_2 then
      L11_2 = L1_1
      L12_2 = A2_2.RightLabel
      L11_2 = L11_2(L12_2)
      if L11_2 then
        goto lbl_84
      end
    end
  end
  L11_2 = nil
  ::lbl_84::
  if A2_2 then
    L12_2 = A2_2.previewImage
    if L12_2 then
      goto lbl_90
    end
  end
  L12_2 = nil
  ::lbl_90::
  L13_2 = nil ~= A5_2
  L14_2 = not A3_2
  L15_2 = L9_2.nbItems
  L15_2 = L15_2 + 1
  L9_2.nbItems = L15_2
  L16_2 = L9_2.items
  L16_2 = L16_2[L15_2]
  if L16_2 then
    L17_2 = L16_2.type
    if "button" == L17_2 then
      L17_2 = L16_2.name
      if L17_2 ~= A0_2 then
        L16_2.name = A0_2
        L9_2.changed = true
        L9_2.selectionOnly = false
      end
      L17_2 = L16_2.rightLabel
      if L17_2 ~= L11_2 then
        L16_2.rightLabel = L11_2
        L9_2.changed = true
        L9_2.selectionOnly = false
      end
      L17_2 = L16_2.locked
      if L17_2 ~= L14_2 then
        L16_2.locked = L14_2
        L9_2.changed = true
        L9_2.selectionOnly = false
      end
      L17_2 = L16_2.description
      if L17_2 ~= A1_2 then
        L16_2.description = A1_2
        L9_2.changed = true
        L9_2.selectionOnly = false
      end
      L17_2 = L16_2.selected
      if L17_2 ~= L10_2 then
        L16_2.selected = L10_2
        L9_2.changed = true
      end
      L17_2 = L16_2.submenu
      if L17_2 ~= L13_2 then
        L16_2.submenu = L13_2
        L9_2.changed = true
        L9_2.selectionOnly = false
      end
      L17_2 = L16_2.previewImage
      if L17_2 ~= L12_2 then
        L16_2.previewImage = L12_2
        L9_2.changed = true
        L9_2.selectionOnly = false
      end
  end
  else
    L17_2 = L9_2.items
    L18_2 = {}
    L18_2.type = "button"
    L18_2.name = A0_2
    L18_2.rightLabel = L11_2
    L18_2.locked = L14_2
    L18_2.description = A1_2
    L18_2.selected = L10_2
    L18_2.submenu = L13_2
    L18_2.previewImage = L12_2
    L17_2[L15_2] = L18_2
    L9_2.changed = true
    L9_2.selectionOnly = false
  end
  if L10_2 then
    L9_2.selectedItemIdx = L15_2
  end
end
L3_1.Button = L4_1
function L4_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L5_2 = L3_1.CurrentMenu
  if L5_2 then
    L6_2 = L5_2.Open
    if L6_2 then
      goto lbl_8
    end
  end
  do return end
  ::lbl_8::
  L6_2 = L3_1.Options
  L6_2 = L6_2 + 1
  L3_1.Options = L6_2
  L7_2 = L5_2.Pagination
  L8_2 = L7_2.Minimum
  if not (L6_2 < L8_2) then
    L8_2 = L7_2.Maximum
    if not (L6_2 > L8_2) then
      goto lbl_20
    end
  end
  do return end
  ::lbl_20::
  L8_2 = L0_1
  L9_2 = A4_2
  L8_2 = L8_2(L9_2)
  if "table" ~= L8_2 then
    L8_2 = {}
    A4_2 = L8_2
  end
  L8_2 = L3_1.RenderedNui
  L9_2 = L5_2.Index
  L9_2 = L9_2 == L6_2
  L10_2 = A3_2.Enabled
  L10_2 = false == L10_2
  if L9_2 and not L10_2 then
    if A4_2 then
      L11_2 = A4_2.onActive
      if L11_2 then
        L12_2 = L11_2
        L12_2()
      end
    end
    L11_2 = L3_1.Settings
    L11_2 = L11_2.Controls
    L11_2 = L11_2.Select
    L11_2 = L11_2.Active
    if L11_2 then
      A2_2 = not A2_2
      L11_2 = L3_1.Settings
      L11_2 = L11_2.Audio
      L12_2 = L11_2.Use
      L12_2 = L11_2[L12_2]
      L13_2 = L3_1.PlaySound
      L14_2 = L12_2.Select
      L14_2 = L14_2.audioName
      L15_2 = L12_2.Select
      L15_2 = L15_2.audioRef
      L13_2(L14_2, L15_2)
      if A4_2 then
        L13_2 = A4_2.onSelected
        if L13_2 then
          L13_2 = A4_2.onSelected
          L14_2 = A2_2
          L13_2(L14_2)
        else
          L13_2 = A4_2.checked
          if L13_2 then
            L13_2 = A4_2.checked
            L14_2 = A2_2
            L13_2(L14_2)
          end
        end
        if A2_2 then
          L13_2 = A4_2.onChecked
          if L13_2 then
            L13_2 = A4_2.onChecked
            L14_2 = A2_2
            L13_2(L14_2)
          end
        else
          L13_2 = A4_2.onUnChecked
          if L13_2 then
            L13_2 = A4_2.onUnChecked
            L14_2 = A2_2
            L13_2(L14_2)
          else
            L13_2 = A4_2.onUnchecked
            if L13_2 then
              L13_2 = A4_2.onUnchecked
              L14_2 = A2_2
              L13_2(L14_2)
            end
          end
        end
      end
    end
  end
  if A3_2 then
    L11_2 = A3_2.RightLabel
    if L11_2 then
      L11_2 = L1_1
      L12_2 = A3_2.RightLabel
      L11_2 = L11_2(L12_2)
      if L11_2 then
        goto lbl_115
      end
    end
  end
  L11_2 = nil
  ::lbl_115::
  L12_2 = L8_2.nbItems
  L12_2 = L12_2 + 1
  L8_2.nbItems = L12_2
  L13_2 = L8_2.items
  L13_2 = L13_2[L12_2]
  if L13_2 then
    L14_2 = L13_2.type
    if "checkbox" == L14_2 then
      L14_2 = L13_2.name
      if L14_2 ~= A0_2 then
        L13_2.name = A0_2
        L8_2.changed = true
        L8_2.selectionOnly = false
      end
      L14_2 = L13_2.rightLabel
      if L14_2 ~= L11_2 then
        L13_2.rightLabel = L11_2
        L8_2.changed = true
        L8_2.selectionOnly = false
      end
      L14_2 = L13_2.data
      if L14_2 ~= A2_2 then
        L13_2.data = A2_2
        L8_2.changed = true
      end
      L14_2 = L13_2.description
      if L14_2 ~= A1_2 then
        L13_2.description = A1_2
        L8_2.changed = true
        L8_2.selectionOnly = false
      end
      L14_2 = L13_2.selected
      if L14_2 ~= L9_2 then
        L13_2.selected = L9_2
        L8_2.changed = true
      end
      L14_2 = L13_2.locked
      if L14_2 ~= L10_2 then
        L13_2.locked = L10_2
        L8_2.changed = true
        L8_2.selectionOnly = false
      end
  end
  else
    L14_2 = L8_2.items
    L15_2 = {}
    L15_2.type = "checkbox"
    L15_2.name = A0_2
    L15_2.rightLabel = L11_2
    L15_2.data = A2_2
    L15_2.description = A1_2
    L15_2.selected = L9_2
    L15_2.locked = L10_2
    L14_2[L12_2] = L15_2
    L8_2.changed = true
    L8_2.selectionOnly = false
  end
  if L9_2 then
    L8_2.selectedItemIdx = L12_2
  end
end
L3_1.Checkbox = L4_1
function L4_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2, A7_2)
  local L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2
  L8_2 = L3_1.CurrentMenu
  if L8_2 then
    L9_2 = L8_2.Open
    if L9_2 then
      goto lbl_8
    end
  end
  do return end
  ::lbl_8::
  L9_2 = L3_1.Options
  L9_2 = L9_2 + 1
  L3_1.Options = L9_2
  L10_2 = L8_2.Pagination
  L11_2 = L10_2.Minimum
  if not (L9_2 < L11_2) then
    L11_2 = L10_2.Maximum
    if not (L9_2 > L11_2) then
      goto lbl_20
    end
  end
  do return end
  ::lbl_20::
  L11_2 = L3_1.RenderedNui
  L12_2 = L8_2.Index
  L12_2 = L12_2 == L9_2
  if A5_2 and L12_2 then
    L13_2 = L3_1.Settings
    L13_2 = L13_2.Controls
    L14_2 = L13_2.Left
    L14_2 = L14_2.Active
    L15_2 = L13_2.Right
    L15_2 = L15_2.Active
    if L14_2 and not L15_2 then
      A2_2 = A2_2 - 1
      if A2_2 < 1 then
        A2_2 = #A1_2
      end
      L16_2 = L3_1.Settings
      L16_2 = L16_2.Audio
      L17_2 = L16_2.Use
      L17_2 = L16_2[L17_2]
      L18_2 = L3_1.PlaySound
      L19_2 = L17_2.LeftRight
      L19_2 = L19_2.audioName
      L20_2 = L17_2.LeftRight
      L20_2 = L20_2.audioRef
      L18_2(L19_2, L20_2)
      if A6_2 then
        L18_2 = A6_2.onListChange
        if L18_2 then
          L18_2 = A6_2.onListChange
          L19_2 = A2_2
          L20_2 = A1_2[A2_2]
          L18_2(L19_2, L20_2)
        end
      end
    elseif L15_2 and not L14_2 then
      A2_2 = A2_2 + 1
      L16_2 = #A1_2
      if A2_2 > L16_2 then
        A2_2 = 1
      end
      L17_2 = L3_1.Settings
      L17_2 = L17_2.Audio
      L18_2 = L17_2.Use
      L18_2 = L17_2[L18_2]
      L19_2 = L3_1.PlaySound
      L20_2 = L18_2.LeftRight
      L20_2 = L20_2.audioName
      L21_2 = L18_2.LeftRight
      L21_2 = L21_2.audioRef
      L19_2(L20_2, L21_2)
      if A6_2 then
        L19_2 = A6_2.onListChange
        if L19_2 then
          L19_2 = A6_2.onListChange
          L20_2 = A2_2
          L21_2 = A1_2[A2_2]
          L19_2(L20_2, L21_2)
        end
      end
    end
    if A6_2 then
      L16_2 = A6_2.onActive
      if L16_2 then
        L17_2 = L16_2
        L18_2 = A2_2
        L19_2 = A1_2[A2_2]
        L17_2(L18_2, L19_2)
      end
    end
    L16_2 = L13_2.Select
    L16_2 = L16_2.Active
    if L16_2 then
      L16_2 = L3_1.Settings
      L16_2 = L16_2.Audio
      L17_2 = L16_2.Use
      L17_2 = L16_2[L17_2]
      L18_2 = L3_1.PlaySound
      L19_2 = L17_2.Select
      L19_2 = L19_2.audioName
      L20_2 = L17_2.Select
      L20_2 = L20_2.audioRef
      L18_2(L19_2, L20_2)
      if A7_2 then
        L18_2 = A7_2
        L19_2 = L0_1
        L20_2 = L18_2
        L19_2 = L19_2(L20_2)
        if "string" == L19_2 then
          L19_2 = L3_1.Menus
          L18_2 = L19_2[L18_2]
        end
        if L18_2 then
          L3_1.NextMenu = L18_2
        end
      end
      if A6_2 then
        L18_2 = A6_2.onSelected
        if L18_2 then
          L18_2 = A6_2.onSelected
          L19_2 = A2_2
          L20_2 = A1_2[A2_2]
          L18_2(L19_2, L20_2)
        end
      end
    end
  end
  if A4_2 then
    L13_2 = A4_2.RightLabel
    if L13_2 then
      L13_2 = L1_1
      L14_2 = A4_2.RightLabel
      L13_2 = L13_2(L14_2)
      if L13_2 then
        goto lbl_150
      end
    end
  end
  L13_2 = nil
  ::lbl_150::
  if A4_2 then
    L14_2 = A4_2.previewImage
    if L14_2 then
      goto lbl_156
    end
  end
  L14_2 = nil
  ::lbl_156::
  L15_2 = L2_1
  L16_2 = A2_2
  L15_2 = L15_2(L16_2)
  if not L15_2 then
    L15_2 = 1
  end
  L15_2 = L15_2 - 1
  L16_2 = not A5_2
  L17_2 = L11_2.nbItems
  L17_2 = L17_2 + 1
  L11_2.nbItems = L17_2
  L18_2 = L11_2.items
  L18_2 = L18_2[L17_2]
  if L18_2 then
    L19_2 = L18_2.type
    if "list" == L19_2 then
      L19_2 = L18_2.name
      if L19_2 ~= A0_2 then
        L18_2.name = A0_2
        L11_2.changed = true
        L11_2.selectionOnly = false
      end
      L19_2 = L18_2.rightLabel
      if L19_2 ~= L13_2 then
        L18_2.rightLabel = L13_2
        L11_2.changed = true
        L11_2.selectionOnly = false
      end
      L19_2 = L18_2.locked
      if L19_2 ~= L16_2 then
        L18_2.locked = L16_2
        L11_2.changed = true
        L11_2.selectionOnly = false
      end
      L19_2 = L18_2.description
      if L19_2 ~= A3_2 then
        L18_2.description = A3_2
        L11_2.changed = true
        L11_2.selectionOnly = false
      end
      L19_2 = L18_2.selected
      if L19_2 ~= L12_2 then
        L18_2.selected = L12_2
        L11_2.changed = true
      end
      L19_2 = L18_2.data
      L19_2 = L19_2.index
      if L19_2 ~= L15_2 then
        L19_2 = L18_2.data
        L19_2.index = L15_2
        L11_2.changed = true
        L11_2.selectionOnly = false
      end
      L19_2 = L18_2.previewImage
      if L19_2 ~= L14_2 then
        L18_2.previewImage = L14_2
        L11_2.changed = true
        L11_2.selectionOnly = false
      end
      L19_2 = L18_2.data
      L19_2 = L19_2.list
      L20_2 = #A1_2
      L21_2 = #L19_2
      L21_2 = L21_2 ~= L20_2
      if not L21_2 then
        L22_2 = 1
        L23_2 = L20_2
        L24_2 = 1
        for L25_2 = L22_2, L23_2, L24_2 do
          L26_2 = A1_2[L25_2]
          L27_2 = L0_1
          L28_2 = L26_2
          L27_2 = L27_2(L28_2)
          if "table" == L27_2 then
            L27_2 = L26_2.Name
            if L27_2 then
              goto lbl_250
            end
            L27_2 = L1_1
            L28_2 = L26_2
            L27_2 = L27_2(L28_2)
            if L27_2 then
              goto lbl_250
            end
          end
          L27_2 = L1_1
          L28_2 = L26_2
          L27_2 = L27_2(L28_2)
          ::lbl_250::
          L28_2 = L19_2[L25_2]
          if L28_2 ~= L27_2 then
            L21_2 = true
            break
          end
        end
      end
      if not L21_2 then
        goto lbl_332
      end
      L22_2 = {}
      L23_2 = 1
      L24_2 = L20_2
      L25_2 = 1
      for L26_2 = L23_2, L24_2, L25_2 do
        L27_2 = A1_2[L26_2]
        L28_2 = L0_1
        L29_2 = L27_2
        L28_2 = L28_2(L29_2)
        if "table" == L28_2 then
          L28_2 = L27_2.Name
          if L28_2 then
            goto lbl_281
          end
          L28_2 = L1_1
          L29_2 = L27_2
          L28_2 = L28_2(L29_2)
          if L28_2 then
            goto lbl_281
          end
        end
        L28_2 = L1_1
        L29_2 = L27_2
        L28_2 = L28_2(L29_2)
        ::lbl_281::
        L22_2[L26_2] = L28_2
      end
      L23_2 = L18_2.data
      L23_2.list = L22_2
      L11_2.changed = true
      L11_2.selectionOnly = false
  end
  else
    L19_2 = #A1_2
    L20_2 = {}
    L21_2 = 1
    L22_2 = L19_2
    L23_2 = 1
    for L24_2 = L21_2, L22_2, L23_2 do
      L25_2 = A1_2[L24_2]
      L26_2 = L0_1
      L27_2 = L25_2
      L26_2 = L26_2(L27_2)
      if "table" == L26_2 then
        L26_2 = L25_2.Name
        if L26_2 then
          goto lbl_312
        end
        L26_2 = L1_1
        L27_2 = L25_2
        L26_2 = L26_2(L27_2)
        if L26_2 then
          goto lbl_312
        end
      end
      L26_2 = L1_1
      L27_2 = L25_2
      L26_2 = L26_2(L27_2)
      ::lbl_312::
      L20_2[L24_2] = L26_2
    end
    L21_2 = L11_2.items
    L22_2 = {}
    L22_2.type = "list"
    L22_2.name = A0_2
    L22_2.rightLabel = L13_2
    L22_2.locked = L16_2
    L23_2 = {}
    L23_2.index = L15_2
    L23_2.list = L20_2
    L22_2.data = L23_2
    L22_2.description = A3_2
    L22_2.selected = L12_2
    L22_2.previewImage = L14_2
    L21_2[L17_2] = L22_2
    L11_2.changed = true
    L11_2.selectionOnly = false
  end
  ::lbl_332::
  if L12_2 then
    L11_2.selectedItemIdx = L17_2
  end
end
L3_1.List = L4_1
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = L3_1.CurrentMenu
  if L1_2 then
    L2_2 = L1_2.Open
    if L2_2 then
      goto lbl_8
    end
  end
  do return end
  ::lbl_8::
  L2_2 = L3_1.Options
  L2_2 = L2_2 + 1
  L3_1.Options = L2_2
  L3_2 = L1_2.Pagination
  L4_2 = L3_2.Minimum
  if not (L2_2 < L4_2) then
    L4_2 = L3_2.Maximum
    if not (L2_2 > L4_2) then
      goto lbl_20
    end
  end
  do return end
  ::lbl_20::
  L4_2 = L3_1.RenderedNui
  L5_2 = L1_2.Index
  if L5_2 == L2_2 then
    L5_2 = L3_1.LastControl
    if L5_2 then
      L5_2 = L2_2 - 1
      L6_2 = L5_2 or L6_2
      if not (L5_2 > 0) or not L5_2 then
        L6_2 = L1_2.Options
      end
      L1_2.Index = L6_2
      L6_2 = L1_2.Index
      L7_2 = L3_2.Minimum
      if L6_2 < L7_2 then
        L6_2 = L1_2.Index
        L3_2.Minimum = L6_2
        L6_2 = L3_2.Minimum
        L7_2 = L3_2.Total
        L6_2 = L6_2 + L7_2
        L6_2 = L6_2 - 1
        L3_2.Maximum = L6_2
      end
      L6_2 = L1_2.Index
      L7_2 = L3_2.Maximum
      if L6_2 > L7_2 then
        L6_2 = L1_2.Index
        L3_2.Maximum = L6_2
        L6_2 = L3_2.Maximum
        L7_2 = L3_2.Total
        L6_2 = L6_2 - L7_2
        L6_2 = L6_2 + 1
        L3_2.Minimum = L6_2
        L6_2 = L3_2.Minimum
        if L6_2 < 1 then
          L3_2.Minimum = 1
        end
      end
    else
      L5_2 = L2_2 + 1
      L1_2.Index = L5_2
      L5_2 = L1_2.Index
      L6_2 = L3_2.Maximum
      if L5_2 > L6_2 then
        L5_2 = L1_2.Index
        L3_2.Maximum = L5_2
        L5_2 = L3_2.Maximum
        L6_2 = L3_2.Total
        L5_2 = L5_2 - L6_2
        L5_2 = L5_2 + 1
        L3_2.Minimum = L5_2
        L5_2 = L3_2.Minimum
        if L5_2 < 1 then
          L3_2.Minimum = 1
        end
      end
      L5_2 = L1_2.Index
      L6_2 = L3_2.Minimum
      if L5_2 < L6_2 then
        L5_2 = L1_2.Index
        L3_2.Minimum = L5_2
        L5_2 = L3_2.Minimum
        L6_2 = L3_2.Total
        L5_2 = L5_2 + L6_2
        L5_2 = L5_2 - 1
        L3_2.Maximum = L5_2
      end
    end
  end
  L5_2 = L4_2.nbItems
  L5_2 = L5_2 + 1
  L4_2.nbItems = L5_2
  L6_2 = L4_2.items
  L6_2 = L6_2[L5_2]
  if L6_2 then
    L7_2 = L6_2.type
    if "subtitle" == L7_2 then
      L7_2 = L6_2.name
      if L7_2 ~= A0_2 then
        L6_2.name = A0_2
        L4_2.changed = true
        L4_2.selectionOnly = false
      end
  end
  else
    L7_2 = L4_2.items
    L8_2 = {}
    L8_2.type = "subtitle"
    L8_2.name = A0_2
    L7_2[L5_2] = L8_2
    L4_2.changed = true
    L4_2.selectionOnly = false
  end
end
L3_1.Separator = L4_1
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = L3_1.CurrentMenu
  if L0_2 then
    L1_2 = L0_2
    L1_2 = L1_2()
    if L1_2 then
      goto lbl_9
    end
  end
  do return end
  ::lbl_9::
  L1_2 = L3_1.Options
  L1_2 = L1_2 + 1
  L3_1.Options = L1_2
  L2_2 = L0_2.Pagination
  L3_2 = L2_2.Minimum
  if not (L1_2 < L3_2) then
    L3_2 = L2_2.Maximum
    if not (L1_2 > L3_2) then
      goto lbl_21
    end
  end
  do return end
  ::lbl_21::
  L3_2 = L3_1.RenderedNui
  L4_2 = L0_2.Index
  if L4_2 == L1_2 then
    L4_2 = L3_1.LastControl
    if L4_2 then
      L4_2 = L1_2 - 1
      L5_2 = L4_2 or L5_2
      if not (L4_2 > 0) or not L4_2 then
        L5_2 = L0_2.Options
      end
      L0_2.Index = L5_2
      L5_2 = L0_2.Index
      L6_2 = L2_2.Minimum
      if L5_2 < L6_2 then
        L5_2 = L0_2.Index
        L2_2.Minimum = L5_2
        L5_2 = L2_2.Minimum
        L6_2 = L2_2.Total
        L5_2 = L5_2 + L6_2
        L5_2 = L5_2 - 1
        L2_2.Maximum = L5_2
      end
      L5_2 = L0_2.Index
      L6_2 = L2_2.Maximum
      if L5_2 > L6_2 then
        L5_2 = L0_2.Index
        L2_2.Maximum = L5_2
        L5_2 = L2_2.Maximum
        L6_2 = L2_2.Total
        L5_2 = L5_2 - L6_2
        L5_2 = L5_2 + 1
        L2_2.Minimum = L5_2
        L5_2 = L2_2.Minimum
        if L5_2 < 1 then
          L2_2.Minimum = 1
        end
      end
    else
      L4_2 = L1_2 + 1
      L0_2.Index = L4_2
      L4_2 = L0_2.Index
      L5_2 = L2_2.Maximum
      if L4_2 > L5_2 then
        L4_2 = L0_2.Index
        L2_2.Maximum = L4_2
        L4_2 = L2_2.Maximum
        L5_2 = L2_2.Total
        L4_2 = L4_2 - L5_2
        L4_2 = L4_2 + 1
        L2_2.Minimum = L4_2
        L4_2 = L2_2.Minimum
        if L4_2 < 1 then
          L2_2.Minimum = 1
        end
      end
      L4_2 = L0_2.Index
      L5_2 = L2_2.Minimum
      if L4_2 < L5_2 then
        L4_2 = L0_2.Index
        L2_2.Minimum = L4_2
        L4_2 = L2_2.Minimum
        L5_2 = L2_2.Total
        L4_2 = L4_2 + L5_2
        L4_2 = L4_2 - 1
        L2_2.Maximum = L4_2
      end
    end
  end
  L4_2 = L3_2.nbItems
  L4_2 = L4_2 + 1
  L3_2.nbItems = L4_2
  L5_2 = L3_2.items
  L5_2 = L5_2[L4_2]
  if L5_2 then
    L6_2 = L5_2.type
    if "separator" == L6_2 then
      goto lbl_118
    end
  end
  L6_2 = L3_2.items
  L7_2 = {}
  L7_2.type = "separator"
  L6_2[L4_2] = L7_2
  L3_2.changed = true
  L3_2.selectionOnly = false
  ::lbl_118::
end
L3_1.Line = L4_1
function L4_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2, A7_2, A8_2)
  local L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L9_2 = L3_1.CurrentMenu
  if L9_2 then
    L10_2 = L9_2
    L10_2 = L10_2()
    if L10_2 then
      goto lbl_9
    end
  end
  do return end
  ::lbl_9::
  L10_2 = L3_1.Options
  L10_2 = L10_2 + 1
  L3_1.Options = L10_2
  L11_2 = L9_2.Pagination
  L12_2 = L11_2.Minimum
  if not (L10_2 < L12_2) then
    L12_2 = L11_2.Maximum
    if not (L10_2 > L12_2) then
      goto lbl_21
    end
  end
  do return end
  ::lbl_21::
  L12_2 = L3_1.RenderedNui
  L13_2 = L9_2.Index
  L13_2 = L13_2 == L10_2
  if not A3_2 then
    A3_2 = 0
  end
  if not A4_2 then
    A4_2 = 100
  end
  if not A5_2 then
    A5_2 = 1
  end
  if A7_2 and L13_2 then
    L14_2 = L3_1.Settings
    L14_2 = L14_2.Controls
    L15_2 = L14_2.Left
    L15_2 = L15_2.Active
    L16_2 = L14_2.Right
    L16_2 = L16_2.Active
    if L15_2 and not L16_2 then
      A2_2 = A2_2 - A5_2
      if A3_2 > A2_2 then
        A2_2 = A3_2
      end
      L17_2 = L3_1.Settings
      L17_2 = L17_2.Audio
      L18_2 = L17_2.Use
      L18_2 = L17_2[L18_2]
      L19_2 = L3_1.PlaySound
      L20_2 = L18_2.LeftRight
      L20_2 = L20_2.audioName
      L21_2 = L18_2.LeftRight
      L21_2 = L21_2.audioRef
      L19_2(L20_2, L21_2)
      if A8_2 then
        L19_2 = A8_2.onSliderChange
        if L19_2 then
          L19_2 = A8_2.onSliderChange
          L20_2 = A2_2
          L19_2(L20_2)
        end
      end
    elseif L16_2 and not L15_2 then
      A2_2 = A2_2 + A5_2
      if A4_2 < A2_2 then
        A2_2 = A4_2
      end
      L17_2 = L3_1.Settings
      L17_2 = L17_2.Audio
      L18_2 = L17_2.Use
      L18_2 = L17_2[L18_2]
      L19_2 = L3_1.PlaySound
      L20_2 = L18_2.LeftRight
      L20_2 = L20_2.audioName
      L21_2 = L18_2.LeftRight
      L21_2 = L21_2.audioRef
      L19_2(L20_2, L21_2)
      if A8_2 then
        L19_2 = A8_2.onSliderChange
        if L19_2 then
          L19_2 = A8_2.onSliderChange
          L20_2 = A2_2
          L19_2(L20_2)
        end
      end
    end
    if A8_2 then
      L17_2 = A8_2.onActive
      if L17_2 then
        L18_2 = L17_2
        L19_2 = A2_2
        L18_2(L19_2)
      end
    end
    L17_2 = L14_2.Select
    L17_2 = L17_2.Active
    if L17_2 then
      L17_2 = L3_1.Settings
      L17_2 = L17_2.Audio
      L18_2 = L17_2.Use
      L18_2 = L17_2[L18_2]
      L19_2 = L3_1.PlaySound
      L20_2 = L18_2.Select
      L20_2 = L20_2.audioName
      L21_2 = L18_2.Select
      L21_2 = L21_2.audioRef
      L19_2(L20_2, L21_2)
      if A8_2 then
        L19_2 = A8_2.onSelected
        if L19_2 then
          L19_2 = A8_2.onSelected
          L20_2 = A2_2
          L19_2(L20_2)
        end
      end
    end
  end
  if A6_2 then
    L14_2 = A6_2.ShowPercentage
    if L14_2 then
      goto lbl_137
    end
  end
  L14_2 = false
  ::lbl_137::
  L15_2 = not A7_2
  L16_2 = L12_2.nbItems
  L16_2 = L16_2 + 1
  L12_2.nbItems = L16_2
  L17_2 = L12_2.items
  L17_2 = L17_2[L16_2]
  if L17_2 then
    L18_2 = L17_2.type
    if "slider" == L18_2 then
      L18_2 = L17_2.name
      if L18_2 ~= A0_2 then
        L17_2.name = A0_2
        L12_2.changed = true
        L12_2.selectionOnly = false
      end
      L18_2 = L17_2.description
      if L18_2 ~= A1_2 then
        L17_2.description = A1_2
        L12_2.changed = true
        L12_2.selectionOnly = false
      end
      L18_2 = L17_2.locked
      if L18_2 ~= L15_2 then
        L17_2.locked = L15_2
        L12_2.changed = true
        L12_2.selectionOnly = false
      end
      L18_2 = L17_2.selected
      if L18_2 ~= L13_2 then
        L17_2.selected = L13_2
        L12_2.changed = true
      end
      L18_2 = L17_2.data
      L19_2 = L18_2.value
      if L19_2 ~= A2_2 then
        L18_2.value = A2_2
        L12_2.changed = true
        L12_2.selectionOnly = false
      end
      L19_2 = L18_2.min
      if L19_2 ~= A3_2 then
        L18_2.min = A3_2
        L12_2.changed = true
        L12_2.selectionOnly = false
      end
      L19_2 = L18_2.max
      if L19_2 ~= A4_2 then
        L18_2.max = A4_2
        L12_2.changed = true
        L12_2.selectionOnly = false
      end
      L19_2 = L18_2.step
      if L19_2 ~= A5_2 then
        L18_2.step = A5_2
        L12_2.changed = true
        L12_2.selectionOnly = false
      end
      L19_2 = L18_2.showPercentage
      if L19_2 ~= L14_2 then
        L18_2.showPercentage = L14_2
        L12_2.changed = true
        L12_2.selectionOnly = false
      end
  end
  else
    L18_2 = L12_2.items
    L19_2 = {}
    L19_2.type = "slider"
    L19_2.name = A0_2
    L19_2.description = A1_2
    L19_2.locked = L15_2
    L19_2.selected = L13_2
    L20_2 = {}
    L20_2.value = A2_2
    L20_2.min = A3_2
    L20_2.max = A4_2
    L20_2.step = A5_2
    L20_2.showPercentage = L14_2
    L19_2.data = L20_2
    L18_2[L16_2] = L19_2
    L12_2.changed = true
    L12_2.selectionOnly = false
  end
  if L13_2 then
    L12_2.selectedItemIdx = L16_2
  end
end
L3_1.Slider = L4_1
