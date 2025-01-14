--[[------------------------------------------
---- For Support - discord.gg/threeamigos ----
--]]------------------------------------------

config = {
    debug = false, -- enable or disable debug prints to your client console. Also enables the ability to use commands to get drawable types & textures.

    defaultEmote = "wt2", -- default emote that plays if you dont have the clothing option (Use wt3 or wt4 if using RPEmotes)

    chestAnim = { -- Chest Animation
        enable = true, -- enable the chest radio animation
        drawable = 9, -- the drawable (clothing type) for the chest radio animation
        male = {1, 2, 3}, -- the clothing variations for the chest radio animation for male
        female = {1, 2, 3}, -- the clothing variations for the chest radio animation for female,
        maleTexture = {1, 2, 3}, -- the texture id's of the drawable for male clothing. 
        femaleTexture = {1, 2, 3}, -- the texture id's of the drawable for female clothing.
        emote = "radiochest" -- Emote to play
    },

    shoulderAnim = { -- Shoulder Animation
        enable = true, -- enable the shoulder radio animation
        drawable = 9, -- the drawable (clothing type) for the shoulder radio animation
        male = {4, 5, 6}, -- the clothing variations for the shoulder radio animation for male
        female = {4, 5, 6}, -- the clothing variations for the shoulder radio animation for female
        maleTexture = {1, 2, 3}, -- the texture id's of the drawable for male clothing. 
        femaleTexture = {1, 2, 3}, -- the texture id's of the drawable for female clothing.
        emote = "radio", -- emote to play
        emoteAiming = "radio2" -- Emote to play when aiming
    },

    earpieceAnim = { -- Ear Piece Animation
        enable = true, -- enable the ear piece radio animation
        drawable = 9, -- the drawable (clothing type) for the ear piece
        male = {7, 8, 9}, -- the clothing variations for the ear piece for male
        female = {7, 8, 9}, -- the clothing variations for the ear piece for female
        maleTexture = {1, 2, 3}, -- the texture id's of the drawable for male clothing. 
        femaleTexture = {1, 2, 3}, -- the texture id's of the drawable for female clothing.
        emote = "earpiece" -- Emote to play
    },

    blacklistedPeds = { -- blacklist peds from using the anims - list of peds: https://forge.plebmasters.de/peds
        "a_c_seagull",
        "a_c_shepard",
        "a_c_hen",
        "a_c_poodle",
        "a_c_tigershark",
        "a_c_retriever",
        "a_c_chimp",
        "a_c_rat",
        "a_c_rotweiler",
        "a_c_deer",
        "a_c_rhesus",
        "a_c_chickenhawk",
        "a_c_rabbit_01",
        "a_c_mtlion",
        "a_c_humpbank",
        "a_c_pig",
        "a_c_westy",
        "a_c_dolphin",
        "a_c_pigeon",
        "a_c_pug",
        "a_c_crow",
        "a_c_stingray",
        "a_c_killerwhale",
        "a_c_sharkhammer",
        "a_c_fish",
        "a_c_cat_01",
        "a_c_chop_01",
        "a_c_cow",
        "a_c_chop",
        "a_c_husky",
        "a_c_coyote",
        "a_c_boar",
        "a_c_cormorant",
        "a_c_deer_02",
        "a_c_chimp_02",
        "a_c_mtlion_02",
        "a_c_boar_02",
        "a_c_rabbit_02",
        "a_c_panther",
        "a_c_coyote_02",
        "a_c_pug_02"
    },

    blacklistedClasses = { -- vehicle classes to blacklist
        8,
        13,
        15,
        16
    }
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
