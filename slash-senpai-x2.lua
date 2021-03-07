memory.usememorydomain("WRAM")

can_double_jump = true

function double_jump()
  if memory.read_u8(0x000A36) == 1 then
    jump_count = 0
  end
  if memory.read_u8(0x000A36) == 4 then
    jump_count = 0
  end
  if memory.read_u8(0x000A36) == 0 then
    if memory.read_u8(0x000A13) == 128 then
      jump_count = jump_count + 1
    end
  end
  if jump_count > 1 then
    memory.write_u8(0x000A14, 0)
  else
    memory.write_u8(0x000A14, 1)
  end
  if memory.read_u8(0x000A2D) == 16 then
    memory.write_u8(0x000A14, 0)
  end
end

while true do
  memory.writebyte(0x000A33, 0)
  memory.writebyte(0x000A67, 1)
  memory.writebyte(0x000A72, 0)
  double_jump()
	emu.frameadvance()
end