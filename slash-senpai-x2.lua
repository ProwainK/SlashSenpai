memory.usememorydomain("WRAM")

jump_count = 0

-- 出刀前輩 Mod
function slash_senpai()

  -- 集氣特效 & 音效取消
  memory.write_u8(0x000A33, 0)

  -- 二三段攻擊 Loop
  memory.write_u8(0x000A67, 1)

  -- 第二段攻擊變第三段攻擊
  memory.write_u8(0x000A72, 0)

end

-- 二段跳
function double_jump()

  local jump_status = memory.read_u8(0x000A36)

  -- 空中 0
  if jump_status == 0 then
    -- 接受輸入跳躍
    if memory.read_u8(0x000A13) >= 128 then
      jump_count = jump_count + 1
    end
  end

  -- 右牆滑落 1 / 左牆滑落 2 / 地上 4 / 電梯 196
  if jump_status == 1 or jump_status == 2 or jump_status == 4 or jump_status == 196 then
    jump_count = 0
  end

  -- 貼牆
  if memory.read_u8(0x000A05) == 59 then
    jump_count = 0
  end

  -- 跳躍次數結算
  if jump_count > 1 then
    memory.write_u8(0x000A14, 0)
  else
    memory.write_u8(0x000A14, 1)
  end

  -- 衝刺期間禁止二段跳
  if memory.read_u8(0x000A2D) == 16 then
    memory.write_u8(0x000A14, 0)
  end

end

-- 出刀動畫加速
function slash_boost()

  slash_speed = 10

  -- 昇龍拳已解鎖
  if memory.read_u8(0x001FB1) == 128 then
    slash_speed = 1
  end

  -- 地上斬 76 / 空中斬 80
  if memory.read_u8(0x0009DA) == 76 or memory.read_u8(0x0009DA) == 80 then
    if memory.read_u8(0x0009EB) > slash_speed then
      memory.write_u8(0x0009EB, slash_speed)
    end
  end

end

while true do

  -- 學長活著的時候生效
  if memory.read_u8(0x0009FF) ~= 0 then
    slash_senpai()
    slash_boost()
    double_jump()
  end

	emu.frameadvance()

end