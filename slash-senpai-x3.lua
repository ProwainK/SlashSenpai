memory.usememorydomain("WRAM")

-- 出刀前輩 Mod
function slash_senpai()

  -- 使用學長 & 非騎乘狀態
  if memory.read_u8(0x000A8E) == 2 and memory.read_u8(0x0009F9) == 180 then
    memory.write_u8(0x000A8F, 2)
  else
    memory.write_u8(0x000A8F, 0)
  end

end

-- 出刀動畫加速
function slash_boost()

  -- 地上斬 92 / 空中斬 94
  if memory.read_u8(0x0009DA) == 92 or memory.read_u8(0x0009DA) == 94 then
    if memory.read_u8(0x0009EB) > 2 then
      memory.write_u8(0x0009EB, 2)
    end
  end

end

while true do

  slash_senpai()
  slash_boost()

	emu.frameadvance()

end