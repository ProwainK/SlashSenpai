memory.usememorydomain("WRAM")

while true do
  memory.writebyte(0x000A33, 0)
  memory.writebyte(0x000A67, 1)
  memory.writebyte(0x000A72, 0)
	emu.frameadvance()
end