-- Hyper Joe and Mac 3

--------------------------------------------------
-- for Bizhawk

memory.usememorydomain("WRAM")

--------------------------------------------------
-- Joe 加速 Mod

function joe_hyper_mod()

  local joe_move_id = memory.read_u8(0x00020F)
  local joe_move_state = memory.read_u8(0x000210)
  local joe_move_now = memory.read_u8(0x000211)

  if joe_move_id == 4 then       -- 一般走路 -> 加速
    memory.write_u8(0x000211, 1)
  elseif joe_move_id == 7 then   -- 跳躍下降中
    -- zzz
  elseif joe_move_id == 8 then   -- 跳躍上升中
    -- zzz
  elseif joe_move_id == 11 then  -- 爬繩 -> 加速
    memory.write_u8(0x000211, 1)
  elseif joe_move_id == 12 then  -- 爬繩平台爬上
    -- zzz
  elseif joe_move_id == 13 then  -- 爬繩平台掉落
    -- zzz
  elseif joe_move_id == 16 then  -- 被揍
    -- zzz
  elseif joe_move_id == 17 then  -- 吞食
    -- zzz
  else
    if joe_move_now > 2 then
      memory.write_u8(0x000211, 2)
    end
  end

end

--------------------------------------------------
-- Mac 加速 Mod

function mac_hyper_mod()

  local mac_move_id = memory.read_u8(0x00024F)
  local mac_move_state = memory.read_u8(0x000250)
  local mac_move_now = memory.read_u8(0x000251)

  if mac_move_id == 4 then       -- 一般走路 -> 加速
    memory.write_u8(0x000251, 1)
  elseif mac_move_id == 7 then   -- 跳躍下降中
    -- zzz
  elseif mac_move_id == 8 then   -- 跳躍上升中
    -- zzz
  elseif mac_move_id == 11 then  -- 爬繩 -> 加速
    memory.write_u8(0x000251, 1)
  elseif mac_move_id == 12 then  -- 爬繩平台爬上
    -- zzz
  elseif mac_move_id == 13 then  -- 爬繩平台掉落
    -- zzz
  elseif mac_move_id == 16 then  -- 被揍
    -- zzz
  elseif mac_move_id == 17 then  -- 吞食
    -- zzz
  else
    if mac_move_now > 2 then
      memory.write_u8(0x000251, 2)
    end
  end

end

--------------------------------------------------
-- 主程式

while true do
  joe_hyper_mod()
  mac_hyper_mod()
	emu.frameadvance()
end

--------------------------------------------------
