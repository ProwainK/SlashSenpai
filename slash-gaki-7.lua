-- Slash Gaki 7

--------------------------------------------------
-- for Bizhawk

memory.usememorydomain("WRAM")

--------------------------------------------------
-- 全域變數

player_hp = 0
boss_hp = 0
boss_hp_before = 0

--------------------------------------------------
-- 出刀小子 Mod

function slash_gaki()

  -- 特武解禁 & 無限能源
  memory.write_u8(0x000B8D, 156)

  -- 真空切斷期間
  if memory.read_u8(0x000BC7) == 5 then

    -- 斬擊加速
    if memory.read_u8(0x000C75) > 2 then
      memory.write_u8(0x000C75, 2)
    end

    -- 斬擊附帶吸血效果
    slash_drain()

  end

  -- 連射解禁
  memory.write_u8(0x000BC8, 0)

  --memory.write_u8(0x000BC7, 5) -- 特殊武器鎖定
  --memory.write_u8(0x000C5E, 6) -- 顏色鎖定 (無效？)

end

--------------------------------------------------
-- 斬擊附帶吸血效果

function slash_drain()

  boss_hp = memory.read_u8(0x0019EE)

  if boss_hp < boss_hp_before then
    memory.write_u8(0x000C2E, memory.read_u8(0x000C2E) + (boss_hp_before - boss_hp))
    if memory.read_u8(0x000C2E) > 28 then
      memory.write_u8(0x000C2E, 28)
    end
  end

  boss_hp_before = memory.read_u8(0x0019EE)

end

--------------------------------------------------
-- 主程式

while true do

  player_hp = memory.read_u8(0x000C2E)

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
