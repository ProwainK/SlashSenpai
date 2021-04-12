-- Slash Gaki 7

--------------------------------------------------
-- for Bizhawk

memory.usememorydomain("WRAM")

--------------------------------------------------
-- 全域變數

player_hp = 0
subtank_points = 0

--------------------------------------------------
-- 特武解禁檢查

function slash_unlock_check()

  -- 博物館尚未攻略 -> 解禁
  if memory.read_u8(0x000B7A) == 0 then
    memory.write_u8(0x000B8D, 156)
    return
  end

  -- 已觸發進城劇情 -> 解禁
  if memory.read_u8(0x000B7C) == 1 then
    memory.write_u8(0x000B8D, 156)
    return
  end

  -- 已解鎖後四關
  if memory.read_u8(0x000B7B) == 1 then
    if memory.read_u8(0x000B8C) == 255 then
      -- 已擊敗貓爪人 -> 解禁
      memory.write_u8(0x000B8D, 156)
      return
    else
      -- 關卡脫離 & 選關 & 密碼 -> 封印
      if memory.read_u8(0x0000E1) == 4 then
        memory.write_u8(0x000B8D, 0)
        return
      end
      -- 關卡裡面
      if player_hp > 0 then
        -- 其他關卡 -> 解禁
        memory.write_u8(0x000B8D, 156)
        -- Exit 道具 -> 封印
        if memory.read_u8(0x001F94) == 1 and memory.read_u8(0x001F91) == 3 then
          memory.write_u8(0x000B8D, 0)
          return
        end
        -- 貓爪人的房門
        if memory.read_u8(0x000B73) == 5 and memory.read_u8(0x000B74) == 2 then
          -- 貓爪人爆炸 -> 解禁
          if memory.read_u8(0x0019C1) == 4 then
            memory.write_u8(0x000B8C, 255)
            return
          end
          -- 判定相關 / 靠牆壁 -> 封印 (能源會歸零)
          if memory.read_u8(0x000C06) == 26 and memory.read_u8(0x000C05) < 30 then
            memory.write_u8(0x000B8D, 0)
          end
        end
      else
        memory.write_u8(0x000B8D, 0)
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

  --memory.write_u8(0x000BC7, 5) -- 特殊武器鎖定
  --memory.write_u8(0x000C5E, 151) -- 顏色鎖定 (無效？)

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
  end

end

--------------------------------------------------
-- 輸送龜改造

function slash_gamerizer()

  if memory.read_u8(0x000B73) == 11 and memory.read_u8(0x000B74) == 3 then

    -- 撞牆扣血
    if memory.read_u8(0x0019C2) == 12 and memory.read_u8(0x0019C3) == 0 then

      -- 傷害實作
      memory.write_u8(0x0019EE, memory.read_u8(0x0019EE) - 2)

      if memory.read_u8(0x0019EE) > 128 then
        memory.write_u8(0x0019EE, 0)
      end

      -- 沒血自爆
      if memory.read_u8(0x0019C1) == 4 and memory.read_u8(0x0019EE) == 0 then
        memory.write_u8(0x0019C1, 14)
        memory.write_u8(0x001100, 1)
        memory.write_u8(0x00110A, 51)
        memory.write_u8(0x00110C, 192)
        memory.write_u8(0x00110D, 25)
        memory.write_u8(0x001118, 1)
      end

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
-- 集點換 E 罐

function slash_subtank()

  -- 一罐需要 28 點
  if subtank_points >= 28 then

    subtank_now = memory.read_u8(0x000BA0)

    -- 身上沒帶滿的狀態
    if subtank_now < 4 then
      -- E 罐 +1
      memory.write_u8(0x000BA0, subtank_now + 1)
      -- E 罐音效
      memory.write_u8(0x000B50, 2)
      memory.write_u8(0x000B51, 0)
      memory.write_u8(0x000B52, 18)
      memory.write_u8(0x000B53, 0)
      -- 點數歸零
      subtank_points = 0
    end

    return

  end

  subtank_points = subtank_points + 1

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

    -- 輸送龜改造
    --slash_gamerizer()

  end

	emu.frameadvance()
end

--------------------------------------------------
