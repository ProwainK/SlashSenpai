-- Super Arthur Turbo

--------------------------------------------------
-- for Bizhawk

memory.usememorydomain("WRAM")

--------------------------------------------------
-- 超級飆速亞瑟 Mod

function super_arthur_turbo()

  -- 動畫加速
  if memory.read_u8(0x000460) > 2 then
    memory.write_u8(0x000460, 2)
  end

  -- 子彈冷卻加速
  if memory.read_u8(0x0014EC) > 2 then
    memory.write_u8(0x0014EC, 2)
  end

  -- 二段跳連射解禁
  memory.write_u8(0x0014C6, 0)

  -- 長槍連射
  memory.write_u8(0x001A9B, 0)
  -- 長槍 2 階連射
  memory.write_u8(0x001A9C, 0)

  -- 小刀連射
  memory.write_u8(0x001A9D, 0)
  -- 小刀 2 階連射
  memory.write_u8(0x001A9E, 0)

  -- 弓箭連射
  memory.write_u8(0x001A9F, 0)
  -- 弓箭 2 階連射
  memory.write_u8(0x001AA0, 0)

  -- 鐮刀連射
  memory.write_u8(0x001AA1, 0)
  -- 鐮刀 2 階連射
  memory.write_u8(0x001AA2, 0)

  -- 火把連射
  memory.write_u8(0x001AA3, 0)
  -- 火把 2 階連射
  memory.write_u8(0x001AA4, 0)

  -- 斧頭連射
  memory.write_u8(0x001AA5, 0)
  -- 斧頭 2 階連射
  memory.write_u8(0x001AA6, 0)

  -- 聖劍連射
  memory.write_u8(0x001AA7, 0)
  -- 聖劍 2 階連射
  memory.write_u8(0x001AA8, 0)

  -- 奶油派
  memory.write_u8(0x001AA9, 0)
  -- 奶油派 2 階連射
  memory.write_u8(0x001AAA, 0)

end

--------------------------------------------------
-- 主程式

while true do
  super_arthur_turbo()
	emu.frameadvance()
end

--------------------------------------------------
