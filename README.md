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

## Mod 開發版本 & BIOS 需求

Mod 開發版本為 BizHawk 2.6.1，SFC 核心是 Snes9x。  
SFC 遊戲需要 CX4 ROM，PS 遊戲需要歐美日三種語言版本 BIOS。

BizHawk 2.6.1 with Snes9x (SNES Core).  
SNES need CX4 ROM, PSX need JP/US/EN BIOS.


------

## [Bizhawk] 如何使用 Lua 檔 / How to use Lua script

以洛克人 X3 為例：
1. 「開始遊戲，進度到關卡中更佳」
   「開始遊戲，進度到關卡中更佳」
   「開始遊戲，進度到關卡中更佳」
2. 在 Bizhawk 上方的選單點擊「Tools」->「Lua Console」，就會看到 Lua 小視窗
3. 在 Lua 小視窗的選單點擊「Script」->「Open Script」
4. 選擇下載回來的 Lua 檔「slash-senpai-x3.lua」
5. ▶️ 表示成功打開，⏸️ 表示暫停

Rockman X3 (Mega Man X3) for example:
1. Make sure you are playing game
2. Open rom and play game first
3. After that, click 'Tools' -> 'Lua Console' to open Lua console
4. In Lua console, click 'Script' -> 'Open Script'
5. select 'slash-senpai-x3.lua'
6. ▶️ mean open successful，⏸️ mean pause

![Imgur](https://i.imgur.com/QMSc6ug.gif)


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

使用 SFC 改造版「Mega Man X3 - Zero Project v4.1」。

Lua 改造：
- 一直出刀
- 出刀加速
- 出刀後輩

Run in SNES ROM Hack 'Mega Man X3 - Zero Project v4.1'.

Lua Mod:
- Slash Always
- Slash Boost
- Slash Kouhai


------

## 出刀前輩 X5 / Slash Senpai X5

使用官方 PS 日版，開發中。

Run in original PSX JP version, in development.


------

## 洛克人 X2 Outrage / Rockman X2 Outrage

使用官方 SFC 日版，開發中。

設計概念來自於鴉片 (Append) 製作的「洛克人 X4 Boost」，  
以及在 Niconico 動畫上的「一部敵速型 - 洛克人 X 系列」，  
除了最基本的敵加速，還會加速載具、移動裝置等。  
來增加額外的趣味以及挑戰性。

Run in original SNES JP version, in development.

Idea for 'Rockman X4 Boost' made by Append,  
and 'Enemy in Speed Type - Mega Man X Series' in niconico,  
basically change speed of enemies, vehicles or movement platform,  
to make more fun and challenge.

------

## 出刀小子 7 / Slash Gaki 7

使用官方 SFC 日版，開發中。

Lua 改造：
- 斬擊加速
- 跳躍高度加強
- 萊西裝甲無限飛行
- 全頭目斬擊改造

Run in original SNES JP version, in development.

Lua Mod:
- Slash Boost
- High Jump
- Super Adapt infinity Fly
- Slash All Boss Mod


## 結冰小子 7 / Freeze Gaki 7

使用官方 SFC 日版，開發中。

Run in original SNES JP version, in development.


## 小子系列香草版 / Gaki Vanilla

只有攻擊加速和指定武器會有無限能源。

Just attack boost and specify weapon have infinity energy.


------

## 出刀小子 8 / Slash Gaki 8

使用官方 PS 日版，開發中。

Run in original PSX JP version, in development.


------

## 出刀蒼真 GBA / Slash Soma GBA

使用官方 GBA 日版。

Lua 改造：
- 出刀加速
- 子彈數上升
- 無限魔力

Run in original GBA JP version.

Lua Mod:
- Slash Boost
- Bullet More
- MP Infinity


------

## 超級飆速亞瑟 / Super Arthur Turbo

使用官方 SFC 日版。

Lua 改造：
- 連射解禁
- 二段跳連射解禁

也可以搭配改造版「Super Ghouls N Ghosts - Super Arthur」使用，  
內建就有連射解禁的功能。

Run in original SNES JP version.

Lua Mod:
- Turbo Fire Unlock
- Turbo Fire Unlock when Double Jump

This mod also can run in ROM Hack 'Super Ghouls N Ghosts - Super Arthur',  
that already have basic turbo fire unlock function.


------

## 戰鬥原始人 3 改造 / Slash Joe and Mac 3

使用官方 SFC 日版，開發中。

Run in original SNES JP version, in development.


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
