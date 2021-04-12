-- Slash Gaki 7 Vanilla

--------------------------------------------------
-- for Bizhawk

memory.usememorydomain("WRAM")

--------------------------------------------------
-- 全域變數

player_hp = 0

--------------------------------------------------
-- 出刀小子 Mod

function slash_gaki()

  -- 無限能源
  if memory.read_u8(0x000B8C) == 255 then
    memory.write_u8(0x000B8D, 156)
  end

  -- 真空切斷期間
  if memory.read_u8(0x000BC7) == 5 then
    -- 出刀加速
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

    -- 出刀小子 Mod
    slash_gaki()

  end

	emu.frameadvance()
end

--------------------------------------------------
