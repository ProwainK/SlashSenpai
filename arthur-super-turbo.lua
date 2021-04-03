-- Arthur Super Turbo

--------------------------------------------------
-- for Bizhawk

memory.usememorydomain("WRAM")

--------------------------------------------------
-- 出刀亞瑟 Mod

function slash_arthur()

  -- 動畫加速
  if memory.read_u8(0x000460) > 2 then
    memory.write_u8(0x000460, 2)
  end

  -- 二段跳連射
  memory.write_u8(0x0014C6, 0)

  -- 長槍連射
  memory.write_u8(0x001A9B, 1)

  -- 長槍 2 階連射
  memory.write_u8(0x001A9C, 0)

  -- 小刀連射
  memory.write_u8(0x001A9D, 1)

  -- 弓箭連射
  memory.write_u8(0x001A9F, 1)

  -- 弓箭 2 階連射
  memory.write_u8(0x001AA0, 1)

  -- 鐮刀連射
  memory.write_u8(0x001AA1, 0)

  -- 鐮刀 2 階連射
  memory.write_u8(0x001AA2, 0)

  -- 火把連射
  memory.write_u8(0x001AA3, 1)

  -- 火把 2 階連射
  memory.write_u8(0x001AA4, 1)

end

--------------------------------------------------
-- 主程式

while true do
  slash_arthur()
	emu.frameadvance()
end

--------------------------------------------------
