memory.usememorydomain("WRAM")

-- 出刀前輩 Mod
function slash_senpai()

  -- 使用學長
  if memory.read_u8(0x000A8E) == 2 then
    -- 非騎乘狀態
    if memory.read_u8(0x0009F9) == 180 then
      memory.write_u8(0x000A8F, 2)
    else
      memory.write_u8(0x000A8F, 0)
    end
  end

  -- 使用學弟 & 可出刀
  if memory.read_u8(0x000A8E) == 0 then
    -- 可出刀
    if memory.read_u8(0x001FB2) == 128 or memory.read_u8(0x001FB2) == 252 then
      -- 非騎乘狀態
      if memory.read_u8(0x0009F9) == 180 then
        memory.write_u8(0x000A8F, 252)
      else
        memory.write_u8(0x000A8F, 0)
      end
    end
  end

end

-- 出刀動畫加速
function slash_boost()

  slash_ground_speed = 12
  slash_air_speed = 5

  if memory.read_u8(0x001FD7) > 0xEF then
    slash_ground_speed = 2
    slash_air_speed = 2
  end

  -- 地上斬 92
  if memory.read_u8(0x0009DA) == 92 then
    if memory.read_u8(0x0009EB) > slash_ground_speed then
      memory.write_u8(0x0009EB, slash_ground_speed)
    end
  end

  -- 空中斬 94
  if memory.read_u8(0x0009DA) == 94 then
    if memory.read_u8(0x0009EB) > slash_air_speed then
      memory.write_u8(0x0009EB, slash_air_speed)
    end
  end

end

while true do

  slash_senpai()
  slash_boost()

	emu.frameadvance()

end