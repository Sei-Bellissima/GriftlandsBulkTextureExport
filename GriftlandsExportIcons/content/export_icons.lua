function ExportIconsInternal(arg)
    local NotValid = true
    local list = {}
    local ContentFunction = ""
    local rem = ""
    local MissingTextures = {
        "icons/mutators/daily_boss_health.tex",
        "icons/items/graft_tough_constitution.tex",
        "icons/items/graft_researcher.tex",
        "icons/items/graft_resolute3.tex",
        "icons/items/graft_perfect_shape.tex",
        "icons/items/graft_benefits.tex",
        "icons/items/graft_gourmet.tex",
        "icons/items/graft_survivalist.tex",
        "icons/items/graft_good_health.tex",
        "icons/items/graft_basic_training.tex",
        "icons/items/graft_resolute.tex",
        "icons/items/graft_handy.tex",
        "icons/items/graft_stamina2.tex",
        "icons/items/graft_good_health2.tex",
        "icons/items/graft_animal_bond.tex",
        "icons/items/graft_stamina.tex",
        "icons/items/graft_expanded_assortment.tex",
        "icons/items/graft_socializer.tex",
        "icons/items/graft_fast_learner.tex",
        "icons/items/graft_good_health3.tex",
        "icons/items/graft_charming.tex",
        "icons/items/graft_benefits2.tex",
        "icons/items/graft_animal_handling.tex",
        "icons/items/graft_alert.tex",
        "icons/items/graft_partner_in_crime.tex",
        "icons/items/graft_premium_quality.tex",
        "icons/items/graft_terror.tex",
        "icons/items/graft_perseverance.tex",
        "icons/items/graft_resolute2.tex",
        "icons/items/graft_benefits3.tex",
        "icons/items/graft_unencumbered.tex",
        "icons/items/graft_ancient_warrior.tex",
        "icons/items/graft_innate_connection.tex",
        "icons/items/graft_forgiveness.tex",
        "battle/spit.tex",
        "battle/bite.tex"
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
                    if string.match(icon, "items") then
                        rem = "icons/items/"
                    else
                        rem = "icons/mutators/"
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

function FindGraftStrings()
    for id, def in pairs(Content.GetAllGrafts()) do
        local icon = def.img_path
        print(icon)
    end
end

function ExportIcons(arg)
    TheGame.scheduler:DoCoroutine( 0.5, ExportIconsInternal, arg )
end