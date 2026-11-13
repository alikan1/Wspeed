-- // INITIALIZE SANITY.HIT WINDOW
local Window = Library:CreateWindow({
    Title = 'sleepy.gg 🎃 | quality at its finest',
    Center = true,
    AutoShow = true,
})

local Tabs = {
    Main = Window:AddTab('Main'),
    Visuals = Window:AddTab('Visuals'),
    ESP = Window:AddTab('ESP'),
    Misc = Window:AddTab('Misc'),
    Character = Window:AddTab('Character'),
    Settings = Window:AddTab('UI Settings'),
}

-- ==========================================
-- 1. MAIN TAB
-- ==========================================
do
    -- RAGE / SILENT AIM
    local SilentGroup = Tabs.Main:AddLeftGroupbox('Silent Aim Suite')
    SilentGroup:AddToggle('silent_aim_enabled', {
        Text = 'Enable Silent Aim',
        Default = false,
        Callback = function(v) flags.silent_aim_enabled = v end
    })
    SilentGroup:AddSlider('fov_radius_smoothed', {
        Text = 'FOV Radius',
        Default = 120,
        Min = 10,
        Max = 800,
        Rounding = 0,
        Suffix = ' px',
        Callback = function(v) flags.fov_radius_smoothed = v end
    })
    SilentGroup:AddToggle('silent_aim_visualise_range', {
        Text = 'Visualise FOV',
        Default = false,
        Callback = function(v) flags.silent_aim_visualise_range = v end
    }):AddColorPicker('fov_color', {
        Default = Color3.fromRGB(0, 162, 255),
        Title = 'FOV Color',
        Callback = function(c) flags.fov_color = c end
    })
    SilentGroup:AddToggle('fov_spin_value', {
        Text = 'Spin FOV (Rainbow)',
        Default = false,
        Callback = function(v) flags.fov_spin_value = v end
    })
    SilentGroup:AddSlider('fov_rotation_speed', {
        Text = 'Spin Speed',
        Default = 10,
        Min = 1,
        Max = 30,
        Rounding = 0,
        Callback = function(v) flags.fov_rotation_speed = v end
    })
    SilentGroup:AddToggle('fov_filled', {
        Text = 'Filled FOV Circle',
        Default = false,
        Callback = function(v) flags.fov_filled = v end
    })
    SilentGroup:AddSlider('hit_chance', {
        Text = 'Hit Chance',
        Default = 100,
        Min = 1,
        Max = 100,
        Rounding = 0,
        Suffix = '%',
        Callback = function(v) flags.hit_chance = v end
    })
    SilentGroup:AddToggle('riot_shield_check', {
        Text = 'Riot Shield Check',
        Default = false,
        Callback = function(v) flags.riot_shield_check = v end
    })
    SilentGroup:AddToggle('avoid_katana_deflect', {
        Text = 'Avoid Katana Deflect',
        Default = false,
        Callback = function(v) flags.avoid_katana_deflect = v end
    })

    -- WALLBANG & MANIPULATION
    local ExploitsGroup = Tabs.Main:AddLeftGroupbox('Wallbang & Manipulation')
    ExploitsGroup:AddToggle('manipulation_enabled', {
        Text = 'Wallbang / Manipulation',
        Default = false,
        Callback = function(v) flags.manipulation_enabled = v end
    })
    ExploitsGroup:AddToggle('wallbang_solver_v2', {
        Text = 'Wallbang V2 Solver',
        Default = false,
        Callback = function(v) flags.wallbang_solver_v2 = v end
    })
    ExploitsGroup:AddToggle('teleport_v2_origin', {
        Text = 'Teleport V2 Origin',
        Default = false,
        Callback = function(v) flags.teleport_v2_origin = v end
    })

    -- TARGETING & PRIORITY
    local TargetGroup = Tabs.Main:AddRightGroupbox('Targeting & Priority')
    TargetGroup:AddInput('priority_user_input', {
        Default = '',
        Text = 'Priority Username',
        Placeholder = 'Enter username...',
        Callback = function(v) flags.priority_user_input = v end
    })
    TargetGroup:AddButton('Add to Ragebot Priority', function()
        local u = flags.priority_user_input
        if u and #u > 0 then
            meowState.PriorityList[u] = true
            Library:Notify('Added ' .. u .. ' to Ragebot Priority', 3)
        end
    end)
    TargetGroup:AddToggle('ragebot_priority', {
        Text = 'Ragebot Priority',
        Default = false,
        Callback = function(v) flags.ragebot_priority = v end
    })
    TargetGroup:AddDropdown('target_hitbox_choice', {
        Values = { 'Head', 'Torso', 'Random', 'Smart Lowest HP' },
        Default = 1,
        Text = 'Target Hitbox',
        Callback = function(v) flags.target_hitbox_choice = v end
    })
    TargetGroup:AddDropdown('targeting_priority_method', {
        Values = { 'Distance', 'Lowest Health', 'FOV', 'Crosshair' },
        Default = 1,
        Text = 'Priority Method',
        Callback = function(v) flags.targeting_priority_method = v end
    })
    TargetGroup:AddToggle('auto_weapon_swap', {
        Text = 'Auto Weapon Swap When Empty',
        Default = false,
        Callback = function(v) flags.auto_weapon_swap = v end
    })

    -- MELEE AURA
    local MeleeGroup = Tabs.Main:AddRightGroupbox('Knife Rage & Melee Aura')
    MeleeGroup:AddToggle('melee_aura', {
        Text = 'Knife / Melee Rage',
        Default = false,
        Callback = function(v) flags.melee_aura = v end
    })
    MeleeGroup:AddSlider('melee_reach', {
        Text = 'Melee Safe Reach',
        Default = 16,
        Min = 5,
        Max = 25,
        Rounding = 0,
        Suffix = ' studs',
        Callback = function(v) flags.melee_reach = v end
    })
    MeleeGroup:AddToggle('auto_face_back', {
        Text = 'Auto Face Back (Silent Backstab)',
        Default = false,
        Callback = function(v) flags.auto_face_back = v end
    })

    -- LEGIT AIMBOT & TRIGGERBOT
    local LegitGroup = Tabs.Main:AddLeftGroupbox('Legit Aimbot & Triggerbot')
    LegitGroup:AddToggle('aimbot_enabled', {
        Text = 'Enable Aimbot',
        Default = false,
        Callback = function(v) flags.aimbot_enabled = v end
    }):AddKeyPicker('aimbot_key', {
        Default = 'E',
        Mode = 'Hold',
        Text = 'Aimbot Key',
        Callback = function(v) flags.aimbot_active = v end
    })
    LegitGroup:AddSlider('aimbot_smooth_step', {
        Text = 'Smoothness',
        Default = 6,
        Min = 1,
        Max = 25,
        Rounding = 0,
        Callback = function(v) flags.aimbot_smooth_step = v end
    })
    LegitGroup:AddSlider('aimbot_radius_smoothed', {
        Text = 'Aimbot FOV',
        Default = 90,
        Min = 10,
        Max = 500,
        Rounding = 0,
        Suffix = ' px',
        Callback = function(v) flags.aimbot_radius_smoothed = v end
    })
    LegitGroup:AddToggle('aimbot_visualise_range', {
        Text = 'Visualise Aimbot FOV',
        Default = false,
        Callback = function(v) flags.aimbot_visualise_range = v end
    })
    LegitGroup:AddToggle('aimbot_wall_check', {
        Text = 'Wall Check',
        Default = false,
        Callback = function(v) flags.aimbot_wall_check = v end
    })
    LegitGroup:AddDivider()
    LegitGroup:AddToggle('triggerbot_enabled', {
        Text = 'Enable Triggerbot',
        Default = false,
        Callback = function(v) flags.triggerbot_enabled = v end
    })
    LegitGroup:AddSlider('triggerbot_delay', {
        Text = 'Reaction Delay',
        Default = 20,
        Min = 0,
        Max = 200,
        Rounding = 0,
        Suffix = ' ms',
        Callback = function(v) flags.triggerbot_delay = v end
    })
    LegitGroup:AddToggle('no_recoil', {
        Text = 'No Recoil',
        Default = false,
        Callback = function(v) flags.no_recoil = v end
    })
    LegitGroup:AddToggle('no_spread', {
        Text = 'No Spread',
        Default = false,
        Callback = function(v) flags.no_spread = v end
    })

    -- ANTI-AIM
    local AAGroup = Tabs.Main:AddRightGroupbox('HvH Anti-Aim')
    AAGroup:AddToggle('antiaim_enabled', {
        Text = 'Enable Anti-Aim',
        Default = false,
        Callback = function(v) flags.antiaim_enabled = v end
    })
    AAGroup:AddDropdown('antiaim_preset', {
        Values = { 'Custom', 'Spinbot', 'Jitter Fast', 'Jitter Slow', 'Sway HvH', 'Backward', 'Side Angles (Left)', 'Side Angles (Right)', 'Random HvH', 'Block Anti-Aim' },
        Default = 1,
        Text = 'Anti-Aim Preset',
        Callback = function(v) flags.antiaim_preset = v end
    })
    AAGroup:AddDropdown('yaw_type', {
        Values = { 'None', 'Backwards', 'Left', 'Right', 'Spin', 'Sway', 'Jitter', 'Random', 'Offset', 'Custom', 'Block', 'LBY Breaker', 'Freestanding' },
        Default = 5,
        Text = 'Yaw Mode',
        Callback = function(v) flags.yaw_type = v end
    })
    AAGroup:AddDropdown('pitch_type', {
        Values = { 'None', 'Up', 'Down', 'Up & Down', 'Random', 'Offset', 'Custom', 'Extended Random', 'Extended Custom', 'Zero' },
        Default = 3,
        Text = 'Pitch Mode',
        Callback = function(v) flags.pitch_type = v end
    })
    AAGroup:AddSlider('rotation_speed', {
        Text = 'Rotation Speed',
        Default = 20,
        Min = 1,
        Max = 50,
        Rounding = 0,
        Callback = function(v) flags.rotation_speed = v end
    })
    AAGroup:AddSlider('jitter_range', {
        Text = 'Jitter Angle Range',
        Default = 60,
        Min = 5,
        Max = 180,
        Rounding = 0,
        Suffix = ' deg',
        Callback = function(v) flags.jitter_range = v end
    })
    AAGroup:AddToggle('hide_head', {
        Text = 'Hide Head Angle',
        Default = false,
        Callback = function(v) flags.hide_head = v end
    })
    AAGroup:AddToggle('camera_bypass', {
        Text = 'Camera Replication Decouple',
        Default = false,
        Callback = function(v) flags.camera_bypass = v end
    })
    AAGroup:AddToggle('preserve_movement', {
        Text = 'Preserve Movement Direction',
        Default = false,
        Callback = function(v) flags.preserve_movement = v end
    })
    AAGroup:AddToggle('pause_on_attack', {
        Text = 'Pause On Attack / Knife',
        Default = false,
        Callback = function(v) flags.pause_on_attack = v end
    })
end

-- ==========================================
-- 2. VISUALS TAB
-- ==========================================
do
    -- VIEWMODEL & COSMETICS
    local VMGroup = Tabs.Visuals:AddLeftGroupbox('Viewmodel & Cosmetics')
    VMGroup:AddToggle('show_cosmetics_changer', {
        Text = 'Show Cosmetics Changer',
        Default = true,
        Callback = function(v)
            flags.show_cosmetics_changer = v
            pcall(function()
                if shared.MeowCosmeticChanger and shared.MeowCosmeticChanger.SetVisible then
                    shared.MeowCosmeticChanger.SetVisible(v)
                elseif shared.CosmeticChangerWindow then
                    shared.CosmeticChangerWindow.Visible = v
                end
            end)
        end
    })
    VMGroup:AddToggle('unlock_all', {
        Text = 'Unlock All Cosmetics',
        Default = false,
        Callback = function(v)
            flags.unlock_all = v
            pcall(function() if shared.SyncUnlockAll then shared.SyncUnlockAll(v) end end)
        end
    })
    VMGroup:AddToggle('unlock_emotes_fe', {
        Text = 'Unlock All Emotes (FE)',
        Default = false,
        Callback = function(v)
            flags.unlock_emotes_fe = v
            pcall(function() if shared.SyncUnlockAll then shared.SyncUnlockAll(flags.unlock_all) end end)
        end
    })
    VMGroup:AddDropdown('vm_disable_parts', {
        Values = { 'None', 'Arms', 'Gun', 'Both' },
        Default = 1,
        Text = 'Disable Parts',
        Callback = function(v) flags.vm_disable_parts = v end
    })
    VMGroup:AddSlider('recoil_percent', {
        Text = 'Visual Recoil Percent',
        Default = 100,
        Min = 0,
        Max = 100,
        Rounding = 0,
        Suffix = '%',
        Callback = function(v) flags.recoil_percent = v end
    })
    VMGroup:AddToggle('item_chams', {
        Text = 'Weapon Chams',
        Default = false,
        Callback = function(v) flags.item_chams = v end
    }):AddColorPicker('item_chams_color', {
        Default = Color3.fromRGB(0, 162, 255),
        Title = 'Weapon Chams Color',
        Callback = function(c) flags.item_chams_color = c end
    })
    VMGroup:AddDropdown('item_chams_material', {
        Values = { 'ForceField', 'Neon', 'Plastic', 'Glass', 'Foil' },
        Default = 1,
        Text = 'Weapon Material',
        Callback = function(v) flags.item_chams_material = v end
    })
    VMGroup:AddSlider('item_chams_transparency', {
        Text = 'Weapon Transparency',
        Default = 20,
        Min = 0,
        Max = 100,
        Rounding = 0,
        Suffix = '%',
        Callback = function(v) flags.item_chams_transparency = v / 100 end
    })
    VMGroup:AddToggle('item_wireframe', {
        Text = 'Gun Wireframe',
        Default = false,
        Callback = function(v) flags.item_wireframe = v end
    }):AddColorPicker('wireframe_color', {
        Default = Color3.fromRGB(255, 255, 255),
        Title = 'Wire Color 1',
        Callback = function(c) flags.wireframe_color = c end
    }):AddColorPicker('wireframe_color2', {
        Default = Color3.fromRGB(0, 162, 255),
        Title = 'Wire Color 2',
        Callback = function(c) flags.wireframe_color2 = c end
    })
    VMGroup:AddToggle('arm_appearance', {
        Text = 'Arm Wireframe',
        Default = false,
        Callback = function(v) flags.arm_appearance = v end
    })

    -- HIT EFFECTS & SOUNDS
    local FXGroup = Tabs.Visuals:AddLeftGroupbox('Hit Effects & Sounds')
    FXGroup:AddToggle('hit_sound_enabled', {
        Text = 'Hit Sound Enabled',
        Default = false,
        Callback = function(v) flags.hit_sound_enabled = v end
    })
    FXGroup:AddDropdown('hit_sound_preset', {
        Values = { 'Rust', 'Skeet', 'Bell', 'Bonk', 'Neverlose', 'Bubble' },
        Default = 1,
        Text = 'Hit Sound Preset',
        Callback = function(v) flags.hit_sound_preset = v end
    })
    FXGroup:AddToggle('kill_sound_enabled', {
        Text = 'Kill Sound Enabled',
        Default = false,
        Callback = function(v) flags.kill_sound_enabled = v end
    })
    FXGroup:AddDropdown('kill_sound_preset', {
        Values = { 'Fatality', 'Headshot', 'Skeet', 'Oof' },
        Default = 1,
        Text = 'Kill Sound Preset',
        Callback = function(v) flags.kill_sound_preset = v end
    })
    FXGroup:AddSlider('sound_volume', {
        Text = 'Sound Volume',
        Default = 1.0,
        Min = 0.1,
        Max = 2.0,
        Rounding = 1,
        Callback = function(v) flags.sound_volume = v end
    })
    FXGroup:AddToggle('world_marker_enabled', {
        Text = '3D World Hitmarker',
        Default = false,
        Callback = function(v) flags.world_marker_enabled = v end
    }):AddColorPicker('world_marker_color', {
        Default = Color3.fromRGB(0, 162, 255),
        Title = 'Marker Color',
        Callback = function(c) flags.world_marker_color = c end
    })

    -- TARGET HUD & CROSSHAIR
    local HUDGroup = Tabs.Visuals:AddRightGroupbox('Target HUD & Crosshair')
    HUDGroup:AddToggle('target_hud', {
        Text = 'Enable Target Info HUD',
        Default = false,
        Callback = function(v) flags.target_hud = v end
    })
    HUDGroup:AddToggle('target_hud_preview', {
        Text = 'Preview Target HUD',
        Default = false,
        Callback = function(v) flags.target_hud_preview = v end
    })
    HUDGroup:AddToggle('show_music_player', {
        Text = 'Show Music Player',
        Default = false,
        Callback = function(v)
            if shared.MeowMusicPlayer and shared.MeowMusicPlayer.MainFrame then
                shared.MeowMusicPlayer.MainFrame.Visible = v
            end
        end
    })
    HUDGroup:AddDivider()
    HUDGroup:AddToggle('crosshair_enabled', {
        Text = 'Custom Crosshair',
        Default = false,
        Callback = function(v) flags.crosshair_enabled = v end
    }):AddColorPicker('crosshair_color', {
        Default = Color3.fromRGB(0, 162, 255),
        Title = 'Crosshair Color',
        Callback = function(c) flags.crosshair_color = c end
    })
    HUDGroup:AddToggle('crosshair_rainbow', {
        Text = 'Rainbow Crosshair',
        Default = false,
        Callback = function(v) flags.crosshair_rainbow = v end
    })
    HUDGroup:AddToggle('crosshair_outline', {
        Text = 'Crosshair Outlines',
        Default = true,
        Callback = function(v) flags.crosshair_outline = v end
    })
    HUDGroup:AddToggle('crosshair_dot', {
        Text = 'Center Dot',
        Default = false,
        Callback = function(v) flags.crosshair_dot = v end
    }):AddColorPicker('crosshair_dot_color', {
        Default = Color3.fromRGB(0, 162, 255),
        Title = 'Dot Color',
        Callback = function(c) flags.crosshair_dot_color = c end
    })
    HUDGroup:AddToggle('crosshair_t_shape', {
        Text = 'T-Shape Crosshair',
        Default = false,
        Callback = function(v) flags.crosshair_t_shape = v end
    })
    HUDGroup:AddSlider('crosshair_length', {
        Text = 'Crosshair Length',
        Default = 14,
        Min = 1,
        Max = 50,
        Rounding = 0,
        Suffix = ' px',
        Callback = function(v) flags.crosshair_length = v end
    })
    HUDGroup:AddSlider('crosshair_offset', {
        Text = 'Crosshair Gap',
        Default = 6,
        Min = 0,
        Max = 30,
        Rounding = 0,
        Suffix = ' px',
        Callback = function(v) flags.crosshair_offset = v end
    })
    HUDGroup:AddSlider('crosshair_thickness', {
        Text = 'Crosshair Thickness',
        Default = 2,
        Min = 1,
        Max = 8,
        Rounding = 0,
        Suffix = ' px',
        Callback = function(v) flags.crosshair_thickness = v end
    })
    HUDGroup:AddSlider('crosshair_rotation_speed', {
        Text = 'Spin Speed',
        Default = 0,
        Min = 0,
        Max = 10,
        Rounding = 1,
        Callback = function(v) flags.crosshair_rotation_speed = v end
    })
    HUDGroup:AddToggle('crosshair_hit_pulse', {
        Text = 'Hitmarker Dynamic Pulse',
        Default = false,
        Callback = function(v) flags.crosshair_hit_pulse = v end
    })

    -- WORLD & LIGHTING
    local WorldGroup = Tabs.Visuals:AddRightGroupbox('World & Lighting')
    WorldGroup:AddToggle('lighting_ambient_enabled', {
        Text = 'Ambient Override',
        Default = false,
        Callback = function(v) flags.lighting_ambient_enabled = v end
    }):AddColorPicker('lighting_ambient_color', {
        Default = Color3.fromRGB(150, 150, 150),
        Title = 'Ambient Color',
        Callback = function(c) flags.lighting_ambient_color = c end
    })
    WorldGroup:AddToggle('lighting_brightness_enabled', {
        Text = 'Override Brightness',
        Default = false,
        Callback = function(v) flags.lighting_brightness_enabled = v end
    })
    WorldGroup:AddSlider('lighting_brightness_value', {
        Text = 'Brightness',
        Default = 2,
        Min = 0,
        Max = 10,
        Rounding = 1,
        Callback = function(v) flags.lighting_brightness_value = v end
    })
    WorldGroup:AddToggle('lighting_clocktime_enabled', {
        Text = 'Override ClockTime',
        Default = false,
        Callback = function(v) flags.lighting_clocktime_enabled = v end
    })
    WorldGroup:AddSlider('lighting_clocktime_value', {
        Text = 'Time of Day',
        Default = 14,
        Min = 0,
        Max = 24,
        Rounding = 1,
        Suffix = ' h',
        Callback = function(v) flags.lighting_clocktime_value = v end
    })
    WorldGroup:AddToggle('world_skybox_enabled', {
        Text = 'Enable Skybox Override',
        Default = false,
        Callback = function(v)
            flags.world_skybox_enabled = v
            applySkybox(flags.skybox_preset or 'Synthwave')
        end
    })
    WorldGroup:AddDropdown('skybox_preset', {
        Values = { 'Synthwave', 'Purple Nebula', 'Vaporwave', 'Night Sky', 'Red Galaxy', 'Sunset', 'GreenHaze', 'Space2', 'PinkMountains', 'Valentines', 'PinkArt', 'PurplePlanet', 'Blizzard', 'Winter', 'FlamingSunset', 'Mountains', 'FPSBoost', 'AestheticMountains', 'BetterNight3', 'Galaxy2', 'Aesthetic3', 'PurpleSpace', 'Pink', 'PurpleNight', 'Flame', 'Galaxy3', 'Storm', 'Deep Space' },
        Default = 1,
        Text = 'Skybox Preset',
        Callback = function(v)
            flags.skybox_preset = v
            if flags.world_skybox_enabled then applySkybox(v) end
        end
    })
    WorldGroup:AddToggle('world_no_textures', {
        Text = 'No Textures (FPS Boost)',
        Default = false,
        Callback = function(v) flags.world_no_textures = v end
    })
    WorldGroup:AddToggle('world_no_fog', {
        Text = 'No Fog',
        Default = false,
        Callback = function(v) flags.world_no_fog = v end
    })
    WorldGroup:AddToggle('anti_flash', {
        Text = 'Anti-Flashbang',
        Default = false,
        Callback = function(v) flags.anti_flash = v end
    })
    WorldGroup:AddToggle('anti_shake', {
        Text = 'Anti-Screen Shake',
        Default = false,
        Callback = function(v) flags.anti_shake = v end
    })
    WorldGroup:AddToggle('camera_fov_enabled', {
        Text = 'Custom Camera FOV',
        Default = false,
        Callback = function(v) flags.camera_fov_enabled = v end
    })
    WorldGroup:AddSlider('camera_fov', {
        Text = 'Field of View',
        Default = 90,
        Min = 60,
        Max = 130,
        Rounding = 0,
        Suffix = ' deg',
        Callback = function(v) flags.camera_fov = v end
    })
    WorldGroup:AddToggle('third_person', {
        Text = 'Third Person POV',
        Default = false,
        Callback = function(v) flags.third_person = v end
    })
end

-- ==========================================
-- 3. ESP TAB
-- ==========================================
do
    local EnemyESP = Tabs.ESP:AddLeftGroupbox('Enemy ESP')
    EnemyESP:AddToggle('esp_enabled', {
        Text = 'Enable Enemy ESP',
        Default = false,
        Callback = function(v) flags.esp_enabled = v end
    })
    EnemyESP:AddDropdown('esp_box_style', {
        Values = { 'Corner', 'Full', '3D Box' },
        Default = 1,
        Text = 'Box Style',
        Callback = function(v) flags.esp_box_style = v end
    })
    EnemyESP:AddToggle('esp_boxes', {
        Text = 'Bounding Box',
        Default = false,
        Callback = function(v) flags.esp_boxes = v end
    }):AddColorPicker('esp_box_color', {
        Default = Color3.fromRGB(255, 255, 255),
        Title = 'Box Color',
        Callback = function(c) flags.esp_box_color = c end
    })
    EnemyESP:AddToggle('esp_box_fill', {
        Text = 'Filled Box',
        Default = false,
        Callback = function(v) flags.esp_box_fill = v end
    }):AddColorPicker('esp_fill_color', {
        Default = Color3.fromRGB(0, 162, 255),
        Title = 'Fill Color',
        Callback = function(c) flags.esp_fill_color = c end
    })
    EnemyESP:AddToggle('esp_names', {
        Text = 'Name Tags',
        Default = false,
        Callback = function(v) flags.esp_names = v end
    }):AddColorPicker('esp_name_color', {
        Default = Color3.fromRGB(240, 240, 240),
        Title = 'Name Color',
        Callback = function(c) flags.esp_name_color = c end
    })
    EnemyESP:AddToggle('esp_health_bars', {
        Text = 'Health Bar',
        Default = false,
        Callback = function(v) flags.esp_health_bars = v end
    }):AddColorPicker('esp_health_color', {
        Default = Color3.fromRGB(0, 255, 120),
        Title = 'Health Bar Color',
        Callback = function(c) flags.esp_health_color = c end
    })
    EnemyESP:AddToggle('esp_health_number', {
        Text = 'Health Number',
        Default = false,
        Callback = function(v) flags.esp_health_number = v end
    })
    EnemyESP:AddToggle('esp_ammo_bar', {
        Text = 'Ammo Bar',
        Default = false,
        Callback = function(v) flags.esp_ammo_bar = v end
    }):AddColorPicker('esp_ammo_color', {
        Default = Color3.fromRGB(0, 162, 255),
        Title = 'Ammo Bar Color',
        Callback = function(c) flags.esp_ammo_color = c end
    })
    EnemyESP:AddToggle('esp_weapons', {
        Text = 'Held Weapon',
        Default = false,
        Callback = function(v) flags.esp_weapons = v end
    })
    EnemyESP:AddToggle('esp_distance', {
        Text = 'Distance',
        Default = false,
        Callback = function(v) flags.esp_distance = v end
    })
    EnemyESP:AddToggle('esp_rank', {
        Text = 'Rank Badge',
        Default = false,
        Callback = function(v) flags.esp_rank = v end
    })
    EnemyESP:AddToggle('esp_streak', {
        Text = 'Win Streak',
        Default = false,
        Callback = function(v) flags.esp_streak = v end
    })
    EnemyESP:AddToggle('esp_deflecting', {
        Text = 'Deflecting Flag',
        Default = false,
        Callback = function(v) flags.esp_deflecting = v end
    })

    local ChamsESP = Tabs.ESP:AddRightGroupbox('Chams & Tracers')
    ChamsESP:AddToggle('chams_enabled', {
        Text = 'Enable Enemy Chams',
        Default = false,
        Callback = function(v) flags.chams_enabled = v end
    }):AddColorPicker('chams_color', {
        Default = Color3.fromRGB(0, 162, 255),
        Title = 'Chams Color',
        Callback = function(c) flags.chams_color = c end
    })
    ChamsESP:AddSlider('chams_fill_transparency', {
        Text = 'Chams Fill Transparency',
        Default = 50,
        Min = 0,
        Max = 100,
        Rounding = 0,
        Suffix = '%',
        Callback = function(v) flags.chams_fill_transparency = v / 100 end
    })
    ChamsESP:AddToggle('head_marker_enabled', {
        Text = 'Head Marker',
        Default = false,
        Callback = function(v) flags.head_marker_enabled = v end
    }):AddColorPicker('head_marker_color', {
        Default = Color3.fromRGB(255, 50, 50),
        Title = 'Head Marker Color',
        Callback = function(c) flags.head_marker_color = c end
    })
    ChamsESP:AddDivider()
    ChamsESP:AddToggle('esp_tracers', {
        Text = 'Enable Snapline Tracers',
        Default = false,
        Callback = function(v) flags.esp_tracers = v end
    }):AddColorPicker('esp_tracer_color', {
        Default = Color3.fromRGB(0, 162, 255),
        Title = 'Tracer Color',
        Callback = function(c) flags.esp_tracer_color = c end
    })
    ChamsESP:AddDropdown('esp_tracer_origin', {
        Values = { 'Bottom', 'Center', 'Top', 'Mouse' },
        Default = 1,
        Text = 'Tracer Origin',
        Callback = function(v) flags.esp_tracer_origin = v end
    })
    ChamsESP:AddToggle('bullet_tracers', {
        Text = 'Bullet Tracers',
        Default = false,
        Callback = function(v) flags.bullet_tracers = v end
    }):AddColorPicker('tracer_color', {
        Default = Color3.fromRGB(120, 180, 255),
        Title = 'Bullet Tracer Color',
        Callback = function(c) flags.tracer_color = c end
    })

    local TeamESP = Tabs.ESP:AddRightGroupbox('Teammates & Filters')
    TeamESP:AddToggle('esp_team_check', {
        Text = 'Team Check (Ignore Teammates)',
        Default = false,
        Callback = function(v) flags.esp_team_check = v end
    })
    TeamESP:AddToggle('esp_team_enabled', {
        Text = 'Enable Teammate ESP',
        Default = false,
        Callback = function(v) flags.esp_team_enabled = v end
    })
    TeamESP:AddToggle('esp_display_names', {
        Text = 'Use Display Names',
        Default = false,
        Callback = function(v) flags.esp_display_names = v end
    })
    TeamESP:AddSlider('esp_max_distance', {
        Text = 'Max Render Distance',
        Default = 1500,
        Min = 50,
        Max = 2000,
        Rounding = 0,
        Suffix = ' studs',
        Callback = function(v) flags.esp_max_distance = v end
    })
end

-- ==========================================
-- 4. MISC TAB
-- ==========================================
do
    local MoveGroup = Tabs.Misc:AddLeftGroupbox('Movement')
    MoveGroup:AddToggle('walkspeed_enabled', {
        Text = 'Enable WalkSpeed Multiplier',
        Default = false,
        Callback = function(v) movementState.WalkSpeedEnabled = v end
    })
    MoveGroup:AddSlider('walkspeed_mult', {
        Text = 'WalkSpeed Multiplier',
        Default = 1.5,
        Min = 1.0,
        Max = 10.0,
        Rounding = 1,
        Suffix = 'x',
        Callback = function(v) movementState.WalkSpeedMult = v end
    })
    MoveGroup:AddToggle('noclip_enabled', {
        Text = 'Noclip',
        Default = false,
        Callback = function(v) movementState.NoclipEnabled = v end
    })
    MoveGroup:AddToggle('bhop_enabled', {
        Text = 'Auto Bunnyhop (B-Hop)',
        Default = false,
        Callback = function(v) movementState.BHopEnabled = v end
    })
    MoveGroup:AddToggle('flight_enabled', {
        Text = 'Flight / Fly Hack',
        Default = false,
        Callback = function(v) movementState.FlightEnabled = v end
    })
    MoveGroup:AddSlider('flight_speed', {
        Text = 'Flight Speed',
        Default = 100,
        Min = 25,
        Max = 500,
        Rounding = 0,
        Suffix = ' studs/s',
        Callback = function(v) movementState.FlightSpeed = v end
    })
    MoveGroup:AddToggle('double_jump', {
        Text = 'Infinite Double Jumps',
        Default = false,
        Callback = function(v) movementState.DoubleJump = v end
    })

    local AutoGroup = Tabs.Misc:AddRightGroupbox('Automation & Protection')
    AutoGroup:AddToggle('auto_loadout_enabled', {
        Text = 'Enable Auto Loadout',
        Default = false,
        Callback = function(v) flags.auto_loadout_enabled = v end
    })
    AutoGroup:AddDropdown('loadout_slot1', {
        Values = { 'Assault Rifle', 'Sniper', 'Shotgun', 'Burst Rifle', 'Minigun', 'Paintball Gun' },
        Default = 1,
        Text = 'Slot 1 (Primary)',
        Callback = function(v) flags.auto_loadout_primary = v end
    })
    AutoGroup:AddDropdown('loadout_slot2', {
        Values = { 'Handgun', 'Revolver', 'SMG', 'Uzi', 'Wildcat' },
        Default = 1,
        Text = 'Slot 2 (Secondary)',
        Callback = function(v) flags.auto_loadout_secondary = v end
    })
    AutoGroup:AddDropdown('loadout_slot3', {
        Values = { 'Katana', 'Knife', 'Bat', 'Fists', 'Scythe' },
        Default = 1,
        Text = 'Slot 3 (Melee)',
        Callback = function(v) flags.auto_loadout_melee = v end
    })
    AutoGroup:AddDropdown('loadout_slot4', {
        Values = { 'Grenade', 'Smoke Grenade', 'Flashbang', 'Medkit', 'Subspace Tripmine' },
        Default = 1,
        Text = 'Slot 4 (Utility)',
        Callback = function(v) flags.auto_loadout_utility = v end
    })
    AutoGroup:AddToggle('auto_queue_enabled', {
        Text = 'Auto Play Again / Queue',
        Default = false,
        Callback = function(v) flags.auto_queue_enabled = v end
    })
    AutoGroup:AddDivider()
    AutoGroup:AddToggle('staff_detector', {
        Text = 'Detect Staff / Admins',
        Default = true,
        Callback = function(v) staffDetectorState.Enabled = v end
    })
    AutoGroup:AddDropdown('staff_action', {
        Values = { 'Notify', 'Server Hop', 'Disconnect' },
        Default = 1,
        Text = 'Staff Detection Action',
        Callback = function(v)
            staffDetectorState.AutoHop = (v == 'Server Hop')
            staffDetectorState.AutoKick = (v == 'Disconnect')
        end
    })
end

-- ==========================================
-- 5. CHARACTER TAB (FAKE POSITION & DESYNC)
-- ==========================================
do
    local FPGroup = Tabs.Character:AddLeftGroupbox('Fake Position Engine')
    FPGroup:AddToggle('fake_position_enabled', {
        Text = 'Enable Fake Position (Underground)',
        Default = false,
        Callback = function(v) setFakePosition(v) end
    }):AddKeyPicker('fake_position_keybind', {
        Default = 'X',
        Mode = 'Toggle',
        Text = 'Fake Position',
        Callback = function() getgenv().ToggleFakePosition() end
    })
    FPGroup:AddSlider('fake_position_depth', {
        Text = 'Underground Depth',
        Default = 5.8,
        Min = 1.0,
        Max = 25.0,
        Rounding = 1,
        Suffix = ' studs',
        Callback = function(v)
            flags.fake_position_depth = v
            fakePos.Depth = v
            getgenv().SetFakePositionDepth(v)
        end
    })
    FPGroup:AddToggle('fp_walk_mode', {
        Text = 'Dynamic Walk (WASD Smooth)',
        Default = true,
        Callback = function(v) fakePos.WalkMode = v end
    })
    FPGroup:AddToggle('fp_surface_cam', {
        Text = 'Surface Camera Elevation',
        Default = true,
        Callback = function(v) fakePos.SurfaceCamera = v end
    })
    FPGroup:AddToggle('fp_auto_noclip', {
        Text = 'Auto Noclip Underground',
        Default = true,
        Callback = function(v) fakePos.AutoNoclip = v end
    })
    FPGroup:AddToggle('fp_auto_handoff', {
        Text = 'Auto Handoff On Shoot',
        Default = true,
        Callback = function(v) fakePos.AutoHandoff = v end
    })

    local CloakGroup = Tabs.Character:AddRightGroupbox('Desync Cloak & Angles')
    CloakGroup:AddToggle('fp_visualizer', {
        Text = 'Visualise Fake Position (Ghost)',
        Default = true,
        Callback = function(v)
            fakePos.VisualizerEnabled = v
            updateGhostVisualizer()
        end
    }):AddColorPicker('fp_ghost_color', {
        Default = Color3.fromRGB(0, 162, 255),
        Title = 'Ghost Color',
        Callback = function(c)
            fakePos.VisualizerColor = c
            updateGhostVisualizer()
        end
    })
    CloakGroup:AddToggle('fp_panic', {
        Text = 'Panic Jitter Mode',
        Default = false,
        Callback = function(v) fakePos.Panic = v end
    })
    CloakGroup:AddToggle('fp_hide_meshes', {
        Text = 'Hide Character Meshes',
        Default = true,
        Callback = function(v)
            fakePos.HideMeshes = v
            getgenv().SetFakePositionHideMesh(v)
        end
    })
    CloakGroup:AddToggle('fp_anim_desync', {
        Text = 'Freeze Desync Animation Pose',
        Default = true,
        Callback = function(v)
            fakePos.AnimationDesync = v
            if fakePos.Enabled then
                if v then playAnimDesync() else stopAnimDesync() end
            end
        end
    })
    CloakGroup:AddDivider()
    CloakGroup:AddToggle('fp_invert_pitch', {
        Text = 'Invert Head Pitch (Anti-Headshot)',
        Default = false,
        Callback = function(v) fakePos.InvertPitch = v end
    })
    CloakGroup:AddSlider('fp_custom_pitch', {
        Text = 'Custom Pitch Angle',
        Default = 0,
        Min = -89,
        Max = 89,
        Rounding = 0,
        Suffix = ' deg',
        Callback = function(v) fakePos.CustomPitch = v end
    })
    CloakGroup:AddSlider('fp_custom_yaw', {
        Text = 'Custom Yaw Angle',
        Default = 0,
        Min = 0,
        Max = 360,
        Rounding = 0,
        Suffix = ' deg',
        Callback = function(v) fakePos.CustomYaw = v end
    })
end

-- ==========================================
-- 6. UI SETTINGS & UTILITIES TAB
-- ==========================================
do
    local MenuGroup = Tabs.Settings:AddLeftGroupbox('Menu & Theme')
    MenuGroup:AddLabel('Menu Accent'):AddColorPicker('menu_accent', {
        Default = Library.AccentColor,
        Title = 'Accent Color',
        Callback = function(c)
            Library.AccentColor = c
            Library.AccentColorDark = Library:GetDarkerColor(c)
            Library:UpdateColorsUsingRegistry()
        end
    })
    MenuGroup:AddLabel('Menu Keybind'):AddKeyPicker('MenuKeybind', {
        Default = 'RightShift',
        NoUI = true,
        Text = 'Menu Keybind'
    })
    Library.ToggleKeybind = getgenv().Options.MenuKeybind

    MenuGroup:AddButton('Unload Cheat', function()
        meowState.Destroyed = true
        if shared.MeowCosmeticsGui then shared.MeowCosmeticsGui:Destroy() end
        Library:Unload()
    end)

    local UtilsGroup = Tabs.Settings:AddRightGroupbox('Server Utilities')
    UtilsGroup:AddButton('Rejoin Server', function()
        pcall(function()
            TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
        end)
    })
    UtilsGroup:AddButton('Server Hop', function()
        pcall(function()
            local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
            for _, s in ipairs(servers.data) do
                if s.playing < s.maxPlayers and s.id ~= game.JobId then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id, LocalPlayer)
                    break
                end
            end
        end)
    })
    UtilsGroup:AddButton('Copy Discord Invite', function()
        if setclipboard then
            setclipboard("https://discord.gg/sleepy")
            Library:Notify("Discord invite copied to clipboard!", 3)
        end
    })
end
