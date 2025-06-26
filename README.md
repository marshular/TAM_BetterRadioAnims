# Better Radio Anims by Three Amigos Modding

![tam_changelog](https://raw.githubusercontent.com/ThreeAmigosModding/ThreeAmigosModding/main/img/Product_Cover_BRA.png)

[Support Discord](https://discord.gg/threeamigos)

[Tebex](https://threeamigos.shop)

Improved radio animations w/ support for multiple animation menus.

## Features

- Support for any ped model
- Clothing support
- Support for multiple animations
- Keybind and Event support
- Ped and Vehicle Class blacklist support

## Supports

- [scully_emotemenu](https://github.com/Scullyy/scully_emotemenu)
- [rpemotes-reborn](https://github.com/alberttheprince/rpemotes-reborn)
- [Sonoran Radio](https://sonoranradio.com/)

## Installation / Prerequisites 

- Remove any resource that already has emotes/anims built-in (i.e. rp-radio)

- Ensure you have either [scully_emotemenu](https://github.com/Scullyy/scully_emotemenu) or [rpemotes-reborn](https://github.com/alberttheprince/rpemotes-reborn) installed, and is started **BEFORE** `TAM_BetterRadioAnims`

1. Download the release of [ox_lib](https://github.com/CommunityOx/ox_lib/releases/), and add it to your ``server.cfg`` **BEFORE** `TAM_BetterRadioAnims`

2. Add ``setr voice_enableRadioAnim 0`` to your ``server.cfg``

3. Add ``ensure TAM_BetterRadioAnims`` to your ``server.cfg``

4. Download [animations](https://www.gta5-mods.com/misc/leo-custom-anim) and add to any stream folder

### If using scully_emotemenu:

- **Add to** ``scully_emotemenu/shared/data/emotes/general_emotes.lua``:
```lua
    {
        Label = 'Radio 2',
        Command = 'radio2',
        Animation = 'radio_chatter',
        Dictionary = 'random@arrests',
        Options = {
            Flags = {
                Loop = true,
                Move = true,
            },
        },
    },
    {
        Label = 'Radio Chest',
        Command = 'radiochest',
        Animation = 'chest_mic',
        Dictionary = 'anim@cop_mic_pose_002',
        Options = {
            Flags = {
                Loop = true,
                Move = true,
            },
        },
    },
    {
        Label = 'Earpiece',
        Command = 'earpiece',
        Animation = 'cellphone_call_listen_base',
        Dictionary = 'cellphone@',
        Options = {
            Flags = {
                Loop = true,
                Move = true,
            },
        },
    },
```

### If using rpemotes-reborn:

- Change `config.animations["default"]` to `wt3` or `wt4`

- **Add to** ``rpemotes/client/AnimationListCustom.lua`` -> ``CustomDP.Emotes = {}``:
```lua
    ["radio2"] = {
        "random@arrests",
        "radio_chatter",
        "Radio 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["radiochest"] = {
        "anim@cop_mic_pose_002",
        "chest_mic",
        "Radio Chest",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["earpiece"] = {
        "cellphone@",
        "cellphone_call_listen_base",
        "Earpiece",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
```

# Credits

[Marshular](https://github.com/marshular) - Original creator, gave [explicit permission](https://i.imgur.com/uKDUEd1.png) to release under Three Amigos Modding