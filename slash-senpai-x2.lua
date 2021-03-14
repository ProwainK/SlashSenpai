-- Slash Senpai X2

--------------------------------------------------
-- 手動選項
-- 修改後面的 true 或 false，true 為開啟，false 為關閉

-- 二段跳
is_double_jump = true

-- 一撃必死挑戰 (一滴血 & 無限命)
-- 已改為測試用功能，不推薦打開遊玩
-- is_one_hit_ko = false

--------------------------------------------------
-- for Bizhawk

memory.usememorydomain("WRAM")

--------------------------------------------------
-- 全域變數

-- 玩家 HP
player_hp = 0
player_hp_before = 0

-- 出刀初始硬直
slash_speed = 6

-- 跳躍計數器
jump_count = 0

--------------------------------------------------
-- 出刀前輩 Mod

function slash_senpai()
  -- 非特武狀態
  if memory.read_u8(0x000A0B) == 0 then
    -- 集氣特效 & 音效取消
    memory.write_u8(0x000A33, 0)
    -- 二三段攻擊 Loop
    memory.write_u8(0x000A67, 1)
    -- 第二段攻擊變第三段攻擊
    memory.write_u8(0x000A72, 0)
  end
end

--------------------------------------------------
-- 出刀加速

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
-- 億兆爆破強化

function giga_buff()

  boss_iframe_addr = boss_iframe_addr_search()

  -- Boss 戰 & 受擊判定有效期間 (練拳機卡死 Bug 修正)
  --if boss_iframe_addr ~= 0 and memory.read_u8(0x001108) == 0 then

  if boss_iframe_addr ~= 0 then
    -- Boss 無敵縮短
    if memory.read_u8(0x00110F) > 0 then
      if memory.read_u8(boss_iframe_addr) > 1 then
        memory.write_u8(boss_iframe_addr, 1)
      end
    end
  end

  -- 昇龍拳解鎖
  if memory.read_u8(0x001FB1) == 128 then
    -- 體當能源回復
    current_giga_energy = memory.read_u8(0x001FCB)
    if player_hp_before > player_hp then
      add_energy = current_giga_energy + player_hp_before - player_hp
      if add_energy > 92 then
        add_energy = 92
      end
      memory.write_u8(0x001FCB, add_energy)
    end
    player_hp_before = player_hp
    -- 地上斬瞬間能源回復
    current_giga_energy = memory.read_u8(0x001FCB)
    if memory.read_u8(0x000A7C) == 86 then
      add_energy = current_giga_energy + 1
      if add_energy > 92 then
        add_energy = 92
      end
      memory.write_u8(0x001FCB, add_energy)
    end
  end

end

function boss_iframe_addr_search()

  -- Boss Addr: 0x000D18, 0x000D58, 0x000D98, ...

  for boss_addr = 0x000D18, 0x000F18, 0x40 do

    -- Boss 活動中
    if memory.read_u8(boss_addr + 0x03) ~= 0 then

      boss_id = memory.read_u8(boss_addr + 0x0A)

      if boss_id == 0x0E then     -- CF0
        return (boss_addr + 0x33) -- 0x000DCB
      elseif boss_id == 0x1D then -- 蝸牛
        return (boss_addr + 0x38) -- 0x000D50
      elseif boss_id == 0x1E then -- 螃蟹
        return (boss_addr + 0x39) -- 0x000D51
      elseif boss_id == 0x23 then -- 絲瓜
        return (boss_addr + 0x37) -- 0x000D4F
      elseif boss_id == 0x34 then -- 蜈蚣
        return (boss_addr + 0x35) -- 0x000D4D
      elseif boss_id == 0x35 then -- 鴕鳥
        return (boss_addr + 0x35) -- 0x000D4D
      elseif boss_id == 0x36 then -- 亞吉爾 (劍)
        return (boss_addr + 0x35) -- 0x000D4D
      elseif boss_id == 0x38 then -- 火鹿
        return (boss_addr + 0x35) -- 0x000D4D
      elseif boss_id == 0x3B then -- 飛蛾 1
        return (boss_addr + 0x35) -- 0x000D4D
      elseif boss_id == 0x4B then -- 飛蛾 2
        return (boss_addr + 0x34) -- 0x000D8C
      elseif boss_id == 0x45 then -- 鱷魚
        return (boss_addr + 0x35) -- 0x000D8D
      elseif boss_id == 0x56 then -- 薩凱斯 (爺)
        return (boss_addr + 0x35) -- 0x000DCD
      elseif boss_id == 0x59 then -- 練拳機
        return (boss_addr + 0x36) -- 0x000D4E
      elseif boss_id == 0x5A then -- 拜歐倫 (球)
        return (boss_addr + 0x35) -- 0x000D8D
      elseif boss_id == 0x63 then -- 薩凱斯 (坦)
        return (boss_addr + 0x34) -- 0x000F0C
      elseif boss_id == 0x67 then -- 老西 1
        return (boss_addr + 0x37) -- 0x000D4F
      else
      end

    end

  end

  return 0

end

--------------------------------------------------
-- 一撃必死挑戰 (一滴血 & 無限命)

function one_hit_ko()
  memory.write_u8(0x0009FF, 1)
  memory.write_u8(0x001FB3, 9)
end

--------------------------------------------------
-- 主程式

while true do

  player_hp = memory.read_u8(0x0009FF)

  -- 角色活著的時候生效
  if player_hp > 0 and player_hp < 100 then

    slash_senpai()
    slash_boost()
    giga_buff()

    if is_double_jump == true then
      double_jump()
    end

    --[[
    if is_one_hit_ko == true then
      one_hit_ko()
    end
    --]]

  end

	emu.frameadvance()

end

--------------------------------------------------
