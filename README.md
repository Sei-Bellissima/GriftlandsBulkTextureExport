# GriftlandsBulkTextureExport
Mod to bulk export certain textures using the game's debug log. Currently only export card icons and graft icons.

This has only been tested on the experimental branch of the game so I can't verify whether or not this works on the live branch.
# How to install and use

Ensure that a "mods" folder exists under %USERNAME%\AppData\Roaming\Klei\Griftlands (If installed with Steam, it will be %USERNAME%\AppData\Roaming\Klei\Griftlands\steam-\[a large number will be here\]). If one doesn't exists, create it. Clone the repository and put the "GriftlandsExportIcons" folder into the "mods" folder.

Make sure debug mode is enabled.
For Epic Games:
Go to settings, then Griftlands, then check "Additional Command Line Parameters". In the edit box, enter "--debug".
For Steam:
Right-click on Griftlands, click "Properties...", then click "Set Launch Options...". enter "--debug" in the box.

Run the game.
Press CTRL + TILDE (~) to bring up the debug log. Then enter one of the following commands into it:

ExportIcons("negotiation")
ExportIcons("battle")
ExportIcons("grafts")

The game will then export the negotiation card icons, the battle card icons, or the graft icons, respectively.
You may have to press CTRL + TILDE again to close the debug log for the game to actually start the export process.
Textures will be exported to  %USERNAME%\AppData\Roaming\Klei\Griftlands (for steam, it will be the %USERNAME%\AppData\Roaming\Klei\Griftlands\steam-\[large number\] folder).
