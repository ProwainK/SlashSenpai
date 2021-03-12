-- Slash Senpai X3

--------------------------------------------------
-- 手動選項
-- 修改後面的 true 或 false，true 為開啟，false 為關閉

-- 一撃必死挑戰
-- 一滴血 & 無限命
is_one_hit_ko = false

--------------------------------------------------
-- for Bizhawk

memory.usememorydomain("WRAM")

--------------------------------------------------
-- 出刀前輩 Mod

function slash_senpai()
  -- 非特武狀態
  if memory.read_u8(0x000A0B) == 0 then
    -- 使用學長
    if memory.read_u8(0x000A8E) == 2 then
      -- 非騎乘狀態
      if memory.read_u8(0x0009F9) == 180 then
        memory.write_u8(0x000A8F, 2)
      else
        memory.write_u8(0x000A8F, 0)
      end
    end
    -- 使用學弟
    if memory.read_u8(0x000A8E) == 0 then
      -- 可出刀
      if memory.read_u8(0x001FB2) >= 128 then
        -- 非騎乘狀態
        if memory.read_u8(0x0009F9) == 180 then
          memory.write_u8(0x000A8F, 252)
        else
          memory.write_u8(0x000A8F, 0)
        end
      end
    end
  end
end

--------------------------------------------------
-- 出刀動畫加速

function slash_boost()

  slash_speed_x_ground = 5
  slash_speed_x_air = 2
  slash_speed_z_ground = 7
  slash_speed_z_air = 4

  -- 使用學弟
  if memory.read_u8(0x000A8E) == 0 then
    -- 金甲加速
    if memory.read_u8(0x001FD7) > 0xEF then
      slash_speed_x_ground = 3
      slash_speed_x_air = 1
    end
    -- 地上斬 92
    if memory.read_u8(0x0009DA) == 92 then
      if memory.read_u8(0x0009EB) > slash_speed_x_ground then
        memory.write_u8(0x0009EB, slash_speed_x_ground)
      end
    end
    -- 空中斬 94
    if memory.read_u8(0x0009DA) == 94 then
      if memory.read_u8(0x0009EB) > slash_speed_x_air then
        memory.write_u8(0x0009EB, slash_speed_x_air)
      end
    end
  end

  -- 使用學長
  if memory.read_u8(0x000A8E) == 2 then
    -- 黑漆加速
    if memory.read_u8(0x001FD7) > 0xEF then
      slash_speed_z_ground = 2
      slash_speed_z_air = 1
    end
    -- 地上斬 92
    if memory.read_u8(0x0009DA) == 92 then
      if memory.read_u8(0x0009EB) > slash_speed_z_ground then
        memory.write_u8(0x0009EB, slash_speed_z_ground)
      end
    end
    -- 空中斬 94
    if memory.read_u8(0x0009DA) == 94 then
      if memory.read_u8(0x0009EB) > slash_speed_z_air then
        memory.write_u8(0x0009EB, slash_speed_z_air)
      end
    end
  end

end

--------------------------------------------------
-- 一撃必死挑戰
-- 一滴血 & 無限命

function one_hit_ko()
  if memory.read_u8(0x0009FF) > 1 then
    memory.write_u8(0x0009FF, 1)
  end
  memory.write_u8(0x001FB4, 9)
end

--------------------------------------------------
-- 主程式

while true do

  -- 角色活著的時候生效
  if memory.read_u8(0x0009FF) ~= 0 then

    slash_senpai()
    slash_boost()

    if is_one_hit_ko == true then
      one_hit_ko()
    end

  end

	emu.frameadvance()

end

--------------------------------------------------
