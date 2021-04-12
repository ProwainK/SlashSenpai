-- Freeze Gaki 7

--------------------------------------------------
-- for Bizhawk

memory.usememorydomain("WRAM")

--------------------------------------------------
-- 全域變數

player_hp = 0

--------------------------------------------------
-- 特武解禁檢查

function freeze_unlock_check()

  -- 已攻略博物館 -> 解禁
  if memory.read_u8(0x000B7A) == 1 then
    memory.write_u8(0x000B85, 156)
    return
  end

  -- 博物館尚未攻略

  current_stage = memory.read_u8(0x000B73)

  if current_stage == 14 then -- 關卡脫離 & 選關 & 密碼

    -- 冰晶人尚未攻略 -> 封印
    if memory.read_u8(0x000B84) == 0 then
      memory.write_u8(0x000B85, 0)
      return
    end

  elseif current_stage == 1 then -- 冰晶人關

    -- 關卡裡面 -> 解禁
    if player_hp > 0 then

      memory.write_u8(0x000B85, 156)

      -- Exit 道具 -> 封印
      if memory.read_u8(0x001F94) == 1 and memory.read_u8(0x001F91) == 3 then
        memory.write_u8(0x000B85, 0)
        return
      end

      -- Boss 房門前重生點 & 房間裡面
      if memory.read_u8(0x000B74) == 2 then

        memory.write_u8(0x000B85, 156)

        -- 房間裡面 -> 可以用但仍然是未打贏狀態
        if memory.read_u8(0x000C06) == 23 then
          memory.write_u8(0x000B85, 28)
        end

        -- 冰晶人爆炸 -> 解禁
        if memory.read_u8(0x0019C1) == 4 then
          memory.write_u8(0x000B84, 255)
          return
        end

      end

    end

  else -- 其他關卡 -> 解禁

    -- 關卡裡面
    if player_hp > 0 then
      memory.write_u8(0x000B85, 156)
    end

  end

end

--------------------------------------------------
-- 結冰小子 Mod

function freeze_gaki()

  current_weapon = memory.read_u8(0x000BC7)

  if current_weapon == 1 then -- 水晶冰雹

    -- 射擊加速
    if memory.read_u8(0x000C75) > 2 then
      memory.write_u8(0x000C75, 2)
    end

  elseif current_weapon == 14 then -- 萊西裝甲

    -- 無限飛行次數
    memory.write_u8(0x000C77, 0)

  end

  -- 連射解禁
  memory.write_u8(0x000BC8, 0)
  -- 集氣解禁
  memory.write_u8(0x000BC9, 0)

  -- 子彈改造
  bullets_modify()

end

--------------------------------------------------
-- 跳躍高度加強

function high_jump()

  if memory.read_u8(0x0019CA) == 4 and memory.read_u8(0x0019EE) == 0 then
    memory.write_u8(0x000C2F, 1)
  end

  if memory.read_u8(0x000C1B) < 128 then
    if memory.read_u8(0x000C13) == 28 or memory.read_u8(0x000C13) == 29 then
      memory.write_u8(0x000C1A, 255)
    end
    if memory.read_u8(0x000C13) == 33 or memory.read_u8(0x000C13) == 34 then
      memory.write_u8(0x000C1A, 255)
    end
  end

end

--------------------------------------------------
-- 子彈改造

function bullets_modify()

  local current_boss = memory.read_u8(0x0019CA)
  local current_weapon = memory.read_u8(0x000BC7)

  if current_weapon == 0 then
    return
  end

  -- 冰晶人 (43) / 輸送龜 (76) / 氣力人 G (82) / 般若 (87)
  if current_boss == 43 or current_boss == 76 or current_boss == 82 or current_boss == 87 then
    if current_weapon == 1 then -- 冰晶變小炮
      -- from 0x000CC0, to 0x000E80, offset 0x40
      for bullet_addr = 0x000CC0, 0x000E80, 0x40 do
        memory.write_u8(bullet_addr + 0x0A, 1) -- 0x000CCA
        if memory.read_u8(bullet_addr + 0x01) > 2 then
          memory.write_u8(bullet_addr, 0)
          memory.write_u8(bullet_addr + 0x01, 0)
        end
      end
      return
    end
  end

  if current_weapon == 2 then -- 電鳴衝擊 -> 冰電磁炮
    for bullet_addr = 0x000CC0, 0x000E80, 0x40 do
      memory.write_u8(bullet_addr + 0x0A, 3) -- 0x000CCA
      memory.write_u8(bullet_addr + 0x01, 0)
      if memory.read_u8(bullet_addr + 0x01) > 2 then
        memory.write_u8(bullet_addr, 0)
        memory.write_u8(bullet_addr + 0x01, 0)
      end
    end
    return
  end

  if current_weapon == 3 then -- 廢鐵護盾 -> 冰晶護盾
    for bullet_addr = 0x000CC0, 0x000E80, 0x40 do
      if memory.read_u8(bullet_addr) == 128 then
        memory.write_u8(bullet_addr, 1)
        memory.write_u8(bullet_addr + 0x01, 0)
        memory.write_u8(bullet_addr + 0x0A, 3) -- 0x000CCA
      end
      if memory.read_u8(bullet_addr + 0x01) > 4 then
        memory.write_u8(bullet_addr, 0)
        memory.write_u8(bullet_addr + 0x01, 0)
      end
    end
    return
  end

  -- 燃燒火輪 -> 火冰晶
  -- 破壞音波 -> 穿透冰波
  if current_weapon == 4 or current_weapon == 6 then
    for bullet_addr = 0x000CC0, 0x000E80, 0x40 do
      if memory.read_u8(bullet_addr + 0x2F) ~= 0 then -- 0x000CEF
        memory.write_u8(bullet_addr + 0x0A, 3) -- 0x000CCA
        memory.write_u8(bullet_addr + 0x01, 0)
      end
      if memory.read_u8(bullet_addr + 0x01) > 2 then
        memory.write_u8(bullet_addr, 0)
        memory.write_u8(bullet_addr + 0x01, 0)
      end
    end
    return
  end

  if current_weapon == 5 then

--[[ -- 備案 1
  if memory.read_u8(0x000CEF) == 0 then
    memory.write_u8(0x000CCA, 3)
    memory.write_u8(0x000CC0, 128)
    memory.write_u8(0x000CC1, 2)
  end

  if memory.read_u8(0x000CC1) > 2 then
    memory.write_u8(0x000CC0, 0)
    memory.write_u8(0x000CC1, 0)
  end
--]]

    if memory.read_u8(0x000CD3) == 13 then
      memory.write_u8(0x000CCA, 3)
      memory.write_u8(0x000CC1, 0)
    end
    if memory.read_u8(0x000CC1) > 2 then
      memory.write_u8(0x000CC0, 0)
      memory.write_u8(0x000CC1, 0)
    end
    for bullet_addr = 0x000CC0, 0x000E80, 0x40 do
      if memory.read_u8(bullet_addr + 0x13) == 12 then -- 0x000CD3
        memory.write_u8(bullet_addr + 0x0A, 3) -- 0x000CCA
        memory.write_u8(bullet_addr + 0x01, 2)
      end
      if memory.read_u8(bullet_addr + 0x01) > 2 then
        memory.write_u8(bullet_addr, 0)
        memory.write_u8(bullet_addr + 0x01, 0)
      end
    end
    return
  end

  if current_weapon == 7 then -- 危險泡沫 -> 危險泡沫改
    for bullet_addr = 0x000CC0, 0x000E80, 0x40 do
      if memory.read_u8(0x000CF6) == 64 then
        memory.write_u8(0x000CF6, 0)
        memory.write_u8(bullet_addr, 128)
        memory.write_u8(bullet_addr + 0x01, 2)
        memory.write_u8(bullet_addr + 0x0A, 3) -- 0x000CCA
      end
      if memory.read_u8(bullet_addr + 0x01) > 2 then
        memory.write_u8(bullet_addr, 0)
        memory.write_u8(bullet_addr + 0x01, 0)
      end
    end
    return
  end

  if current_weapon == 8 then -- 瘋狂彈簧 -> 瘋狂彈簧改
    for bullet_addr = 0x000CC0, 0x000E80, 0x40 do
      if memory.read_u8(bullet_addr + 0x36) == 128 then -- 0x000CF6
        memory.write_u8(bullet_addr + 0x36, 0)
        memory.write_u8(bullet_addr, 1)
        memory.write_u8(bullet_addr + 0x01, 2)
        memory.write_u8(bullet_addr + 0x0A, 3) -- 0x000CCA
      end
      if memory.read_u8(bullet_addr + 0x01) > 2 then
        memory.write_u8(bullet_addr, 0)
        memory.write_u8(bullet_addr + 0x01, 0)
      end
    end
    return
  end

end

--------------------------------------------------
-- 主程式

while true do

  player_hp = memory.read_u8(0x000C2E)

  -- 特武解禁檢查
  freeze_unlock_check()

  if player_hp > 0 then

    -- 結冰小子 Mod
    freeze_gaki()

    -- 跳躍高度加強
    high_jump()

  end

	emu.frameadvance()
end

--------------------------------------------------
