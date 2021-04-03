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
    -- 跳躍高度加強
    if memory.read_u8(0x000C13) == 28 and memory.read_u8(0x000C1B) < 128 then
      memory.write_u8(0x000C1A, 255)
    end
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
-- 主程式

while true do

  player_hp = memory.read_u8(0x000C2E)

  slash_unlock_check()

  if player_hp > 0 then

    -- 出刀小子 Mod
    slash_gaki()

  end

  -- 頭目無敵縮短
  --[[
  if memory.read_u8(0x0019F6) > 12 then
    memory.write_u8(0x0019F6, 12)
  end
  --]]

  -- 頭目 Boost
  --memory.write_u8(0x0019F2, 1)

	emu.frameadvance()
end

--------------------------------------------------
