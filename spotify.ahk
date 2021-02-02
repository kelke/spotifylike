;SaveSongToSpotifyLibrary
    spotify := "ahk_exe spotify.exe"
    if WinExist(spotify) {
        ; Store starting window ID and mouse position.
        MouseGetPos x, y, startingWinId

        ; Activate Spotify.
        WinActivate %spotify%
        WinWaitActive %spotify%

        Imagenumber = 0
        saveToYourLibraryHeartIcon = %A_WorkingDir%\spotifyherz.png
        ImageSearch FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %saveToYourLibraryHeartIcon%
        
        if (ErrorLevel = 1) {
            saveToYourLibraryPlusIcon = %A_WorkingDir%\spotifyplus.png
            ImageSearch FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %saveToYourLibraryPlusIcon%
        }

        if (ErrorLevel = 0) {
            Click %FoundX%, %FoundY%

        } else if (ErrorLevel = 2) {
            ;MsgBox % "Problem conducting image search. Is the saveToYourLibraryIcon in the correct location?"
            MsgBox % "Bildersuche fehlerhaft, ist das saveToYourLibraryIcon im korrekten Pfad?"

        } else if (ErrorLevel = 1) {
            ;MsgBox % "Unable to save song. Can't find the Add button."
            MsgBox % "Song konnte nicht favorisiert werden. Der Knopf wurde nicht gefunden."
        }

        ; Restore original window and mouse position.
        WinActivate ahk_id %startingWinId%
        MouseMove %x%, %y%
    }