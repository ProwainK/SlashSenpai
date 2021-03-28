-- Rockman X2 Outrage

--------------------------------------------------
-- 手動選項
-- 修改後面的 true 或 false，true 為開啟，false 為關閉

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

--------------------------------------------------
-- Boss Outrage

function enemy_outrage()
  boss_addr_search()
end

--------------------------------------------------
-- Boss 記憶體位置搜尋

function boss_addr_search()

  -- Boss Addr: 0x000D18, 0x000D58, 0x000D98, ...

  for boss_addr = 0x000D18, 0x000F98, 0x40 do

    -- Boss 活動中
    --if memory.read_u8(boss_addr + 0x03) ~= 0 then

      boss_id = memory.read_u8(boss_addr + 0x0A)
      enemy_id = memory.read_u8(boss_addr + 0x0A)

      -- 雜兵
      if enemy_id == 0x04 then                         -- 史萊坦 0x04
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
        if memory.read_u8(boss_addr + 0x01) == 4 then  -- 0x000D19
          memory.write_u16_le(boss_addr + 0x08, memory.read_u16_le(boss_addr + 0x08) - 2) -- 0x000D20
        end
      elseif enemy_id == 0x09 then                     -- 一字起子 0x09
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
        if memory.read_u8(boss_addr + 0x01) == 18 then -- 0x000D19
          memory.write_u8(boss_addr + 0x36, 29)        -- 0x000D4E
        end
      elseif enemy_id == 0x0C then                     -- 加農砲手 0x0C
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
        memory.write_u8(boss_addr + 0x3B, 0)           -- 0x000D53
        if memory.read_u8(boss_addr + 0x3C) > 5 then
          memory.write_u8(boss_addr + 0x3C, 5)         -- 0x000D54
        end
      elseif enemy_id == 0x0A then                     -- 搶奪者 0x0A
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
        if memory.read_u8(boss_addr + 0x34) > 1 then
          memory.write_u8(boss_addr + 0x34, 1)         -- 0x000D4C
        end
      elseif enemy_id == 0x0B then                     -- 操控者 V-1 0x0B
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
      elseif enemy_id == 0x10 then                     -- 操控者 R-5 0x10
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
        memory.write_u8(boss_addr + 0x3A, 1)           -- 0x000D52
      elseif enemy_id == 0x11 then                     -- 吊起來的機器人 0x11
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
      elseif enemy_id == 0x16 then                     -- 廢鐵機器人 (本體) 0x16
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
      elseif enemy_id == 0x17 then                     -- 跳蛙 0x17
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
      elseif enemy_id == 0x19 then                     -- 魚 0x19
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
        memory.write_u8(boss_addr + 0x34, 1)           -- 0x000D4C
      elseif enemy_id == 0x1A then                     -- 太陽能收集器 0x1A
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
        memory.write_u8(boss_addr + 0x3C, 255)         -- 0x000D54
      elseif enemy_id == 0x21 then                     -- 飛行播種機 0x21
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
      elseif enemy_id == 0x22 then                     -- 甲蟲 0x22
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
      elseif enemy_id == 0x2D then                     -- 重晶雷射 0x2D
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
        memory.write_u8(boss_addr + 0x33, 1)           -- 0x000D4B
      elseif enemy_id == 0x2F then                     -- 騎乘裝甲 0x2F
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
      elseif enemy_id == 0x1F then                     -- 摩根 0x30
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
        memory.write_u8(boss_addr + 0x34, 1)           -- 0x000D4C
      elseif enemy_id == 0x3A then                     -- 排障者 0x3A
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
      elseif enemy_id == 0x32 then                     -- 軟體探測器 0x32
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
        if memory.read_u8(boss_addr + 0x35) > 20 then
          memory.write_u8(boss_addr + 0x35, 20)        -- 0x000D4D
        end
      elseif enemy_id == 0x37 then                     -- 布瑞卡 0x37
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
        if memory.read_u8(boss_addr + 0x35) > 10 then
          memory.write_u8(boss_addr + 0x35, 10)        -- 0x000D4D
        end
      elseif enemy_id == 0x3F then                     -- 暴君 0x3F
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
        memory.write_u8(boss_addr + 0x3A, 0)           -- 0x000D52
      elseif enemy_id == 0x44 then                     -- 反射鏡 0x44
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
        if memory.read_u8(boss_addr + 0x34) > 30 then
          memory.write_u8(boss_addr + 0x34, 30)        -- 0x000D4C
        end
      elseif enemy_id == 0x47 then                     -- 公路騎士 0x47
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
      elseif enemy_id == 0x49 then                     -- 圓盤男孩 0x49
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
        memory.write_u8(boss_addr + 0x35, 1)           -- 0x000D4D
      elseif enemy_id == 0x50 then                     -- 鐵骨蝙蝠 0x50
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
      elseif enemy_id == 0x57 then                     -- 飛燕製造機 0x57
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
        memory.write_u8(boss_addr + 0x34, 1)           -- 0x000D4C
      elseif enemy_id == 0x58 then                     -- 飛燕 0x58
        memory.write_u8(boss_addr + 0x1F, 255)         -- 0x000D77
        --math.randomseed(tostring(os.time()):reverse():sub(1, 6))
        --memory.write_u8(boss_addr + 0x1D, math.random(-1, 5))  -- 0x000D75
      elseif enemy_id == 0x5B then                     -- 亞可蘭達 0x5B
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
        memory.write_u8(boss_addr + 0x33, 1)           -- 0x000D4B
      elseif enemy_id == 0x65 then                     -- 疾馳路行機 0x65
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
        memory.write_u8(boss_addr + 0x1F, 255)         -- 0x000D77

      -- Other
      elseif enemy_id == 0x30 then                     -- 牆壁上的瓦斯 0x30
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
      elseif enemy_id == 0x3E then                     -- 飛彈發射上升 0x3E
        memory.write_u8(boss_addr + 0x1D, 10)          -- 0x000DB5
      elseif enemy_id == 0x51 then                     -- 水晶滑落 0x51
        memory.write_u8(boss_addr + 0x33, 1)           -- 0x000D4B

      -- Mid Boss
      elseif enemy_id == 0x08 then                     -- 斬擊者 0x08
        memory.write_u8(boss_addr + 0x17, 1)           -- 0x000D6F
        --memory.write_u8(boss_addr + 0x3E, 1)           -- 0x000D96
      elseif enemy_id == 0x12 then                     -- 操控者 S-38 0x12
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
      elseif enemy_id == 0x29 then                     -- 深海坎斯勒
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D6B
      elseif enemy_id == 0x2A then                     -- 深海坎斯勒
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D6B
        memory.write_u8(boss_addr + 0x3C, 0)           -- 0x000D54
      elseif enemy_id == 0x33 then                     -- 雷達殺手 0x33
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
      elseif enemy_id == 0x4C then                     -- 巨型晶體 (子機)
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B
        if memory.read_u8(boss_addr + 0x03) == 4 then  -- 0x000D5B
          memory.write_u8(boss_addr + 0x39, 1)         -- 0x000D91
        end
      elseif enemy_id == 0x53 then                     -- 巨型晶體 (本體)
        memory.write_u8(boss_addr + 0x13, 1)           -- 0x000D2B

      -- Boss
      elseif boss_id == 0x0E then -- CF0 0x0E
        boss_outrage_cf0(boss_addr)
      elseif boss_id == 0x1D then -- 蝸牛 0x1D
        boss_outrage_crystal_snail(boss_addr)
      elseif boss_id == 0x1E then -- 螃蟹 0x1E
        boss_outrage_bubble_crab(boss_addr)
      elseif boss_id == 0x23 then -- 絲瓜 0x23
        boss_outrage_wire_sponge(boss_addr)
      elseif boss_id == 0x34 then -- 蜈蚣 0x34
        boss_outrage_magnet_centipede(boss_addr)
      elseif boss_id == 0x35 then -- 鴕鳥 0x35
        boss_outrage_sonic_ostrich(boss_addr)
      elseif boss_id == 0x36 then -- 亞吉爾 (劍) 0x36
        boss_outrage_agile(boss_addr)
      elseif boss_id == 0x38 then -- 火鹿 0x38
        boss_outrage_flame_stag(boss_addr)
      elseif boss_id == 0x3B then -- 飛蛾 1 0x3B
        boss_outrage_morph_moth_one(boss_addr)
      elseif boss_id == 0x4B then -- 飛蛾 2 0x4B
        boss_outrage_morph_moth_two(boss_addr)
      elseif boss_id == 0x3C then -- 鱷魚 0x3C
        boss_outrage_wheel_alligator(boss_addr)
      elseif boss_id == 0x45 then -- 鱷魚油池 0x45
        --boss_outrage_wheel_alligator_oil(boss_addr)
      elseif boss_id == 0x56 then -- 薩凱斯 (爺)
        boss_outrage_serges(boss_addr)
      elseif boss_id == 0x59 then -- 練拳機 0x59
        boss_outrage_sandbag(boss_addr)
      elseif boss_id == 0x5A then -- 拜歐倫 (球) 0x5A
        memory.write_u8(boss_addr + 0x13, 1) -- 0x000D6B
      elseif boss_id == 0x5E then -- 老西 2 0x5E
        if memory.read_u8(boss_addr + 0x02) == 10 then
          memory.write_u8(boss_addr + 0x39, 1) -- 0x000D91
        end
      elseif boss_id == 0x63 then -- 薩凱斯 (坦) 0x63
        memory.write_u8(boss_addr + 0x36, 0) -- 0x000F0E
      elseif boss_id == 0x67 then -- 老西 1 0x67
        memory.write_u8(boss_addr + 0x13, 1) -- 0x000D2B
      elseif boss_id == 0x68 then -- Zero 0x68
        memory.write_u8(boss_addr + 0x13, 1) -- 0x000D2B
      else
      end

    --end

  end

end

--------------------------------------------------
-- CF0 Outrage

function boss_outrage_cf0(boss_addr)

  local boss_hp = memory.read_u8(boss_addr + 0x27) -- 0x000D3F

  if boss_hp > 0 then

    local boss_move_id_addr = boss_addr + 0x02
    local boss_move_id = memory.read_u8(boss_move_id_addr)
    local boss_move_state_addr = boss_addr + 0x03
    local boss_move_state = memory.read_u8(boss_move_state_addr)
    local boss_outrage_speed = 1

    -- 通用
    if memory.read_u8(boss_addr + 0x33) > boss_outrage_speed then
      if boss_move_id == 6 and boss_move_state == 2 then
      elseif boss_move_id == 2 then
      elseif boss_move_id == 8 then
      elseif boss_move_id == 12 then
      elseif boss_move_id == 18 then
      elseif boss_move_id == 20 then
        memory.write_u8(boss_move_id_addr, 18)
      else
        memory.write_u8(boss_addr + 0x33, boss_outrage_speed) -- 0x000D4B
      end
    end

  end

end

--------------------------------------------------
-- 蝸牛 Outrage

function boss_outrage_crystal_snail(boss_addr)

  -- Boss addr: 0x000D18
  -- Boss ID: 0x1D
  -- Boss iframe: (+0x38) 0x000D50

  local boss_hp = memory.read_u8(boss_addr + 0x27) -- 0x000D3F

  if boss_hp > 0 then

    local boss_move_id_addr = boss_addr + 0x02
    local boss_move_id = memory.read_u8(boss_move_id_addr)
    local boss_move_state_addr = boss_addr + 0x03
    local boss_move_state = memory.read_u8(boss_move_state_addr)
    local boss_outrage_speed = 3

    -- 通用
    if memory.read_u8(boss_addr + 0x13) > boss_outrage_speed then -- 0x000D2B
      memory.write_u8(boss_addr + 0x13, boss_outrage_speed)
    end

    -- 通用 2
    if memory.read_u8(boss_addr + 0x33) > boss_outrage_speed then -- 0x000D4B
      -- 非縮殼狀態
      if boss_move_id ~= 6 and boss_move_id ~= 8 then
        memory.write_u8(boss_addr + 0x33, boss_outrage_speed)
      end
    end

    -- 通用 3
    memory.write_u8(boss_addr + 0x3F, 1) -- 0x000D57

    -- 空中縮殼迴旋
    if boss_move_id == 8 and boss_move_state == 4 then
      -- 非結冰狀態
      if memory.read_u8(0x001F55) == 0 then
        memory.write_u8(boss_addr + 0x33, 1) -- 0x000D4B
      end

    end

    -- RMMH 攻略
    -- 連打方向鍵、動作鍵、特武切換鍵都可加速解凍
    -- 按住泡泡不放會自動連發，效率相當優秀

  end

end

--------------------------------------------------
-- 螃蟹 Outrage

function boss_outrage_bubble_crab(boss_addr)

  -- Boss addr: 0x000D18
  -- Boss ID: 0x1E
  -- Boss iframe: (+0x39) 0x000D51

  local boss_hp = memory.read_u8(boss_addr + 0x27) -- 0x000D3F

  if boss_hp > 0 then

    local boss_move_id_addr = boss_addr + 0x02
    local boss_move_id = memory.read_u8(boss_move_id_addr)
    local boss_move_state_addr = boss_addr + 0x03
    local boss_move_state = memory.read_u8(boss_move_state_addr)
    local boss_outrage_speed = 1

    -- 通用
    if memory.read_u8(boss_addr + 0x13) > boss_outrage_speed then
      --if boss_move_id == 16 then -- 垂直跳擊
      --else
        memory.write_u8(boss_addr + 0x13, boss_outrage_speed) -- 0x000D2B
      --end
    end

    -- 護盾 Nerf
    --[[if memory.read_u8(boss_addr + 0x27) > 6 and memory.read_u8(boss_addr + 0x27) < 40 then
      memory.write_u8(boss_addr + 0x27, 6) -- 0x000D7F
    end--]]

  end

end

--------------------------------------------------
-- 絲瓜 Outrage

function boss_outrage_wire_sponge(boss_addr)

  -- Boss addr: 0x000D18
  -- Boss ID: 0x23
  -- Boss iframe: (+0x37) 0x000D4F

  local boss_hp = memory.read_u8(boss_addr + 0x27) -- 0x000D3F

  if boss_hp > 0 then

    local boss_move_id_addr = boss_addr + 0x02
    local boss_move_id = memory.read_u8(boss_move_id_addr)
    local boss_move_state_addr = boss_addr + 0x03
    local boss_move_state = memory.read_u8(boss_move_state_addr)
    local boss_outrage_speed = 1

    -- 通用
    if memory.read_u8(boss_addr + 0x13) > boss_outrage_speed then
      if boss_move_id == 4 and boss_move_state == 4 then -- 空中鞭擊 (出鞭)
      elseif boss_move_id == 4 and boss_move_state == 6 then -- 空中鞭擊 (體當)
      elseif boss_move_id == 6 and boss_move_state == 4 then -- 地上鞭擊 (出鞭)
      elseif boss_move_id == 10 and boss_move_state < 6 then -- 落雷前集氣
      else
        memory.write_u8(boss_addr + 0x13, boss_outrage_speed) -- 0x000D2B
      end
    end

    -- 甩鞭防禦加速
    if boss_move_id == 6 and boss_move_state == 2 then
      memory.write_u8(boss_addr + 0x33, memory.read_u8(boss_addr + 0x33) + 1) -- 0x000D4B
    end

    -- 落雷前集氣加速
    if boss_move_id == 10 and boss_move_state == 2 then
      if memory.read_u8(boss_addr + 0x33) > 12 then
      memory.write_u8(boss_addr + 0x33, memory.read_u8(boss_addr + 0x33) - 1) -- 0x000D4B
      end
    end

  end

end

--------------------------------------------------
-- 蜈蚣 Outrage

ttimer = 120

function boss_outrage_magnet_centipede(boss_addr)

  -- Boss addr: 0x000D18
  -- Boss ID: 0x34
  -- Boss iframe: (+0x35) 0x000D4D

  local boss_hp = memory.read_u8(boss_addr + 0x27) -- 0x000D3F

  if boss_hp > 0 then

    local boss_move_id_addr = boss_addr + 0x02
    local boss_move_id = memory.read_u8(boss_move_id_addr)
    local boss_move_state_addr = boss_addr + 0x03
    local boss_move_state = memory.read_u8(boss_move_state_addr)
    local boss_outrage_speed = 1

    -- 通用 1
    if memory.read_u8(boss_addr + 0x13) > boss_outrage_speed then
      if boss_move_id == 16 and boss_move_state == 10 then -- 吸引結束後無體當
      else
        memory.write_u8(boss_addr + 0x13, boss_outrage_speed) -- 0x000D2B
      end
    end

    -- 通用 2
    if memory.read_u8(boss_addr + 0x34) > 60 then
      if boss_move_id == 10 then -- 手裡劍
      else
        --memory.write_u8(boss_addr + 0x34, 60) -- 0x000D4C
      end
    end

    -- 通用 3
    if memory.read_u8(boss_addr + 0x53) > boss_outrage_speed then
      memory.write_u8(boss_addr + 0x53, boss_outrage_speed) -- 0x000D6B
    end

    if ttimer < 1 and boss_move_id == 8 and boss_move_state == 1 then
memory.write_u8(boss_move_id_addr, 18)
      memory.write_u8(boss_move_state_addr, 0)
      memory.write_u8(0x000D4C, 1)
      ttimer = 300
    end

    ttimer = ttimer - 1

    -- X 升龍拳的時候 + 非隱形 + 非機雷迴轉
    if memory.read_u8(0x0009DA) == 66 and boss_move_id ~= 10 and boss_move_id ~= 18 then
      -- 金蟬脫殼
      --memory.write_u8(boss_move_id_addr, 18)
      --memory.write_u8(boss_move_state_addr, 0)
      --memory.write_u8(0x000D4C, 1)
    end

  end

end

--------------------------------------------------
-- 鴕鳥 Outrage

function boss_outrage_sonic_ostrich(boss_addr)

  -- Boss addr: 0x000D18
  -- Boss ID: 0x35
  -- Boss iframe: (+0x35) 0x000D4D

  local boss_hp = memory.read_u8(boss_addr + 0x27) -- 0x000D3F

  if boss_hp > 0 then

    local boss_move_id_addr = boss_addr + 0x02
    local boss_move_id = memory.read_u8(boss_move_id_addr)
    local boss_move_state_addr = boss_addr + 0x03
    local boss_move_state = memory.read_u8(boss_move_state_addr)
    local boss_outrage_speed = 1

    -- 通用 1
    if memory.read_u8(boss_addr + 0x13) > boss_outrage_speed then -- 0x000D2B
      if boss_move_id == 4 and boss_move_state == 4 then -- 平地突進前置
      elseif boss_move_id == 6 and boss_move_state ~= 18 then -- 跳躍突進，除了最後的轉身
      elseif boss_move_id == 10 and boss_move_state == 12 then -- 音波群後落地硬直
      else
        memory.write_u8(boss_addr + 0x13, boss_outrage_speed)
      end
    end

    -- 音波群後落地硬直
    if boss_move_id == 10 and boss_move_state == 12 then
      if memory.read_u8(boss_addr + 0x13) > 6 then -- 0x000D2B
        memory.write_u8(boss_addr + 0x13, 6)
      end
    end

    -- 通用 2
    if memory.read_u8(boss_addr + 0x34) > boss_outrage_speed then -- 0x000D4C
      if boss_move_id == 6 then -- 跳躍突進
      else
        memory.write_u8(boss_addr + 0x34, boss_outrage_speed)
      end
    end

  end

end

--------------------------------------------------
-- 亞吉爾 (劍) Outrage

function boss_outrage_agile(boss_addr)

  local boss_hp = memory.read_u8(boss_addr + 0x27) -- 0x000D3F

  if boss_hp > 0 then

    local boss_move_id_addr = boss_addr + 0x02
    local boss_move_id = memory.read_u8(boss_move_id_addr)
    local boss_move_state_addr = boss_addr + 0x03
    local boss_move_state = memory.read_u8(boss_move_state_addr)
    local boss_outrage_speed = 1

    -- 通用
    if memory.read_u8(boss_addr + 0x33) > boss_outrage_speed then -- 0x000D4B
      if boss_move_id ~= 4 and boss_move_state ~= 8 then
        memory.write_u8(boss_addr + 0x33, boss_outrage_speed)
      end
    end

  end

end

--------------------------------------------------
-- 火鹿 Outrage

function boss_outrage_flame_stag(boss_addr)

  -- Boss addr: 0x000D18
  -- Boss ID: 0x38
  -- Boss iframe: (+0x35) 0x000D4D

  local boss_hp = memory.read_u8(boss_addr + 0x27) -- 0x000D3F

  if boss_hp > 0 then

    local boss_move_id_addr = boss_addr + 0x02
    local boss_move_id = memory.read_u8(boss_move_id_addr)
    local boss_move_state_addr = boss_addr + 0x03
    local boss_move_state = memory.read_u8(boss_move_state_addr)
    local boss_outrage_speed = 1

    -- 通用 1
    if memory.read_u8(boss_addr + 0x13) > boss_outrage_speed then -- 0x000D2B
      memory.write_u8(boss_addr + 0x13, boss_outrage_speed)
    end

    -- 
    if boss_hp < 13 then

    -- 通用 2
    if memory.read_u8(boss_addr + 0x34) > boss_outrage_speed then -- 0x000D4C
      memory.write_u8(boss_addr + 0x34, boss_outrage_speed)
    end

    if boss_move_id == 10 then
      memory.write_u8(0x00132B, 1)
    end

    if boss_move_id == 10 then
      if boss_move_state == 0 or boss_move_state == 4 then
      memory.write_u8(0x001320, 190)
      end
    end

    end

  end

end

--------------------------------------------------
-- 飛蛾 1 & 2 Outrage

function boss_outrage_morph_moth_one(boss_addr)

  -- Boss addr: 0x000D18
  -- Boss ID: 0x3B
  -- Boss iframe: (+0x35) 0x000D4D

  local boss_hp = memory.read_u8(boss_addr + 0x27) -- 0x000D3F

  if boss_hp > 0 then

    -- local boss_move_id_addr = boss_addr + 0x02
    -- local boss_move_id = memory.read_u8(boss_move_id_addr)
    -- local boss_move_state_addr = boss_addr + 0x03
    -- local boss_move_state = memory.read_u8(boss_move_state_addr)
    local boss_outrage_speed = 1

    -- 通用
    if memory.read_u8(boss_addr + 0x13) > boss_outrage_speed then
      memory.write_u8(boss_addr + 0x13, boss_outrage_speed) -- 0x000D2B
    end

  end

end

function boss_outrage_morph_moth_two(boss_addr)

  -- Boss addr: 0x000D58
  -- Boss ID: 0x4B
  -- Boss iframe: (+0x34) 0x000D8C

  local boss_hp = memory.read_u8(boss_addr + 0x27) -- 0x000D3F

  if boss_hp > 0 then

    -- local boss_move_id_addr = boss_addr + 0x02
    -- local boss_move_id = memory.read_u8(boss_move_id_addr)
    -- local boss_move_state_addr = boss_addr + 0x03
    -- local boss_move_state = memory.read_u8(boss_move_state_addr)
    local boss_outrage_speed = 1

    -- 通用 1
    if memory.read_u8(boss_addr + 0x13) > boss_outrage_speed then
      memory.write_u8(boss_addr + 0x13, boss_outrage_speed) -- 0x000D6B
    end

    -- 通用 2
    if memory.read_u8(boss_addr + 0x33) > 40 then
      memory.write_u8(boss_addr + 0x33, 40) -- 0x000D8B
    end

    -- 飛蛾在特定高度的時候
    if memory.read_u8(boss_addr + 0x09) == 5 or memory.read_u8(boss_addr + 0x09) == 7 then -- 0x000D61
      -- 飛行高度調整
      memory.write_u8(boss_addr + 0x1E, 13) -- 0x000D76
    end

  end

end

--------------------------------------------------
-- 鱷魚 Outrage & 鱷魚油池

function boss_outrage_wheel_alligator(boss_addr)

  -- Boss ID: 0x3C
  -- Boss addr: 0x000D58
  -- Boss iframe: (+0x35) 0x000D8D

  local boss_hp = memory.read_u8(boss_addr + 0x27) -- 0x000D7F

  if boss_hp > 0 then

    local boss_move_id_addr = boss_addr + 0x02
    local boss_move_id = memory.read_u8(boss_move_id_addr)
    local boss_move_state_addr = boss_addr + 0x03
    local boss_move_state = memory.read_u8(boss_move_state_addr)
    local boss_outrage_speed = 1

    -- 通用 1
    if memory.read_u8(boss_addr + 0x34) > boss_outrage_speed then
      if boss_move_id == 4 then -- 下潛
      elseif boss_move_id == 6 then -- 上咬
      elseif boss_move_id == 10 then -- 齒輪發射
      else
        memory.write_u8(boss_addr + 0x34, boss_outrage_speed) -- 0x000D8C
      end
    end

    -- 下潛期間待機加速
    if boss_move_id == 4 and boss_move_state == 4 then
      memory.write_u8(boss_addr + 0x34, memory.read_u8(boss_addr + 0x34) - 1)
    end

    -- 咬住傷害
    if boss_move_id == 6 and boss_move_state == 8 then
      if memory.read_u8(boss_addr + 0x34) > 10 then
        memory.write_u8(boss_addr + 0x34, 10) -- 0x000D8C
      end
    end

    -- 齒輪發射
    if boss_move_id == 10 then
      memory.write_u8(boss_addr + 0x13, 1) -- 0x000D6B
    end

    -- 突進前置加速
    if boss_move_id == 12 and boss_move_state == 0 then
      memory.write_u8(0x001F55, 0)
    end

    -- 通用 2
    memory.write_u8(boss_addr + 0x3E, 1) -- 0x000D96

  end

end

function boss_outrage_wheel_alligator_oil(boss_addr)

  -- Boss ID: 0x45
  -- Boss addr: 0x000D18

  memory.write_u8(boss_addr + 0x39, 4) -- 0x000D51

end

--------------------------------------------------
-- 薩凱斯 (爺) Outrage

function boss_outrage_serges(boss_addr)

  local boss_hp = memory.read_u8(boss_addr + 0x27) -- 0x000D7F

  if boss_hp > 0 then

    local boss_move_id_addr = boss_addr + 0x02
    local boss_move_id = memory.read_u8(boss_move_id_addr)
    local boss_move_state_addr = boss_addr + 0x03
    local boss_move_state = memory.read_u8(boss_move_state_addr)
    local boss_outrage_speed = 1

    -- 通用
    if memory.read_u8(boss_addr + 0x13) > boss_outrage_speed then
      memory.write_u8(boss_addr + 0x13, boss_outrage_speed) -- 0x000D2B
    end

  end

end

--------------------------------------------------
-- 練拳機 Outrage

function boss_outrage_sandbag(boss_addr)

  local boss_hp = memory.read_u8(boss_addr + 0x27) -- 0x000D7F

  if boss_hp > 0 then

    -- 通用
    memory.write_u8(boss_addr + 0x34, 1) -- 0x000D4C

  end

end

--------------------------------------------------
-- 飛行道具 Outrage

function fly_atk_item_outrage()

  for faitem_addr = 0x001318, 0x001598, 0x40 do

    -- 飛行道具活動中 0x00131A or 0x00131B
    if memory.read_u8(faitem_addr + 0x02) ~= 0 or memory.read_u8(faitem_addr + 0x03) ~= 0 then

      faitem_id = memory.read_u8(faitem_addr + 0x0A) -- 0x001322

      if faitem_id == 0x14 then -- 手裡劍 (蜈蚣)
        if memory.read_u8(faitem_addr + 0x1B) > 128 then
          --memory.write_u8(faitem_addr + 0x1B, 230) -- 0x001333
        end
        if memory.read_u8(faitem_addr + 0x1B) < 128 then
          --memory.write_u8(faitem_addr + 0x1B, 25)
        end

        --memory.write_u8(faitem_addr + 0x38, 255) -- 0x001350

        memory.write_u8(0x001368, memory.read_u8(0x001368) - 50) -- 0x001350

      end

    end

  end

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

    enemy_outrage()
    --fly_atk_item_outrage()

    --[[
    if is_one_hit_ko == true then
      one_hit_ko()
    end
    --]]

  end

	emu.frameadvance()

end

--------------------------------------------------
