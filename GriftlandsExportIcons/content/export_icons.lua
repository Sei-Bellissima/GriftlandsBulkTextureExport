function ExportIconsInternal(arg)
    local NotValid = true
    local list = {}
    local ContentFunction = ""
    local rem = ""
    local MissingTextures = {
        "icons/mutators/daily_boss_health.tex",
        "icons/items/graft_story_mode_graft.tex",
        "battle/bite.tex",
        "battle/spit.tex"
    }
    if arg == "negotiation" then
        ContentFunction = Content.GetAllNegotiationCards()
        rem = "negotiation/"
        NotValid = false
    elseif arg == "battle" then
        ContentFunction = Content.GetAllBattleCards()
        rem = "battle/"
        NotValid = false
    elseif arg == "grafts" then
        ContentFunction = Content.GetAllGrafts()
        NotValid = false
    end
    if NotValid == false then
        for id, def in pairs(ContentFunction) do
            local icon = def.path_str
            if arg == "grafts" then
                icon = def.img_path
                if icon ~= nil then
                    if string.find(icon, "items") then
                        rem = "icons/items/"
                    elseif string.find(icon, "mutators") then
                        rem = "icons/mutators/"
                    else
                        rem = "icons/perks/"
                    end
                end
            end
            local is_there = false
            local is_missing = false
            for i, val in ipairs(list) do
                if icon == val then
                    is_there = true
                end
            end
            for i, val in ipairs(MissingTextures) do
                if icon == val then
                    is_missing = true
                end
            end
            --preventing duplicates and missing textures
            if is_there == false and is_missing == false then
                table.insert(list, icon)
            end
        end
        for i, pic in pairs(list) do
            local name = string.gsub(pic, rem, '')
            print('Exporting ' .. '"'..pic..'"')
            UIHelpers.SaveTextureAsPNG(engine.asset.Texture(pic), name)
            coroutine.yield( 0.1 )
            collectgarbage()
        end
    else
        print("Not a valid argument")
    end
end

function ExportIcons(arg)
    TheGame.scheduler:DoCoroutine( 0.5, ExportIconsInternal, arg )
end
