MountModData( "ExportIcons" )

local function OnLoad()
    local self_dir = "ExportIcons:content/"
    local LOAD_FILE_ORDER =
    {
        "export_icons"
    }
    for i, file in ipairs(LOAD_FILE_ORDER) do
        require(self_dir .. file)
    end
end

return {
    OnLoad = OnLoad
}