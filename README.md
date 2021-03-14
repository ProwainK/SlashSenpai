# 出刀前輩 (Slash Senpai)

![Imgur](https://i.imgur.com/KsmGpk8.jpeg)

https://clips.twitch.tv/TastyCovertGuanacoKreygasm-a9rZtGVmspKJ4Zgy
  
把學長版改造成一直出刀狀態，  
破關流暢度瞬間 UPUP :)


------

## 為何而來 / WHY

原改造版「Mega Man X2 Zero Playable」，  
雖然能夠使用學長，卻在各種地方改造並設下許多限制，  
甚至禁止了相當實用的空中衝刺，非常可惜。  
  
經過一番研究，除了解禁空衝之外，  
不經意間發展出一套學長能夠一直出刀的 Mod，  
這就是「出刀前輩 (Slash Senpai)」的由來。  
  
Slash Senpai modified from "Mega Man X2 Zero Playable" that allow you can play with Zero,   
however the romhack itself design so much nerf, such as air dash disable.  
  
After some research, air dash come back, and zero can always slash now,  
this is why the name "Slash Senpai".


------

## X2 空衝修正原理 / How I fix air dash

利用 IPS Peek 把 0x00043B66 的值從 B0 改為原本的 D0。

Fix value at 0x00043B66 from B0 to D0 by IPS Peek.


------

## 簡介 & 使用方式


------

## 如何使用 IPS 檔 / How to use IPS


### Hack64 Web Patcher (線上 / Online)

https://hack64.net/tools/patcher.php

ROM 欄位選擇 ROM 檔，
Patch 欄位選擇 IPS 檔，
再按下 Patch 按鍵。


### Lunar IPS (單機 / Local)

https://www.romhacking.net/utilities/240/

可以使用 IPS 檔來改造遊戲，或用來製作 IPS 檔。


------

## 出刀前輩 X2 / Slash Senpai X2

原改造版為 Mega Man X2 Zero Playable (Graphic and Text Fix) 1.1。

Lua 改造：
- 一直出刀 / Slash Always
- 出刀加速 / Slash Boost
- 億兆爆破強化 / Giga Buff

IPS 檔包含：
- Mega Man X2 Zero Playable 1.0a with pallete change
- Mega Man X2 Zero Playable (Graphic and Text Fix) 1.1
- 空衝修正 / Air Dash Fix

直接在美版 ROM 打上「slash-senpai-x2.ips」這個 IPS 檔來改造即可。

X2 美版 ROM 資訊 / US ROM Info：
Mega Man X2 (USA)  
No-Intro: Super Nintendo Entertainment System (v. 20180813-062835)  
SHA-1: 637079014421563283CDED6AEAA0604597B2E33C  
CRC32: 947B0355

Issue (dont know how to fix)：
- 惱人的被揍連段系統 / Annoying Combo System when get hit
- 二段跳後可以接空衝 / Air Dash after Double Jump
- 集氣相關貼圖 Bug / Graphic Glitch when Zero charged
- [為了輸出] 對練拳機使用億兆爆破機率卡死 Bug / [For DPS] Agile Flyer softlock when Giga Crush


------

## 出刀前輩 X3 / Slash Senpai X3

原改造版為 Mega Man X3 Zero Project 4.1。

Lua 改造：
- 一直出刀 / Slash Always
- 出刀加速 / Slash Boost
- 出刀後輩 / Slash Kouhai


------

## 出刀前輩 X5 / Slash Senpai X5

PS 日版 / JP Version，開發中。


------

## BizHawk & Lua

Mod 開發版本為 2.6.1，SFC 核心是 Snes9x。

SFC 遊戲需要 CX4 ROM，PS 遊戲需要歐美日三種語言版本 BIOS。

改造完成之後，使用 BizHawk 打開遊戲，  
選單 Tools -> Lua Console，  
Lua 小視窗的 Script -> Open Script，  
選擇相對應的 Lua 檔案即可開始遊戲。


------

## 感謝


### 遊玩 & 測試

グレイガ (grega12076318)
https://www.twitch.tv/grega12076318

ムショウ (mengxiang)
https://www.twitch.tv/mengxiang

pachi_zx
https://www.twitch.tv/pachi_zx


### X5 金手指提供

World9918  
https://www.ptt.cc/bbs/Rockman/M.1316842395.A.AF2.html  
艾莉雅閉嘴  
https://www.ptt.cc/bbs/Rockman/M.1306374372.A.867.html  
關閉背景  
  
Append  
https://www.ptt.cc/bbs/Rockman/M.1449705915.A.D74.html  
智慧型關燈  
  
h1236660 & RMMH  
https://www.ptt.cc/bbs/Rockman/M.1500031661.A.9CC.html  
圖層相關


------

## 相關連結


### X2

Mega Man X2 Zero Playable  
https://www.romhacking.net/hacks/4988  
Mega Man X2 Zero Playable (Graphic and Text Fix)  
https://www.romhacking.net/hacks/5070  

### X3

Mega Man X3 Zero Project 4.1  
https://www.romhacking.net/hacks/4086


------
