memory.usememorydomain("MainRAM")

current_stage = 0
current_save_point = 0
boss_addr = memory.read_u16_le(0x093570)

function guard_shell()

  -- 攻擊判定次數增加 / 慢鏡取消
  -- (手感挺微妙的先放置，可嘗試打開)
  --memory.write_u8(0x09B64C, 0)

  memory.write_u8(0x0935D5, 0)

  if memory.read_u8(0x09B604) == 255 then
    button_check_1 = memory.read_u8(0x09B5FD)
    button_check_2 = memory.read_u8(0x09B5FF)
    if button_check_1 == 0 and button_check_2 == 0 then
      memory.write_u8(0x09B605, 1)
    end
  end

  if memory.read_u8(0x09B613) == 0 then
    damage_cd = 4
  else
    damage_cd = 10
  end

  boss_iframe_cancel()

end

function boss_iframe_cancel()
  boss_addr = memory.read_u16_le(0x093570)
  if memory.read_u8(0x0935CC) > 1 then
    if boss_addr == 0x3241 then
      if memory.read_u8(0x0935F8) > damage_cd then
        memory.write_u8(0x0935F8, damage_cd)
      end
    end
    if boss_addr == 0x3341 then
      if memory.read_u8(0x0935F4) > damage_cd then
        memory.write_u8(0x0935F4, damage_cd)
      end
    end
    if boss_addr == 0x3441 then
      if memory.read_u8(0x0935FE) > damage_cd then
        memory.write_u8(0x0935FE, damage_cd)
      end
    end
    if boss_addr == 0x3541 then
      if memory.read_u8(0x093604) > damage_cd then
        memory.write_u8(0x093604, damage_cd)
      end
    end
    if boss_addr == 0x3641 then
      if memory.read_u8(0x0935F0) > damage_cd then
        memory.write_u8(0x0935F0, damage_cd)
      end
    end
    if boss_addr == 0x3741 or boss_addr == 0x3841 then
      if memory.read_u8(0x0935FA) > damage_cd then
        memory.write_u8(0x0935FA, damage_cd)
      end
    end
    if boss_addr == 0x3961 then
      if memory.read_u8(0x093600) > damage_cd then
        memory.write_u8(0x093600, damage_cd)
      end
    end
    if boss_addr == 0x4261 then
      if memory.read_u8(0x0935FC) > damage_cd then
        memory.write_u8(0x0935FC, damage_cd)
      end
    end
    if boss_addr == 0x4361 then
      if memory.read_u8(0x0935F4) > damage_cd then
        memory.write_u8(0x0935F4, damage_cd)
      end
    end
  end
end

function alia_shut_up()
  memory.write_u16_le(0x0D31A5, 0xFFF8)
  memory.write_u16_le(0x0D31A7, 0xFFFF)
  memory.write_u16_le(0x0D31A9, 0xFFFF)
  memory.write_u8(0x0D31AB, 0x1F)
  memory.write_u16_le(0x0D31C5, 0xFFF8)
  memory.write_u16_le(0x0D31C7, 0xFFFF)
  memory.write_u16_le(0x0D31C9, 0xFFFF)
  memory.write_u8(0x0D31CB, 0x1F)
end

function turn_off_light()
  if current_stage == 16 and current_save_point ~= 3 then   
    memory.write_u8(0x09B783, 0)   
  end 
  if current_stage == 17 and current_save_point ~= 3 then
    memory.write_u8(0x09B783, 0)   
  end
  if current_stage == 18 and current_save_point ~= 2 then
    memory.write_u8(0x09B783, 0) 
  end
  if current_stage == 12 and current_save_point ~= 21 then
    memory.write_u8(0x09B783, 0)
  end
end

while true do

  current_stage = memory.read_u8(0x0D30E4)
  current_save_point = memory.read_u8(0x0D30F5)

  guard_shell()
  alia_shut_up()
  turn_off_light()

  emu.frameadvance()

end