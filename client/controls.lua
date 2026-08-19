local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = DisableControlAction
L1_1 = DisableAllControlActions
L2_1 = EnableControlAction
L3_1 = IsDisabledControlJustPressed
L4_1 = IsDisabledControlJustReleased
L5_1 = IsDisabledControlPressed
L6_1 = GetGameTimer
L7_1 = GetFrameCount
L8_1 = PlaySoundFrontend
L9_1 = IsNuiFocused
L10_1 = {}
L11_1 = {}
L11_1.held = false
L11_1.timer = 0
L11_1.delay = 220
L11_1.repeatDelay = 85
L10_1.Up = L11_1
L11_1 = {}
L11_1.held = false
L11_1.timer = 0
L11_1.delay = 220
L11_1.repeatDelay = 85
L10_1.Down = L11_1
L11_1 = {}
L11_1.held = false
L11_1.timer = 0
L11_1.delay = 300
L11_1.repeatDelay = 120
L10_1.Left = L11_1
L11_1 = {}
L11_1.held = false
L11_1.timer = 0
L11_1.delay = 300
L11_1.repeatDelay = 120
L10_1.Right = L11_1
L11_1 = -1
L12_1 = RageUI
L12_1.TransitionConsumeSelect = false
function L12_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
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
  L1_2 = L0_2.Options
  if 0 == L1_2 then
    return
  end
  L2_2 = L0_2.Pagination
  L3_2 = L2_2.Total
  if L1_2 > L3_2 then
    L3_2 = L0_2.Index
    L4_2 = L2_2.Minimum
    if L3_2 <= L4_2 then
      L3_2 = L0_2.Index
      if 1 == L3_2 then
        L3_2 = L2_2.Total
        L3_2 = L3_2 - 1
        L3_2 = L1_2 - L3_2
        L2_2.Minimum = L3_2
        L2_2.Maximum = L1_2
        L0_2.Index = L1_2
      else
        L3_2 = L2_2.Minimum
        L3_2 = L3_2 - 1
        L2_2.Minimum = L3_2
        L3_2 = L2_2.Maximum
        L3_2 = L3_2 - 1
        L2_2.Maximum = L3_2
        L3_2 = L0_2.Index
        L3_2 = L3_2 - 1
        L0_2.Index = L3_2
      end
    else
      L3_2 = L0_2.Index
      L3_2 = L3_2 - 1
      L0_2.Index = L3_2
    end
  else
    L3_2 = L0_2.Index
    L3_2 = L3_2 - 1
    L0_2.Index = L3_2
    L3_2 = L0_2.Index
    if L3_2 < 1 then
      L0_2.Index = L1_2
    end
  end
  L3_2 = RageUI
  L3_2 = L3_2.Settings
  L3_2 = L3_2.Audio
  L4_2 = RageUI
  L4_2 = L4_2.PlaySound
  L5_2 = L3_2.Use
  L5_2 = L3_2[L5_2]
  L5_2 = L5_2.UpDown
  L5_2 = L5_2.audioName
  L6_2 = L3_2.Use
  L6_2 = L3_2[L6_2]
  L6_2 = L6_2.UpDown
  L6_2 = L6_2.audioRef
  L4_2(L5_2, L6_2)
  L4_2 = RageUI
  L4_2.LastControl = true
  L4_2 = L0_2.onIndexChange
  if L4_2 then
    L4_2 = L0_2.onIndexChange
    L5_2 = L0_2.Index
    L4_2(L5_2)
  end
end
function L13_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
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
  L1_2 = L0_2.Options
  if 0 == L1_2 then
    return
  end
  L2_2 = L0_2.Pagination
  L3_2 = L2_2.Total
  if L1_2 > L3_2 then
    L3_2 = L0_2.Index
    L4_2 = L2_2.Maximum
    if L3_2 >= L4_2 then
      L3_2 = L0_2.Index
      if L3_2 == L1_2 then
        L2_2.Minimum = 1
        L3_2 = L2_2.Total
        L2_2.Maximum = L3_2
        L0_2.Index = 1
      else
        L3_2 = L2_2.Minimum
        L3_2 = L3_2 + 1
        L2_2.Minimum = L3_2
        L3_2 = L2_2.Maximum
        L3_2 = L3_2 + 1
        L2_2.Maximum = L3_2
        L3_2 = L0_2.Index
        L3_2 = L3_2 + 1
        L0_2.Index = L3_2
      end
    else
      L3_2 = L0_2.Index
      L3_2 = L3_2 + 1
      L0_2.Index = L3_2
    end
  else
    L3_2 = L0_2.Index
    L3_2 = L3_2 + 1
    L0_2.Index = L3_2
    L3_2 = L0_2.Index
    if L1_2 < L3_2 then
      L0_2.Index = 1
    end
  end
  L3_2 = RageUI
  L3_2 = L3_2.Settings
  L3_2 = L3_2.Audio
  L4_2 = RageUI
  L4_2 = L4_2.PlaySound
  L5_2 = L3_2.Use
  L5_2 = L3_2[L5_2]
  L5_2 = L5_2.UpDown
  L5_2 = L5_2.audioName
  L6_2 = L3_2.Use
  L6_2 = L3_2[L6_2]
  L6_2 = L6_2.UpDown
  L6_2 = L6_2.audioRef
  L4_2(L5_2, L6_2)
  L4_2 = RageUI
  L4_2.LastControl = false
  L4_2 = L0_2.onIndexChange
  if L4_2 then
    L4_2 = L0_2.onIndexChange
    L5_2 = L0_2.Index
    L4_2(L5_2)
  end
end
function L14_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = RageUI
  L0_2 = L0_2.CurrentMenu
  if not L0_2 then
    return
  end
  L0_2 = RageUI
  L0_2 = L0_2.CurrentMenu
  L0_2 = L0_2.Closable
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
L15_1 = RageUI
function L16_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L0_2 = RageUI
  L0_2 = L0_2.InputFocus
  if L0_2 then
    return
  end
  L0_2 = RageUI
  L0_2 = L0_2.CurrentMenu
  if L0_2 then
    L1_2 = L0_2.Open
    if L1_2 then
      goto lbl_14
    end
  end
  do return end
  ::lbl_14::
  L1_2 = RageUI
  L1_2 = L1_2.Settings
  L1_2 = L1_2.Controls
  L2_2 = L6_1
  L2_2 = L2_2()
  L3_2 = L7_1
  L3_2 = L3_2()
  L4_2 = L11_1
  if L4_2 == L3_2 then
    return
  end
  L11_1 = L3_2
  L4_2 = L1_1
  L5_2 = 0
  L4_2(L5_2)
  L4_2 = L2_1
  L5_2 = 0
  L6_2 = 1
  L7_2 = true
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L2_1
  L5_2 = 0
  L6_2 = 2
  L7_2 = true
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L2_1
  L5_2 = 0
  L6_2 = 245
  L7_2 = true
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L2_1
  L5_2 = 0
  L6_2 = 246
  L7_2 = true
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L2_1
  L5_2 = 0
  L6_2 = 249
  L7_2 = true
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L2_1
  L5_2 = 0
  L6_2 = 30
  L7_2 = true
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L2_1
  L5_2 = 0
  L6_2 = 31
  L7_2 = true
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L2_1
  L5_2 = 0
  L6_2 = 21
  L7_2 = true
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L2_1
  L5_2 = 0
  L6_2 = 22
  L7_2 = true
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L2_1
  L5_2 = 0
  L6_2 = 36
  L7_2 = true
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L2_1
  L5_2 = 0
  L6_2 = 32
  L7_2 = true
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L2_1
  L5_2 = 0
  L6_2 = 33
  L7_2 = true
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L2_1
  L5_2 = 0
  L6_2 = 34
  L7_2 = true
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L2_1
  L5_2 = 0
  L6_2 = 35
  L7_2 = true
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L2_1
  L5_2 = 0
  L6_2 = 71
  L7_2 = true
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L2_1
  L5_2 = 0
  L6_2 = 72
  L7_2 = true
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L2_1
  L5_2 = 0
  L6_2 = 59
  L7_2 = true
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L2_1
  L5_2 = 0
  L6_2 = 60
  L7_2 = true
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L2_1
  L5_2 = 0
  L6_2 = 76
  L7_2 = true
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L2_1
  L5_2 = 0
  L6_2 = 63
  L7_2 = true
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L2_1
  L5_2 = 0
  L6_2 = 64
  L7_2 = true
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L2_1
  L5_2 = 0
  L6_2 = 89
  L7_2 = true
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L2_1
  L5_2 = 0
  L6_2 = 90
  L7_2 = true
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L2_1
  L5_2 = 0
  L6_2 = 69
  L7_2 = true
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L1_2.Left
  L4_2.Active = false
  L4_2 = L1_2.Right
  L4_2.Active = false
  L4_2 = L1_2.Select
  L4_2.Active = false
  L4_2 = L1_2.Back
  L4_2.Active = false
  L4_2 = false
  L5_2 = RageUI
  L5_2 = L5_2.TransitionConsumeSelect
  if L5_2 then
    L5_2 = RageUI
    L5_2.TransitionConsumeSelect = false
    L4_2 = true
  end
  L5_2 = L1_2.Up
  L5_2 = L5_2.Enabled
  if L5_2 then
    L5_2 = L1_2.Up
    L5_2 = L5_2.Keys
    L6_2 = L10_1.Up
    L7_2 = 1
    L8_2 = #L5_2
    L9_2 = 1
    for L10_2 = L7_2, L8_2, L9_2 do
      L11_2 = L5_2[L10_2]
      L12_2 = L3_1
      L13_2 = 0
      L14_2 = L11_2
      L12_2 = L12_2(L13_2, L14_2)
      if L12_2 then
        L12_2 = L12_1
        L12_2()
        L6_2.held = true
        L12_2 = L6_2.delay
        L12_2 = L2_2 + L12_2
        L6_2.timer = L12_2
      end
      L12_2 = L4_1
      L13_2 = 0
      L14_2 = L11_2
      L12_2 = L12_2(L13_2, L14_2)
      if L12_2 then
        L6_2.held = false
      end
      L12_2 = L6_2.held
      if L12_2 then
        L12_2 = L5_1
        L13_2 = 0
        L14_2 = L11_2
        L12_2 = L12_2(L13_2, L14_2)
        if L12_2 then
          L12_2 = L6_2.timer
          if L2_2 > L12_2 then
            L12_2 = L12_1
            L12_2()
            L12_2 = L6_2.repeatDelay
            L12_2 = L2_2 + L12_2
            L6_2.timer = L12_2
          end
        end
      end
    end
  end
  L5_2 = L1_2.Down
  L5_2 = L5_2.Enabled
  if L5_2 then
    L5_2 = L1_2.Down
    L5_2 = L5_2.Keys
    L6_2 = L10_1.Down
    L7_2 = 1
    L8_2 = #L5_2
    L9_2 = 1
    for L10_2 = L7_2, L8_2, L9_2 do
      L11_2 = L5_2[L10_2]
      L12_2 = L3_1
      L13_2 = 0
      L14_2 = L11_2
      L12_2 = L12_2(L13_2, L14_2)
      if L12_2 then
        L12_2 = L13_1
        L12_2()
        L6_2.held = true
        L12_2 = L6_2.delay
        L12_2 = L2_2 + L12_2
        L6_2.timer = L12_2
      end
      L12_2 = L4_1
      L13_2 = 0
      L14_2 = L11_2
      L12_2 = L12_2(L13_2, L14_2)
      if L12_2 then
        L6_2.held = false
      end
      L12_2 = L6_2.held
      if L12_2 then
        L12_2 = L5_1
        L13_2 = 0
        L14_2 = L11_2
        L12_2 = L12_2(L13_2, L14_2)
        if L12_2 then
          L12_2 = L6_2.timer
          if L2_2 > L12_2 then
            L12_2 = L13_1
            L12_2()
            L12_2 = L6_2.repeatDelay
            L12_2 = L2_2 + L12_2
            L6_2.timer = L12_2
          end
        end
      end
    end
  end
  L5_2 = L1_2.Left
  L5_2 = L5_2.Enabled
  if L5_2 then
    L5_2 = L1_2.Left
    L5_2 = L5_2.Keys
    L6_2 = L10_1.Left
    L7_2 = 1
    L8_2 = #L5_2
    L9_2 = 1
    for L10_2 = L7_2, L8_2, L9_2 do
      L11_2 = L5_2[L10_2]
      L12_2 = L3_1
      L13_2 = 0
      L14_2 = L11_2
      L12_2 = L12_2(L13_2, L14_2)
      if L12_2 then
        L12_2 = L1_2.Left
        L12_2.Active = true
        L6_2.held = true
        L12_2 = L6_2.delay
        L12_2 = L2_2 + L12_2
        L6_2.timer = L12_2
      end
      L12_2 = L4_1
      L13_2 = 0
      L14_2 = L11_2
      L12_2 = L12_2(L13_2, L14_2)
      if L12_2 then
        L6_2.held = false
      end
      L12_2 = L6_2.held
      if L12_2 then
        L12_2 = L5_1
        L13_2 = 0
        L14_2 = L11_2
        L12_2 = L12_2(L13_2, L14_2)
        if L12_2 then
          L12_2 = L6_2.timer
          if L2_2 > L12_2 then
            L12_2 = L1_2.Left
            L12_2.Active = true
            L12_2 = L6_2.repeatDelay
            L12_2 = L2_2 + L12_2
            L6_2.timer = L12_2
          end
        end
      end
    end
  end
  L5_2 = L1_2.Right
  L5_2 = L5_2.Enabled
  if L5_2 then
    L5_2 = L1_2.Right
    L5_2 = L5_2.Keys
    L6_2 = L10_1.Right
    L7_2 = 1
    L8_2 = #L5_2
    L9_2 = 1
    for L10_2 = L7_2, L8_2, L9_2 do
      L11_2 = L5_2[L10_2]
      L12_2 = L3_1
      L13_2 = 0
      L14_2 = L11_2
      L12_2 = L12_2(L13_2, L14_2)
      if L12_2 then
        L12_2 = L1_2.Right
        L12_2.Active = true
        L6_2.held = true
        L12_2 = L6_2.delay
        L12_2 = L2_2 + L12_2
        L6_2.timer = L12_2
      end
      L12_2 = L4_1
      L13_2 = 0
      L14_2 = L11_2
      L12_2 = L12_2(L13_2, L14_2)
      if L12_2 then
        L6_2.held = false
      end
      L12_2 = L6_2.held
      if L12_2 then
        L12_2 = L5_1
        L13_2 = 0
        L14_2 = L11_2
        L12_2 = L12_2(L13_2, L14_2)
        if L12_2 then
          L12_2 = L6_2.timer
          if L2_2 > L12_2 then
            L12_2 = L1_2.Right
            L12_2.Active = true
            L12_2 = L6_2.repeatDelay
            L12_2 = L2_2 + L12_2
            L6_2.timer = L12_2
          end
        end
      end
    end
  end
  L5_2 = L1_2.Select
  L5_2 = L5_2.Enabled
  if L5_2 and not L4_2 then
    L5_2 = L1_2.Select
    L5_2 = L5_2.Keys
    L6_2 = 1
    L7_2 = #L5_2
    L8_2 = 1
    for L9_2 = L6_2, L7_2, L8_2 do
      L10_2 = L5_2[L9_2]
      L11_2 = L3_1
      L12_2 = 0
      L13_2 = L10_2
      L11_2 = L11_2(L12_2, L13_2)
      if L11_2 then
        L11_2 = L1_2.Select
        L11_2.Active = true
      end
    end
    L6_2 = RageUI
    L6_2 = L6_2.ForceSelect
    if L6_2 then
      L6_2 = RageUI
      L6_2.ForceSelect = false
      L6_2 = L1_2.Select
      L6_2.Active = true
    end
  else
    L5_2 = RageUI
    L5_2 = L5_2.ForceSelect
    if L5_2 then
      L5_2 = RageUI
      L5_2.ForceSelect = false
    end
  end
  L5_2 = L1_2.Back
  L5_2 = L5_2.Enabled
  if L5_2 then
    L5_2 = L1_2.Back
    L5_2 = L5_2.Keys
    L6_2 = 1
    L7_2 = #L5_2
    L8_2 = 1
    for L9_2 = L6_2, L7_2, L8_2 do
      L10_2 = L5_2[L9_2]
      L11_2 = L3_1
      L12_2 = 0
      L13_2 = L10_2
      L11_2 = L11_2(L12_2, L13_2)
      if L11_2 then
        L11_2 = L14_1
        L11_2()
      end
    end
  end
end
L15_1.ProcessControls = L16_1
L15_1 = RageUI
L15_1.GoUp = L12_1
L15_1 = RageUI
L15_1.GoDown = L13_1
L15_1 = RageUI
L15_1.GoBack = L14_1
L15_1 = RageUI
L16_1 = RageUI
L16_1 = L16_1.ProcessControls
L15_1.GoControls = L16_1
L15_1 = RageUI
function L16_1()
  local L0_2, L1_2
end
L15_1.GoActionControl = L16_1
L15_1 = RageUI
L15_1.ForceSelect = false
L15_1 = RegisterCommand
L16_1 = "rageui_select"
function L17_1()
  local L0_2, L1_2
  L0_2 = RageUI
  L0_2.ForceSelect = true
end
L18_1 = false
L15_1(L16_1, L17_1, L18_1)
L15_1 = RegisterKeyMapping
L16_1 = "rageui_select"
L17_1 = "Menu : S\195\169lectionner"
L18_1 = "keyboard"
L19_1 = ""
L15_1(L16_1, L17_1, L18_1, L19_1)
