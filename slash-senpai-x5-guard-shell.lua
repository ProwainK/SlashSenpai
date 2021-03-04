memory.usememorydomain("MainRAM")

boss_addr = memory.read_u16_le(0x093570)

function guard_shell()
  -- 攻擊判定次數增加
  memory.write_u8(0x09B64C, 0)
  -- 頭目受擊 CD 時間取消
  memory.write_u8(0x0935D5, 0)
  -- 滅閃光 Nerf
  --if memory.read_u8(0x09B613) == 0 then
    -- 頭目無敵時間取消
  boss_iframe_cancel()
  --end
end

function boss_iframe_cancel()
  boss_addr = memory.read_u16_le(0x093570)
  if memory.read_u8(0x0935CC) > 1 then
    -- 烏賊 (0x3241)
    if boss_addr == 0x3241 then
      if memory.read_u8(0x0935F8) > 1 then
        memory.write_u8(0x0935F8, 1)
      end
    end
    -- 薔薇 (0x3341)
    if boss_addr == 0x3341 then
      if memory.read_u8(0x0935F4) > 1 then
        memory.write_u8(0x0935F4, 1)
      end
    end
    -- 暴龍 (0x3441)
    if boss_addr == 0x3441 then
      if memory.read_u8(0x0935FE) > 1 then
        memory.write_u8(0x0935FE, 1)
      end
    end
    -- 金姑 (0x3541)
    if boss_addr == 0x3541 then
      if memory.read_u8(0x093604) > 1 then
        memory.write_u8(0x093604, 1)
      end
    end
    -- 灰熊 (0x3641)
    if boss_addr == 0x3641 then
      if memory.read_u8(0x0935F0) > 1 then
        memory.write_u8(0x0935F0, 1)
      end
    end
    -- 飛馬 (0x3741) / 鯨魚 (0x3841)
    if boss_addr == 0x3741 or boss_addr == 0x3841 then
      if memory.read_u8(0x0935FA) > 1 then
        memory.write_u8(0x0935FA, 1)
      end
    end
    -- 蝙蝠 (0x3961)
    if boss_addr == 0x3961 then
      if memory.read_u8(0x093600) > 1 then
        memory.write_u8(0x093600, 1)
      end
    end
    -- 西格瑪 1 (0x4261)
    if boss_addr == 0x4261 then
      if memory.read_u8(0x0935FC) > 1 then
        memory.write_u8(0x0935FC, 1)
      end
    end
    -- 西格瑪 2 (0x4361)
    if boss_addr == 0x4361 then
      if memory.read_u8(0x0935F4) > 1 then
        memory.write_u8(0x0935F4, 1)
      end
    end
  end
end

while true do
  guard_shell()
  emu.frameadvance()
end