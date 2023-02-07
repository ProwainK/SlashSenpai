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
1. Make sure you are playing game (on stage)
2. click 'Tools' -> 'Lua Console' to open Lua console
3. In Lua console, click 'Script' -> 'Open Script'
4. select 'slash-senpai-x3.lua'
5. ▶️ mean open successful，⏸️ mean pause

![Imgur](https://i.imgur.com/QMSc6ug.gif)


------

## 如何使用 IPS 檔 / How to use IPS


### Rom Patcher JS (線上 / Online)

https://www.romhacking.net/patch/

ROM file 欄位選擇 ROM 檔，
Patch file 欄位選擇 IPS 檔，
再按下 Apply patch 按鍵改造遊戲。


### Lunar IPS (單機 / Local)

https://www.romhacking.net/utilities/240/

可以使用 IPS 檔來改造遊戲，或用來製作 IPS 檔。


------

## 出刀前輩 Slash Senpai X2

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
- [官方原版 Bug] 對練拳機使用億兆爆破機率卡死 Bug


------

## 出刀前輩 Slash Senpai X3

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

## 出刀前輩 Slash Senpai X5 Combo

使用官方 PS 日版，開發中。

Run in original PSX JP version, in development.


------

## 洛克人 Rockman X2 Outrage

使用官方 SFC 日版，開發中。

設計概念來自於鴉片 (Append) 製作的「洛克人 X4 Boost」，  
以及在 Niconico 動畫上的「一部敵速型 - 洛克人 X 系列」，  
除了最基本的敵加速，還會加速載具、移動裝置等。  
來增加額外的趣味以及挑戰性。

Run in original SNES JP version, in development.

Idea from 'Rockman X4 Boost' made by Append,  
and 'Enemy in Speed Type - Mega Man X Series' in niconico,  
basically change speed of enemies, vehicles or movement platform,  
to make more fun and challenge.


------

## 相關 Rom Hack & Mod 推薦


### 洛克人 Rockman X4 Boost

GitHub 專案頁面
https://github.com/Appendko/RockmanX4Boost

作者 Append 的 Twitch 頻道
https://www.twitch.tv/append

由 Append 所製作的 PC & PS 洛克人 X4 - 敵加速 Mod，
敵方雜魚和頭目在攻擊速度方面大幅增強，
今天的蜘蛛、沒有極限～！


### 超魔界村 Super Ghouls N Ghosts - Super Arthur

Romhacking 改造相關資訊
https://www.romhacking.net/hacks/2893/

作者 Lufia 的相關資訊
https://www.romhacking.net/community/4012/

由 Lufia 所製作的 SFC 超魔界村 - 亞瑟強化版 Rom Hack，
除了主角亞瑟的武器連射解禁之餘，
另外還有受傷時盔甲降階、LR 切換武器等機體強化功能。


------
