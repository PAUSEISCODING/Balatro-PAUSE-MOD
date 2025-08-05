# Pause's Pack

This is a first attempt at a mudpack. I've never used LUA. This currently has 1 joker in it. soon to have 3 but they seem to cause crashes at the moment.



----------------------------------------------------------------------------------------------------------------------------



CRASH LOG:



Oops! The game crashed:

\[SMODS \_ "src/loader.lua"]:563: \[SMODS EXAMPLEJOKER "main.lua"]:219: cannot use '...' outside a vararg function near '...'



Additional Context:

Balatro Version: 1.0.1o-FULL

Modded Version: 1.0.0~BETA-0711a-STEAMODDED

LÖVE Version: 11.5.0

Lovely Version: 0.8.0

Platform: Windows

Steamodded Mods:

&nbsp;   1: PAUSES PACK by PAUSE \[ID: MYJOKERS]

&nbsp;   2: DebugPlus by WilsontheWolf \[ID: DebugPlus, Version: 1.4.2, Uses Lovely]

Lovely Mods:



Stack Traceback

===============

(3) global C function 'assert'

(4) Lua local 'func' at Steamodded file 'src/loader.lua:563' 

(5) Lua field 'with\_compat' at Steamodded file 'src/compat\_0\_9\_8.lua:522' 

Local variables:

&nbsp;func = Lua function '?' (defined at line 561 of chunk \[SMODS \_ "src/loader.lua"])

&nbsp;localization\_ref = table: 0x12b49090  {descriptions:table: 0x12b490f0, tutorial\_parsed:table: 0x12bbf558, quips\_parsed:table: 0x12bdb7b0, misc:table: 0x12ba8200}

&nbsp;captured\_loc = table: 0x12bfb708  {}

(6) Lua global 'loadMods' at Steamodded file 'src/loader.lua:561' 

Local variables:

&nbsp;modsDirectory = string: "C:\\\\Users\\\\User1\\\\AppData\\\\Roaming\\\\Balatro\\\\Mods"

&nbsp;header\_components = table: 0x127782c0  {version:table: 0x127a2c90, id:table: 0x128b1880, conflicts:table: 0x127a2b80, outdated:table: 0x127a2d10, prefix:table: 0x127a2c30, dump\_loc:table: 0x127a2db0 (more...)}

&nbsp;json\_spec = table: 0x127a2e48  {version:table: 0x127bb3b0, id:table: 0x127a2e70, main\_file:table: 0x127bb590, \_\_:table: 0x127bb650, badge\_colour:table: 0x127bb250, badge\_text\_colour:table: 0x127bb2d0 (more...)}

&nbsp;used\_prefixes = table: 0x127bb750  {xmpl:EXAMPLEJOKER}

&nbsp;lovely\_directories = table: 0x127bb778  {1:C:\\Users\\User1\\AppData\\Roaming\\Balatro\\Mods/DebugPlus/}

&nbsp;processDirectory = Lua function '?' (defined at line 185 of chunk \[SMODS \_ "src/loader.lua"])

&nbsp;keyset = table: 0x12f659f8  {1:0}

&nbsp;check\_dependencies = Lua function '?' (defined at line 419 of chunk \[SMODS \_ "src/loader.lua"])

&nbsp;(for generator) = C function: builtin#6

&nbsp;(for state) = table: 0x12f659f8  {1:0}

&nbsp;(for control) = number: 1

&nbsp;\_ = number: 1

&nbsp;priority = number: 0

&nbsp;(for generator) = C function: builtin#6

&nbsp;(for state) = table: 0x127f5e60  {1:table: 0x128757e0, 2:table: 0x129729e0, 3:table: 0x12e5a3b0}

&nbsp;(for control) = number: 2

&nbsp;\_ = number: 2

&nbsp;mod = table: 0x129729e0  {version:0.0.0, id:EXAMPLEJOKER, main\_file:main.lua, can\_load:true, badge\_colour:table: 0x12985a48, badge\_text\_colour:table: 0x12985870, priority:0 (more...)}

(7) Lua global 'initSteamodded' at Steamodded file 'src/loader.lua:654' 

(8) Lua method 'start\_up' at file 'game.lua:211'

Local variables:

&nbsp;self = table: 0x125e8470  {SPEEDFACTOR:1, F\_GUIDE:false, keybind\_mapping:table: 0x1260b458, F\_CRASH\_REPORTS:false, P\_CARDS:table: 0x12b6e6c8, shared\_undiscovered\_joker:table: 0x12537fc8 (more...)}

&nbsp;settings = string: "return {\[\\"version\\"]=\\"1.0.1o-FULL\\",\[\\"paused\\"]=false,\[\\"QUEUED\_CHANGE\\"]={},\[\\"COMP\\"]={\[\\"prev\_name\\"]=\\"\\",\[\\"name\\"]=\\"\\",\[\\"score\\"]=9578928995717.2,},\[\\"colourblind\_option\\"]=false,\[\\"play\_button\_pos\\"]=2,\[\\"CUSTOM\_DECK\\"]={\[\\"Collabs\\"]={\[\\"Spades\\"]=\\"collab\_AC\\",\[\\"Hearts\\"]=\\"collab\_AU\\",\[\\"Diamonds\\"]=\\"collab\_R\\",\[\\"Clubs\\"]=\\"collab\_VS\\",},},\[\\"colour\_palettes\\"]={\[\\"Spades\\"]=\\"lc\\",\[\\"Hearts\\"]=\\"lc\\",\[\\"Diamonds\\"]=\\"lc\\",\[\\"Clubs\\"]=\\"lc\\",},\[\\"crashreports\\"]=false,\[\\"tutorial\_progress\\"]={\[\\"hold\_parts\\"]={},\[\\"section\\"]=\\"big\_blind\\",\[\\"completed\_parts\\"]={\[\\"first\_hand\_3\\"]=true,\[\\"small\_blind\\"]=true,\[\\"big\_blind\\"]=true,\[\\"first\_hand\_4\\"]=true,\[\\"shop\_1\\"]=true,\[\\"first\_hand\_section\\"]=true,\[\\"first\_hand\_2\\"]=true,\[\\"first\_hand\\"]=true,},},\[\\"language\\"]=\\"en-us\\",\[\\"profile\\"]=1,\[\\"WINDOW\\"]={\[\\"vsync\\"]=1,\[\\"display\_names\\"]={\[2]=\\"2\\",\[1]=\\"1\\",},\[\\"screenmode\\"]=\\"Borderless\\",\[\\"DISPLAYS\\"]={\[1]={\[\\"screen\_resolutions\\"]={\[\\"strings\\"]={\[1]=\\"1600 X 900\\",},\[\\"values\\"]={\[1]={\[\\"w\\"]=1600,\[\\"h\\"]=900,},},},\[\\"screen\_res\\"]={\[\\"w\\"]=1600,\[\\"h\\"]=900,},\[\\"DPI\_scale\\"]=1,\[\\"MONITOR\_DIMS\\"]={\[\\"height\\"]=900,\[\\"width\\"]=1600,},},\[2]={\[\\"screen\_resolutions\\"]={\[\\"strings\\"]={\[1]=\\"1920 X 1080\\",},\[\\"values\\"]={\[1]={\[\\"w\\"]=1600,\[\\"h\\"]=900,},},},\[\\"DPI\_scale\\"]=1,\[\\"MONITOR\_DIMS\\"]={\[\\"height\\"]=1080,\[\\"width\\"]=1920,},},},\[\\"selected\_display\\"]=1,},\[\\"run\_stake\_stickers\\"]=false,\[\\"GAMESPEED\\"]=4,\[\\"SOUND\\"]={\[\\"volume\\"]=50,\[\\"music\_volume\\"]=100,\[\\"game\_sounds\_volume\\"]=100,},\[\\"music\_control\\"]={\[\\"current\_track\\"]=\\"\\",\[\\"desired\_track\\"]=\\"\\",\[\\"lerp\\"]=1,},\[\\"ACHIEVEMENTS\_EARNED\\"]={\[\\"speedrunner\\"]=true,\[\\"big\_hands\\"]=true,\[\\"retrograde\\"]=true,\[\\"ach\_yahimod\_ach\_wood\\"]=true,\[\\"ach\_yahimod\_ach\_buckets\\"]=true,\[\\"ach\_yahimod\_ach\_fellforit\\"]=true,\[\\"tiny\_hands\\"]=true,\[\\"ach\_yahimod\_ach\_jovial\\"]=true,\[\\"cartomancy\\"]=true,\[\\"ach\_yahimod\_ach\_schmeebchairgone\\"]=true,\[\\"ach\_yahimod\_ach\_isthat\\"]=true,\[\\"ach\_yahimod\_ach\_why\\"]=true,\[\\"completionist\\"]=true,\[\\"nest\_egg\\"]=true,\[\\"ach\_yahimod\_ach\_groupchat\\"]=true,\[\\"ante\_upper\\"]=true,\[\\"astronomy\\"]=true,\[\\"heads\_up\\"]=true,\[\\"\_100000k\\"]=true,\[\\"\_10k\\"]=true,\[\\"legendary\\"]=true,\[\\"extreme\_couponer\\"]=true,\[\\"ach\_yahimod\_ach\_parkourpro\\"]=true,\[\\"\_1000k\\"]=true,\[\\"clairvoyance\\"]=true,\[\\"ante\_up\\"]=true,\[\\"you\_get\_what\_you\_get\\"]=true,},\[\\"screenshake\\"]=50,\[\\"current\_setup\\"]=\\"New Run\\",\[\\"ambient\_control\\"]={\[\\"ambientFire1\\"]={\[\\"per\\"]=1.1,\[\\"vol\\"]=1.6398169525851e-13,},\[\\"ambientOrgan1\\"]={\[\\"per\\"]=0.7,\[\\"vol\\"]=3.3680628101402e-13,},\[\\"ambientFire2\\"]={\[\\"per\\"]=1.05,\[\\"vol\\"]=1.9654144546502e-10,},\[\\"ambientFire3\\"]={\[\\"per\\"]=1,\[\\"vol\\"]=1.8341857919449e-11,},},\[\\"tutorial\_complete\\"]=true,\[\\"DEMO\\"]={\[\\"win\_CTA\_shown\\"]=true,\[\\"quit\_CTA\_shown\\"]=true,\[\\"timed\_CTA\_shown\\"]=true,\[\\"total\_uptime\\"]=2335.4319238253,},\[\\"GRAPHICS\\"]={\[\\"texture\_scaling\\"]=2,\[\\"crt\\"]=0,\[\\"shadows\\"]=\\"On\\",\[\\"bloom\\"]=1,},}"

&nbsp;settings\_ver = nil

&nbsp;new\_colour\_proto = table: 0x125ed5b0  {Spades:table: 0x125ed838, Hearts:table: 0x125ed6a8, Diamonds:table: 0x125ed760, Clubs:table: 0x125ed8d0}

&nbsp;sound\_files = table: 0x12986ad8  {1:ambientFire1.ogg, 2:ambientFire2.ogg, 3:ambientFire3.ogg, 4:ambientOrgan1.ogg, 5:button.ogg, 6:cancel.ogg, 7:card1.ogg, 8:card3.ogg, 9:cardFan2.ogg (more...)}

&nbsp;shader\_files = table: 0x1298a9c0  {1:CRT.fs, 2:background.fs, 3:booster.fs, 4:debuff.fs, 5:dissolve.fs, 6:flame.fs, 7:flash.fs, 8:foil.fs, 9:gold\_seal.fs, 10:holo.fs, 11:hologram.fs (more...)}

(9) Lua field 'load' at file 'main.lua:952'

(10) Lua function '?' at file 'main.lua:899' (best guess)

(11) global C function 'xpcall'

(12) LÖVE function at file 'boot.lua:368' (best guess)

Local variables:

&nbsp;result = boolean: true

&nbsp;main = nil

(13) global C function 'xpcall'

(14) LÖVE function at file 'boot.lua:377' (best guess)

Local variables:

&nbsp;func = Lua function '(LÖVE Function)' (defined at line 355 of chunk \[love "boot.lua"])

&nbsp;inerror = boolean: true

&nbsp;deferErrhand = Lua function '(LÖVE Function)' (defined at line 348 of chunk \[love "boot.lua"])

&nbsp;earlyinit = Lua function '(LÖVE Function)' (defined at line 355 of chunk \[love "boot.lua"])



