# This file is a part of JetBot.jl, licensed under the MIT License (MIT).


module JetBotHID


struct RawLinuxHIDEvent
    tv_sec::Clong
    tv_usec::Clong
    type::Cushort
    code::Cushort
    value::Cint
end
   

@enum HIDEvtType::Cushort begin
    EV_SYN = 0x00
    EV_KEY = 0x01
    EV_REL = 0x02
    EV_ABS = 0x03
    EV_MSC = 0x04
    EV_SW = 0x05
    EV_LED = 0x11
    EV_SND = 0x12
    EV_REP = 0x14
    EV_FF = 0x15
    EV_PWR = 0x16
    EV_FF_STATUS = 0x17
    # EV_MAX = 0x1f
    # EV_CNT = (EV_MAX+1)
end


@enum HIDSyn::Cushort begin
    SYN_REPORT = 0
    SYN_CONFIG = 1
    SYN_MT_REPORT = 2
end


@enum HIDKey::Cushort begin
    # BTN_MISC = 0x100
    BTN_0 = 0x100
    BTN_1 = 0x101
    BTN_2 = 0x102
    BTN_3 = 0x103
    BTN_4 = 0x104
    BTN_5 = 0x105
    BTN_6 = 0x106
    BTN_7 = 0x107
    BTN_8 = 0x108
    BTN_9 = 0x109

    # BTN_MOUSE = 0x110
    BTN_LEFT = 0x110
    BTN_RIGHT = 0x111
    BTN_MIDDLE = 0x112
    BTN_SIDE = 0x113
    BTN_EXTRA = 0x114
    BTN_FORWARD = 0x115
    BTN_BACK = 0x116
    BTN_TASK = 0x117

    # BTN_JOYSTICK = 0x120
    BTN_TRIGGER = 0x120
    BTN_THUMB = 0x121
    BTN_THUMB2 = 0x122
    BTN_TOP = 0x123
    BTN_TOP2 = 0x124
    BTN_PINKIE = 0x125
    BTN_BASE = 0x126
    BTN_BASE2 = 0x127
    BTN_BASE3 = 0x128
    BTN_BASE4 = 0x129
    BTN_BASE5 = 0x12a
    BTN_BASE6 = 0x12b
    BTN_DEAD = 0x12f

    # BTN_GAMEPAD = 0x130
    BTN_A = 0x130
    BTN_B = 0x131
    BTN_C = 0x132
    BTN_X = 0x133
    BTN_Y = 0x134
    BTN_Z = 0x135
    BTN_TL = 0x136
    BTN_TR = 0x137
    BTN_TL2 = 0x138
    BTN_TR2 = 0x139
    BTN_SELECT = 0x13a
    BTN_START = 0x13b
    BTN_MODE = 0x13c
    BTN_THUMBL = 0x13d
    BTN_THUMBR = 0x13e

    # BTN_DIGI = 0x140
    BTN_TOOL_PEN = 0x140
    BTN_TOOL_RUBBER = 0x141
    BTN_TOOL_BRUSH = 0x142
    BTN_TOOL_PENCIL = 0x143
    BTN_TOOL_AIRBRUSH = 0x144
    BTN_TOOL_FINGER = 0x145
    BTN_TOOL_MOUSE = 0x146
    BTN_TOOL_LENS = 0x147
    BTN_TOUCH = 0x14a
    BTN_STYLUS = 0x14b
    BTN_STYLUS2 = 0x14c
    BTN_TOOL_DOUBLETAP = 0x14d
    BTN_TOOL_TRIPLETAP = 0x14e
    BTN_TOOL_QUADTAP = 0x14f

    BTN_WHEEL = 0x150
    # BTN_GEAR_DOWN = 0x150
    BTN_GEAR_UP = 0x151

    KEY_OK = 0x160
    KEY_SELECT = 0x161
    KEY_GOTO = 0x162
    KEY_CLEAR = 0x163
    KEY_POWER2 = 0x164
    KEY_OPTION = 0x165
    KEY_INFO = 0x166
    KEY_TIME = 0x167
    KEY_VENDOR = 0x168
    KEY_ARCHIVE = 0x169
    KEY_PROGRAM = 0x16a
    KEY_CHANNEL = 0x16b
    KEY_FAVORITES = 0x16c
    KEY_EPG = 0x16d
    KEY_PVR = 0x16e
    KEY_MHP = 0x16f
    KEY_LANGUAGE = 0x170
    KEY_TITLE = 0x171
    KEY_SUBTITLE = 0x172
    KEY_ANGLE = 0x173
    KEY_ZOOM = 0x174
    KEY_MODE = 0x175
    KEY_KEYBOARD = 0x176
    KEY_SCREEN = 0x177
    KEY_PC = 0x178
    KEY_TV = 0x179
    KEY_TV2 = 0x17a
    KEY_VCR = 0x17b
    KEY_VCR2 = 0x17c
    KEY_SAT = 0x17d
    KEY_SAT2 = 0x17e
    KEY_CD = 0x17f
    KEY_TAPE = 0x180
    KEY_RADIO = 0x181
    KEY_TUNER = 0x182
    KEY_PLAYER = 0x183
    KEY_TEXT = 0x184
    KEY_DVD = 0x185
    KEY_AUX = 0x186
    KEY_MP3 = 0x187
    KEY_AUDIO = 0x188
    KEY_VIDEO = 0x189
    KEY_DIRECTORY = 0x18a
    KEY_LIST = 0x18b
    KEY_MEMO = 0x18c
    KEY_CALENDAR = 0x18d
    KEY_RED = 0x18e
    KEY_GREEN = 0x18f
    KEY_YELLOW = 0x190
    KEY_BLUE = 0x191
    KEY_CHANNELUP = 0x192
    KEY_CHANNELDOWN = 0x193
    KEY_FIRST = 0x194
    KEY_LAST = 0x195
    KEY_AB = 0x196
    KEY_NEXT = 0x197
    KEY_RESTART = 0x198
    KEY_SLOW = 0x199
    KEY_SHUFFLE = 0x19a
    KEY_BREAK = 0x19b
    KEY_PREVIOUS = 0x19c
    KEY_DIGITS = 0x19d
    KEY_TEEN = 0x19e
    KEY_TWEN = 0x19f
    KEY_VIDEOPHONE = 0x1a0
    KEY_GAMES = 0x1a1
    KEY_ZOOMIN = 0x1a2
    KEY_ZOOMOUT = 0x1a3
    KEY_ZOOMRESET = 0x1a4
    KEY_WORDPROCESSOR = 0x1a5
    KEY_EDITOR = 0x1a6
    KEY_SPREADSHEET = 0x1a7
    KEY_GRAPHICSEDITOR = 0x1a8
    KEY_PRESENTATION = 0x1a9
    KEY_DATABASE = 0x1aa
    KEY_NEWS = 0x1ab
    KEY_VOICEMAIL = 0x1ac
    KEY_ADDRESSBOOK = 0x1ad
    KEY_MESSENGER = 0x1ae
    KEY_DISPLAYTOGGLE = 0x1af
    KEY_SPELLCHECK = 0x1b0
    KEY_LOGOFF = 0x1b1

    KEY_DOLLAR = 0x1b2
    KEY_EURO = 0x1b3

    KEY_FRAMEBACK = 0x1b4
    KEY_FRAMEFORWARD = 0x1b5
    KEY_CONTEXT_MENU = 0x1b6
    KEY_MEDIA_REPEAT = 0x1b7

    KEY_DEL_EOL = 0x1c0
    KEY_DEL_EOS = 0x1c1
    KEY_INS_LINE = 0x1c2
    KEY_DEL_LINE = 0x1c3

    KEY_FN = 0x1d0
    KEY_FN_ESC = 0x1d1
    KEY_FN_F1 = 0x1d2
    KEY_FN_F2 = 0x1d3
    KEY_FN_F3 = 0x1d4
    KEY_FN_F4 = 0x1d5
    KEY_FN_F5 = 0x1d6
    KEY_FN_F6 = 0x1d7
    KEY_FN_F7 = 0x1d8
    KEY_FN_F8 = 0x1d9
    KEY_FN_F9 = 0x1da
    KEY_FN_F10 = 0x1db
    KEY_FN_F11 = 0x1dc
    KEY_FN_F12 = 0x1dd
    KEY_FN_1 = 0x1de
    KEY_FN_2 = 0x1df
    KEY_FN_D = 0x1e0
    KEY_FN_E = 0x1e1
    KEY_FN_F = 0x1e2
    KEY_FN_S = 0x1e3
    KEY_FN_B = 0x1e4

    KEY_BRL_DOT1 = 0x1f1
    KEY_BRL_DOT2 = 0x1f2
    KEY_BRL_DOT3 = 0x1f3
    KEY_BRL_DOT4 = 0x1f4
    KEY_BRL_DOT5 = 0x1f5
    KEY_BRL_DOT6 = 0x1f6
    KEY_BRL_DOT7 = 0x1f7
    KEY_BRL_DOT8 = 0x1f8
    KEY_BRL_DOT9 = 0x1f9
    KEY_BRL_DOT10 = 0x1fa

    KEY_NUMERIC_0 = 0x200
    KEY_NUMERIC_1 = 0x201
    KEY_NUMERIC_2 = 0x202
    KEY_NUMERIC_3 = 0x203
    KEY_NUMERIC_4 = 0x204
    KEY_NUMERIC_5 = 0x205
    KEY_NUMERIC_6 = 0x206
    KEY_NUMERIC_7 = 0x207
    KEY_NUMERIC_8 = 0x208
    KEY_NUMERIC_9 = 0x209
    KEY_NUMERIC_STAR = 0x20a
    KEY_NUMERIC_POUND = 0x20b

    # KEY_MIN_INTERESTING = KEY_MUTE
    # KEY_MAX = 0x2ff
    # KEY_CNT = (KEY_MAX+1)
end


@enum HIDRelAxis::Cushort begin
    REL_X = 0x00
    REL_Y = 0x01
    REL_Z = 0x02
    REL_RX = 0x03
    REL_RY = 0x04
    REL_RZ = 0x05
    REL_HWHEEL = 0x06
    REL_DIAL = 0x07
    REL_WHEEL = 0x08
    REL_MISC = 0x09
    # REL_MAX = 0x0f
    # REL_CNT = (REL_MAX+1)
end


@enum HIDAbsAxis::Cushort begin
    ABS_X = 0x00
    ABS_Y = 0x01
    ABS_Z = 0x02
    ABS_RX = 0x03
    ABS_RY = 0x04
    ABS_RZ = 0x05
    ABS_THROTTLE = 0x06
    ABS_RUDDER = 0x07
    ABS_WHEEL = 0x08
    ABS_GAS = 0x09
    ABS_BRAKE = 0x0a
    ABS_HAT0X = 0x10
    ABS_HAT0Y = 0x11
    ABS_HAT1X = 0x12
    ABS_HAT1Y = 0x13
    ABS_HAT2X = 0x14
    ABS_HAT2Y = 0x15
    ABS_HAT3X = 0x16
    ABS_HAT3Y = 0x17
    ABS_PRESSURE = 0x18
    ABS_DISTANCE = 0x19
    ABS_TILT_X = 0x1a
    ABS_TILT_Y = 0x1b
    ABS_TOOL_WIDTH = 0x1c
    ABS_VOLUME = 0x20
    ABS_MISC = 0x28

    ABS_MT_TOUCH_MAJOR  = 0x30  
    ABS_MT_TOUCH_MINOR  = 0x31  
    ABS_MT_WIDTH_MAJOR  = 0x32  
    ABS_MT_WIDTH_MINOR  = 0x33  
    ABS_MT_ORIENTATION  = 0x34  
    ABS_MT_POSITION_X   = 0x35  
    ABS_MT_POSITION_Y   = 0x36  
    ABS_MT_TOOL_TYPE    = 0x37  
    ABS_MT_BLOB_ID      = 0x38  
    ABS_MT_TRACKING_ID  = 0x39  

    # ABS_MAX = 0x3f
    # ABS_CNT = (ABS_MAX+1)
end


@enum HIDSwitch::Cushort begin
    SW_LID = 0x00  
    SW_TABLET_MODE = 0x01  
    SW_HEADPHONE_INSERT = 0x02  
    SW_RFKILL_ALL = 0x03  
                         
    # SW_RADIO = SW_RFKILL_ALL    
    SW_MICROPHONE_INSERT = 0x04  
    SW_DOCK = 0x05  
    SW_LINEOUT_INSERT = 0x06  
    SW_JACK_PHYSICAL_INSERT = 0x07  
    SW_VIDEOOUT_INSERT = 0x08  

    # SW_MAX = 0x0f
    # SW_CNT = (SW_MAX+1)
end


@enum HIDMisc::Cushort begin
    MSC_SERIAL = 0x00
    MSC_PULSELED = 0x01
    MSC_GESTURE = 0x02
    MSC_RAW = 0x03
    MSC_SCAN = 0x04

    # MSC_MAX = 0x07
    # MSC_CNT = (MSC_MAX+1)
end



function Base.read(input::IO, ::Type{RawLinuxHIDEvent})
    first(reinterpret(RawLinuxHIDEvent, read(input, sizeof(RawLinuxHIDEvent))))
end


function raw_hid_conv(rawevt::RawLinuxHIDEvent)
    time = Float64(rawevt.tv_sec + rawevt.tv_usec * 10^-6)
    evttype = HIDEvtType(rawevt.type)

    control::Union{HIDSyn,HIDKey,HIDRelAxis,HIDAbsAxis,HIDSwitch,HIDMisc,Cushort} = let
        if evttype == EV_SYN
            HIDSyn(rawevt.code)
        elseif evttype == EV_KEY
            HIDKey(rawevt.code)
        elseif evttype == EV_REL
            HIDRelAxis(rawevt.code)
        elseif evttype == EV_ABS
            HIDAbsAxis(rawevt.code)
        elseif evttype == EV_SW
            HIDSwitch(rawevt.code)
        elseif evttype == EV_MSC
            HIDMisc(rawevt.code)
        else
            rawevt.code
        end
    end

    value = Int32(rawevt.value)

    (time = time, control = control, value = value)
end


end # module
