--imports

import XMonad
import XMonad.Layout.Spacing
import XMonad.Layout.Tabbed
import XMonad.Hooks.ManageHelpers (isDialog,  doCenterFloat)

myFocusFollowsMouse  = True
myClickJustFocuses   = False
myBorderWidth        = 2
myWorkspaces         = ["I","II","III","IV","V","VI","VII","VIII","IX"]
myNormalBorderColor  = "#dddddd"
myFocusedBorderColor = "#ff6ac1"

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Layouts:

myLayout = avoidStruts( Tall 1 (3/100) (1/2) ||| Full ||| simpleTabbed)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Window rules :

myManageHook = composeAll
    [ 
     isDialog                            --> doCenterFloat
     ,className  =? "Steam"              --> doFloat
     ,className  =? "Pavucontrol"        --> doFloat
     ,title      =? "Media viewer"       --> doFloat -- telegram destop image viwer
     ,className  =? "VirtualBox Manager" --> doFloat
     ,className  =? "Gimp"               --> doFloat
     ,resource   =? "Dialog"             --> doFloat
    ]


main :: IO ()
main = do 

     {
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        workspaces         = myWorkspaces,
        focusedBorderColor = myFocusedBorderColor,
        normalBorderColor  = myNormalBorderColor,

        layoutHook         = spacingRaw False (Border 0 6 0 6) True (Border 6 0 6 0) True $ smartBorders $ myLayout,
        manageHook         = myManageHook,
    }
 

