-- Slash Kiddo 8

--------------------------------------------------
-- for Bizhawk

memory.usememorydomain("MainRAM")

--------------------------------------------------
-- 主程式

while true do

  memory.write_u8(0x1B131C, 1)  -- 特武解禁
  memory.write_u8(0x1B131F, 40) -- 無限能源

  -- 出刀加速
  if memory.read_u8(0x15D6DA) >= 99 and memory.read_u8(0x15D6DA) <= 104 then
    memory.write_u8(0x15D6C1, 1)
  end
  if memory.read_u8(0x15D6DA) >= 90 and memory.read_u8(0x15D6DA) <= 93 then
    memory.write_u8(0x15D6C1, 1)
  end

  emu.frameadvance()

end

--------------------------------------------------
