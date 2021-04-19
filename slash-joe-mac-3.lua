-- Slash Joe Mac 3

--------------------------------------------------
-- for Bizhawk

memory.usememorydomain("WRAM")

--------------------------------------------------
-- 加速 Mod

function slash_joe()

  local joe_move_id = memory.read_u8(0x00020F)
  local joe_move_state = memory.read_u8(0x000210)
  local joe_move_now = memory.read_u8(0x000211)

  if joe_move_id == 4 and joe_move_state == 63 then      -- 一般走路 -> 加速
    memory.write_u8(0x000211, 1)
  elseif joe_move_id == 11 and joe_move_state == 63 then -- 爬繩 -> 加速
    memory.write_u8(0x000211, 1)
  elseif joe_move_id == 12 then                          -- 爬上平台
    -- zzz
  elseif joe_move_id == 48 and joe_move_state == 62 then -- 吐籽攻擊
    -- zzz
  elseif joe_move_state == 63 then
    -- zzz
  else
    memory.write_u8(0x000211, 1)
  end

end

--------------------------------------------------
-- 主程式

while true do
  slash_joe()
	emu.frameadvance()
end

--------------------------------------------------
