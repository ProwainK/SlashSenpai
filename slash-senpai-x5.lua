memory.usememorydomain("MainRAM")

-- 艾莉雅閉嘴
function alia_shut_up()

  -- X
  memory.write_u16_le(0x0D31A5, 0xFFF8)
  memory.write_u16_le(0x0D31A7, 0xFFFF)
  memory.write_u16_le(0x0D31A9, 0xFFFF)
  memory.write_u8(0x0D31AB, 0x1F)
  
  -- Z
  memory.write_u16_le(0x0D31C5, 0xFFF8)
  memory.write_u16_le(0x0D31C7, 0xFFFF)
  memory.write_u16_le(0x0D31C9, 0xFFFF)
  memory.write_u8(0x0D31CB, 0x1F)

end


-- 智慧型關燈
function turn_off_light()

  -- No Data 1
  if current_stage == 16 and current_save_point ~= 3 then   
    -- 關閉背景 (全程關閉)
    memory.write_u8(0x09B783, 0)   
  end 
  
  -- No Data 2
  if current_stage == 17 and current_save_point ~= 3 then
    -- 關閉背景
    -- BOSS 戰預設會開一下就關掉,
    -- 強制開啟會有半透明效果.
    memory.write_u8(0x09B783, 0)   
  end

  -- No Data 3
  if current_stage == 18 and current_save_point ~= 2 then
    -- 關閉背景
    memory.write_u8(0x09B783, 0) 
  end
  
  -- No Data 4
  if current_stage == 12 and current_save_point ~= 21 then
    -- 停止背景
    -- memory.write_u8(0x0CA984, 0)
    -- 關閉背景
    memory.write_u8(0x09B783, 0)
  end

end


-- 奇蹟砲
function miracle_enigma()

  -- 劇情畫面執行以下
  if current_stage == 11 then
  
    -- 殖民地破壞必定成功
    memory.write_u32_le(0x095450, 0x8B61)
    
  end

end


-- CD 
function boss_cd_cancel()

  -- 取得 BOSS 血量
  boss_hp = memory.read_u8(0x0935CC)
  
  -- 無敵時間關閉
  if boss_hp > 1 then
  
    --if memory.read_u8(0x0935F0) > 1 then
    --  memory.write_u8(0x0935F0, 1)
    --end
    
    -- if memory.read_u8(0x0958EC) == 2 then
    --   memory.write_u8(0x0935CC, boss_hp - 2)
    -- end

  end
  
  -- 頭目受傷 CD 時間取消
  memory.write_u8(0x0935D5, 0)
  
  -- 無敵特效關閉 / 慢鏡關閉 / 高連段
  memory.write_u8(0x09B64C, 0)

end


while true do

  current_stage = memory.readbyte(0x0D30E4)
  current_save_point = memory.readbyte(0x0D30F5)

  alia_shut_up()
  turn_off_light()
  miracle_enigma()
  boss_cd_cancel()

  emu.frameadvance()

end