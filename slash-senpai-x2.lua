-- Slash Senpai X2

--------------------------------------------------
-- 手動選項
-- 修改後面的 true 或 false，true 為開啟，false 為關閉

-- 二段跳
is_double_jump = true

-- 一撃必死挑戰
-- 一滴血 & 無限命
is_one_hit_ko = false

--------------------------------------------------
-- for Bizhawk

memory.usememorydomain("WRAM")

--------------------------------------------------
-- 出刀前輩 Mod

function slash_senpai()
  -- 豆炮 / 出刀狀態
  if memory.read_u8(0x000A0B) == 0 then
    -- 集氣特效 / 音效取消
    memory.write_u8(0x000A33, 0)
    -- 二三段攻擊 Loop
    memory.write_u8(0x000A67, 1)
    -- 第二段攻擊變第三段攻擊
    memory.write_u8(0x000A72, 0)
  end
end

--------------------------------------------------
-- 出刀動畫加速

-- 預設出刀最大硬直
slash_speed = 6

function slash_boost()

  -- 昇龍拳解鎖
  if memory.read_u8(0x001FB1) == 128 then
    -- 出刀硬直會變最小
    slash_speed = 1
  else
    slash_speed = 6
  end

  -- 地上斬 76 / 空中斬 80
  if memory.read_u8(0x0009DA) == 76 or memory.read_u8(0x0009DA) == 80 then
    if memory.read_u8(0x0009EB) > slash_speed then
      memory.write_u8(0x0009EB, slash_speed)
    end
  end

end

--------------------------------------------------
-- 二段跳

jump_count = 0

function double_jump()

  -- 集氣 Bug 處理，仍有少量集氣相關貼圖 Bug
  memory.write_u8(0x000A14, 0)

  -- 跳躍狀態
  local jump_status = memory.read_u8(0x000A36)

  -- 空中 0
  if jump_status == 0 and jump_count == 0 then
    -- 接受輸入跳躍
    if memory.read_u8(0x000A13) >= 128 then
      -- 二段跳可行狀態
      memory.write_u8(0x000A14, 1)
      -- 跳躍次數 +1
      jump_count = jump_count + 1
    end
  end

  -- 右牆滑落 1 / 左牆滑落 2 / 地上 4 / 電梯 196
  if jump_status == 1 or jump_status == 2 or jump_status == 4 or jump_status == 196 then
    -- 跳躍次數 Reset
    jump_count = 0
  end

  -- 蹬牆處理
  if memory.read_u8(0x0009DA) == 16 then
    -- 跳躍次數 Reset
    jump_count = 0
  end

  -- 衝刺期間禁止二段跳
  if memory.read_u8(0x000A2D) == 16 then
    memory.write_u8(0x000A14, 0)
  end

end

--------------------------------------------------
-- 一撃必死挑戰
-- 一滴血 & 無限命

function one_hit_ko()
  if memory.read_u8(0x0009FF) > 1 then
    memory.write_u8(0x0009FF, 1)
  end
  memory.write_u8(0x001FB3, 9)
end

--------------------------------------------------
-- 主程式

while true do

  -- 學長活著的時候生效
  if memory.read_u8(0x0009FF) ~= 0 then

    slash_senpai()
    slash_boost()

    if is_double_jump == true then
      double_jump()
    end
    if is_one_hit_ko == true then
      one_hit_ko()
    end

  end

	emu.frameadvance()

end

--------------------------------------------------
