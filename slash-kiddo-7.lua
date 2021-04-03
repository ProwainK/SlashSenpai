-- Slash Kiddo 7

--------------------------------------------------
-- for Bizhawk

memory.usememorydomain("WRAM")

--------------------------------------------------
-- 出刀小子 Mod

function slash_kiddo()

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

end

--------------------------------------------------
-- 主程式

while true do

  slash_kiddo()

  -- 頭目無敵縮短
  if memory.read_u8(0x0019F6) > 12 then
    memory.write_u8(0x0019F6, 12)
  end

  -- 頭目 HP 0x0019EE

  -- 頭目 Boost
  --memory.write_u8(0x0019F2, 1)

	emu.frameadvance()
end

--------------------------------------------------
