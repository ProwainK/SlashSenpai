-- Freeze Gaki 7 Vanilla

--------------------------------------------------
-- for Bizhawk

memory.usememorydomain("WRAM")

--------------------------------------------------
-- 全域變數

player_hp = 0

--------------------------------------------------
-- 出刀小子 Mod

function freeze_gaki()

  -- 無限能源
  if memory.read_u8(0x000B84) == 255 then
    memory.write_u8(0x000B85, 156)
  end

  -- 水晶冰雹期間
  if memory.read_u8(0x000BC7) == 1 then
    -- 連射解禁
    memory.write_u8(0x000BC8, 0)
    -- 射擊加速
    if memory.read_u8(0x000C75) > 2 then
      memory.write_u8(0x000C75, 2)
    end
  end

end

--------------------------------------------------
-- 主程式

while true do

  player_hp = memory.read_u8(0x000C2E)

  if player_hp > 0 then

    -- 結冰小子 Mod
    freeze_gaki()

  end

	emu.frameadvance()
end

--------------------------------------------------
