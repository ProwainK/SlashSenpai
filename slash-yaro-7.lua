-- Slash Yaro 7

--------------------------------------------------
-- for Bizhawk

memory.usememorydomain("WRAM")

--------------------------------------------------
-- 主程式

while true do

  -- 特武解禁 & 無限能源
  memory.write_u8(0x000B8D, 156)

  -- 真空切斷期間
  if memory.read_u8(0x000BC7) == 5 then
    -- 斬擊加速
    if memory.read_u8(0x000C75) > 2 then
      memory.write_u8(0x000C75, 2)
    end
  end

  -- 連射解禁
  memory.write_u8(0x000BC8, 0)

  --memory.write_u8(0x000BC7, 5) -- 特殊武器鎖定
  --memory.write_u8(0x000C5E, 6) -- 顏色鎖定 (無效？)

	emu.frameadvance()
end

--------------------------------------------------
