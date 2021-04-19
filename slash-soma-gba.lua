memory.usememorydomain("Combined WRAM")

function soma_slash(attack_speed)
  memory.write_u8(0x000553, attack_speed)
end

while true do

  local soma_move_id = memory.read_u8(0x000551)
  local soma_move_state = memory.read_u8(0x000552)
  local soma_move_now = memory.read_u8(0x000553)

  if soma_move_id == 4 and soma_move_state == 1 then       -- 站立攻擊
    soma_slash(soma_move_now + 3)
  elseif soma_move_id == 6 and soma_move_state == 1 then   -- 蹲下攻擊
    soma_slash(soma_move_now + 3)
  elseif soma_move_id == 8 and soma_move_state == 1 then   -- 空中攻擊
    soma_slash(soma_move_now + 3)

  elseif soma_move_id == 12 then  -- J 叔被揍

  elseif soma_move_id == 14 then  -- 站立被揍
  elseif soma_move_id == 15 then  -- 蹲下被揍
  elseif soma_move_id == 16 then  -- 倒退被揍
  elseif soma_move_id == 17 then  -- 空中被揍
    -- zzz

  elseif soma_move_id == 31 and soma_move_state == 1 then  -- 滑壘 (Move 1)
    if soma_move_now > 4 then
      memory.write_u8(0x0004F1, 32)
    end
  elseif soma_move_id == 31 and soma_move_state == 2 then  -- 滑壘 (Move 2)
    memory.write_u8(0x0004F1, 32)


  -- 武器攻擊速度提升

  elseif soma_move_id == 45 and soma_move_state == 1 then  -- 站立揮劍
  elseif soma_move_id == 47 and soma_move_state == 1 then  -- 空中揮劍
  elseif soma_move_id == 48 and soma_move_state == 2 then  -- 蹲下揮劍
    -- zzz

  elseif soma_move_id == 57 and soma_move_state == 1 then  -- 站立龍神劍
  elseif soma_move_id == 58 and soma_move_state == 1 then  -- 空中龍神劍
  elseif soma_move_id == 59 and soma_move_state == 1 then  -- 蹲下龍神劍
    -- zzz

  elseif soma_move_id == 60 and soma_move_state < 1 then   -- 站立重槌
  elseif soma_move_id == 61 and soma_move_state < 1 then   -- 空中重槌
  elseif soma_move_id == 62 and soma_move_state < 1 then   -- 蹲下重槌
    -- zzz

  elseif soma_move_id == 63 and soma_move_state < 1 then   -- 站立西洋劍
  elseif soma_move_id == 64 and soma_move_state < 2 then   -- 空中西洋劍
  elseif soma_move_id == 65 and soma_move_state < 2 then   -- 蹲下西洋劍
    -- zzz

  elseif soma_move_id == 66 and soma_move_state < 1 then   -- 站立長槍
  elseif soma_move_id == 67 and soma_move_state == 1 then  -- 空中長槍
  elseif soma_move_id == 68 and soma_move_state == 1 then  -- 蹲下長槍
    -- zzz

  elseif soma_move_id == 69 and soma_move_state == 1 then  -- 站立拳頭
  elseif soma_move_id == 70 and soma_move_state == 1 then  -- 空中拳頭
  elseif soma_move_id == 71 and soma_move_state == 1 then  -- 蹲下拳頭
    -- zzz

  elseif soma_move_id == 78 then                           -- 升龍拳
  elseif soma_move_id == 79 and soma_move_state == 3 then  -- 集氣拳
  elseif soma_move_id == 80 and soma_move_state > 1 then   -- 必殺拳
    -- zzz

  else
    soma_slash(20)
  end

  -- 子彈數上升
  memory.write_u8(0x0131B2, 0)

  -- 無限魔力
  memory.write_u8(0x013270, 255)

	emu.frameadvance()

end