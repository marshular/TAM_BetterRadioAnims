--[[------------------------------------------
---- For Support - discord.gg/threeamigos ----
--]]------------------------------------------

local config = {}

config.debug = false

config.useEvent = true -- whether or not to tie into the PMA voice event handler.

config.useKeybind = false -- whether or not to enable/disable the use of keybinds instead of the PMA voice event handler

config.keybindKey = "LMENU" -- key to set for keyboard keybind. See https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/

config.controllerKey = "R1_INDEX" -- Button to set for controller keybind. Set to nil to disable. See https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/pad_digitalbutton/

config.animations = {
    default = "wt2",
    shoulder = "radio",
    shoulder_aiming = "radio2", -- the animation is used for when the player is aiming (if you have any other aiming animations you want to add put the name of your animation and add _aiming to the end of it)
    chest = "radiochest",
    earpiece = "earpiece"
}

--[[
    List of drawable variations, though we recommend to keep them on either accessory, undershirt or torso.
    0: Face 
    1: Mask 
    2: Hair 
    3: Torso 
    4: Leg 
    5: Parachute / bag 
    6: Shoes 
    7: Accessory 
    8: Undershirt 
    9: Kevlar 
    10: Badge 
    11: Torso 2
]]

config.clothing = {
    [`mp_m_freemode_01`] = {
        [9] = { -- drawable
            [20] = { -- component
                [0] = "shoulder", -- texture/variation & animation
                [1] = "chest",
                [2] = "earpiece"
            }
        },
    },
    [`mp_f_freemode_01`] = {
        [9] = { -- drawable
            [20] = { -- component
                [0] = "shoulder", -- texture/variation & animation
                [1] = "chest",
                [2] = "earpiece"
            }
        },
    }
}

--[[
    List of prop variations
    0: Hats 
    1: Glasses 
    2: Ears 
    6: Watches 
    7: Braclets 
]]

config.props = {
    [`mp_m_freemode_01`] = {
        [2] = { -- drawable
            [0] = { -- component
                [0] = "earpiece", -- texture/variation & animation
            }
        },
    },
    [`mp_f_freemode_01`] = {
        [2] = { -- drawable
            [0] = { -- component
                [0] = "earpiece", -- texture/variation & animation
            }
        },
    }
}

config.blacklistedPeds = { -- blacklist peds from using the anims - list of peds: https://forge.plebmasters.de/peds
    `a_c_seagull`,
    `a_c_shepard`,
    `a_c_hen`,
    `a_c_poodle`,
    `a_c_tigershark`,
    `a_c_retriever`,
    `a_c_chimp`,
    `a_c_rat`,
    `a_c_rotweiler`,
    `a_c_deer`,
    `a_c_rhesus`,
    `a_c_chickenhawk`,
    `a_c_rabbit_01`,
    `a_c_mtlion`,
    `a_c_humpbank`,
    `a_c_pig`,
    `a_c_westy`,
    `a_c_dolphin`,
    `a_c_pigeon`,
    `a_c_pug`,
    `a_c_crow`,
    `a_c_stingray`,
    `a_c_killerwhale`,
    `a_c_sharkhammer`,
    `a_c_fish`,
    `a_c_cat_01`,
    `a_c_chop_01`,
    `a_c_cow`,
    `a_c_chop`,
    `a_c_husky`,
    `a_c_coyote`,
    `a_c_boar`,
    `a_c_cormorant`,
    `a_c_deer_02`,
    `a_c_chimp_02`,
    `a_c_mtlion_02`,
    `a_c_boar_02`,
    `a_c_rabbit_02`,
    `a_c_panther`,
    `a_c_coyote_02`,
    `a_c_pug_02`
}

config.blacklistedClasses = { -- vehicle classes to blacklist
    8,
    13,
    15,
    16
}

return config