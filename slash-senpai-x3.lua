memory.usememorydomain("WRAM")

while true do
  if memory.read_u8(0x000A8E) == 2 and memory.read_u8(0x0009F9) == 180 then
    memory.write_u8(0x000A8F, 2)
  else
    memory.write_u8(0x000A8F, 0)
  end
	emu.frameadvance()
end