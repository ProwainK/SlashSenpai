-- Slash Gaki 7

--------------------------------------------------
-- for Bizhawk

memory.usememorydomain("WRAM")

--------------------------------------------------
-- 全域變數

player_hp = 0

--------------------------------------------------
-- 特武解禁檢查

function slash_unlock_check()

  -- 已觸發進城劇情 -> 解禁
  if memory.read_u8(0x000B7C) == 1 then
    --return
  end

  -- 博物館尚未攻略 -> 解禁
  if memory.read_u8(0x000B7A) == 0 then
    memory.write_u8(0x000B8D, 156)
    return
  end

  -- 已解鎖後四關
  if memory.read_u8(0x000B7B) == 1 then

    local current_stage = memory.read_u8(0x000B73)

    if current_stage == 14 then    -- 關卡脫離 & 選關 & 密碼

      -- 貓爪人尚未攻略 -> 封印
      if memory.read_u8(0x000B8C) == 0 then
        memory.write_u8(0x000B8D, 0)
        return
      end

    elseif current_stage == 5 then -- 貓爪人關

      -- 關卡裡面 -> 解禁
      if player_hp > 0 then

        memory.write_u8(0x000B8D, 156)

        -- Exit 道具 -> 封印
        if memory.read_u8(0x001F94) == 1 and memory.read_u8(0x001F91) == 3 then
          memory.write_u8(0x000B8D, 0)
          return
        end

        -- Boss 房門前重生點 & 房間裡面
        if memory.read_u8(0x000B74) == 2 then

          memory.write_u8(0x000B8D, 156)

          -- 房間裡面 -> 可以用但仍然是未打贏狀態
          if memory.read_u8(0x000C06) == 26 then
            memory.write_u8(0x000B8D, 28)
            -- 武器鎖定為真空切斷
            memory.write_u8(0x000BC7, 5)
          end

          -- 貓爪人爆炸 -> 解禁
          if memory.read_u8(0x0019C1) == 4 then
            memory.write_u8(0x000B8C, 255)
            return
          end

        end

      end

    else                           -- 其他關卡

      -- 關卡裡面 -> 解禁
      if player_hp > 0 then
        memory.write_u8(0x000B8D, 156)
      end

    end

  end

end

--------------------------------------------------
-- 出刀小子 Mod

function slash_gaki()

  current_weapon = memory.read_u8(0x000BC7)

  if current_weapon == 5 then      -- 真空切斷
    -- 斬擊加速
    if memory.read_u8(0x000C75) > 2 then
      memory.write_u8(0x000C75, 2)
    end
    -- 威利 1 劍氣變電球
    slash_wily_1()
    -- 威利 2 劍氣變彈簧
    slash_wily_2()
  elseif current_weapon == 14 then -- 萊西裝甲
    -- 無限飛行次數
    memory.write_u8(0x000C77, 0)
  end

  -- 連射解禁
  memory.write_u8(0x000BC8, 0)
  -- 集氣解禁
  memory.write_u8(0x000BC9, 0)

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
-- 威利 1 劍氣變電球

function slash_wily_1()

  if memory.read_u8(0x0019CA) ~= 92 then
    return
  end

  if memory.read_u8(0x000CEF) ~= 0 then
    memory.write_u8(0x000CEF, 255)
    -- 劍氣變電球
    memory.write_u8(0x000CCA, 4)
    memory.write_u8(0x000CC1, 0)
  end

  if memory.read_u8(0x000CC1) > 2 then
    memory.write_u8(0x000CC0, 0)
    memory.write_u8(0x000CC1, 0)
  end

end

--------------------------------------------------
-- 威利 2 劍氣變彈簧

function slash_wily_2()

  if memory.read_u8(0x0019CA) ~= 90 and memory.read_u8(0x0019CA) ~= 76 then
    return
  end

  if memory.read_u8(0x000CEF) ~= 0 then
    memory.write_u8(0x000CEF, 255)
    -- 劍氣變彈簧
    memory.write_u8(0x000CCA, 18)
    memory.write_u8(0x000CC1, 0)
  end

  if memory.read_u8(0x000CC1) > 2 then
    memory.write_u8(0x000CC0, 0)
    memory.write_u8(0x000CC1, 0)
  end

end


--------------------------------------------------
-- 主程式

while true do

  player_hp = memory.read_u8(0x000C2E)

  -- 特武解禁檢查
  slash_unlock_check()

  if player_hp > 0 then

    -- 出刀小子 Mod
    slash_gaki()

    -- 跳躍高度加強
    high_jump()

  end

	emu.frameadvance()
end

--------------------------------------------------
