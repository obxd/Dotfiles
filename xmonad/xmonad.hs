--imports

import XMonad
import System.Exit
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Spacing
import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import XMonad.Hooks.DynamicLog
import Graphics.X11.ExtraTypes.XF86
import XMonad.Actions.WindowBringer
import XMonad.Layout.NoBorders
import XMonad.Layout.Tabbed
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Hooks.ManageHelpers (isDialog,  doCenterFloat)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

myModMask :: KeyMask
myModMask = mod4Mask

myTerminal :: String
myTerminal = "alacritty"

myBrowser :: String
myBrowser = "firefox"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myClickJustFocuses :: Bool
myClickJustFocuses = False

myBorderWidth   = 2

myWorkspaces    = ["I","II","III","IV","V","VI","VII","VIII","IX"]

--myNormalBorderColor  = "dddddd"

myFocusedBorderColor = "#ff6ac1"

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ 
    -- screen xrander scripts
    --



    ((modm                  ,  xK_F1                       ), spawn("/home/obxd/.screenlayout/laptop_1s.sh"))
    , ((modm                  ,  xK_F2                     ), spawn("/home/obxd/.screenlayout/home_1s.sh"))
    , ((modm                  ,  xK_F3                     ), spawn("/home/obxd/.screenlayout/home_2s.sh"))
    , ((modm                  ,  xK_F4                     ), spawn("/bin/ls -d -1 '/home/obxd/Pictures/dark_wallpepers'/* | shuf -n 1 | xargs -I % xwallpaper --maximize '%' "))

      -- spawn applications
    , ((modm                  ,  xK_t                    ), spawn myTerminal)
    , ((modm                  ,  xK_b                    ), spawn myBrowser)


      -- prompts and menues
    , ((modm                  ,  xK_space                ), spawn("dmenu_run"))

       -- kill compile and exit
    , ((modm                  ,  xK_q                    ), kill)
    , ((modm                  ,  xK_c                    ), spawn "xmonad --recompile; xmonad --restart")
    , ((modm .|. shiftMask    ,  xK_c                    ), io (exitWith ExitSuccess))

      -- layout change focus
    , ((modm                  ,  xK_Tab                  ), windows W.focusDown)
    , ((modm                  ,  xK_j                    ), windows W.focusDown)
    , ((modm                  ,  xK_k                    ), windows W.focusUp)
    , ((modm                  ,  xK_Return               ), windows W.swapMaster)

      -- shift windows
    , ((modm .|. shiftMask    ,  xK_j                    ), windows W.swapDown)
    , ((modm .|. shiftMask    ,  xK_k                    ), windows W.swapUp)

      -- change layoout
    , ((modm                  ,  xK_n                    ), sendMessage NextLayout)
    , ((modm .|. shiftMask    ,  xK_n                    ), setLayout $ XMonad.layoutHook conf)

      -- resize windows
    , ((modm                  ,  xK_h                    ), sendMessage Shrink)  
    , ((modm                  ,  xK_l                    ), sendMessage Expand)
    , ((modm .|. controlMask  ,  xK_t                    ), withFocused $ windows . W.sink)

      -- gaps and struts
   , ((modm .|. controlMask  ,  xK_f                    ), sequence_ [sendMessage  ToggleStruts ,toggleScreenSpacingEnabled, toggleWindowSpacingEnabled])
    , ((modm                  ,  xK_equal                ), incWindowSpacing 4)
    , ((modm                  ,  xK_minus                ), decWindowSpacing 4)
    , ((modm .|. shiftMask    ,  xK_equal                ), incScreenSpacing 4)
    , ((modm .|. shiftMask    ,  xK_minus                ), decScreenSpacing 4)


      -- screenshots
    , ((0                  ,  xK_Print                ), spawn "flameshot gui")

      -- volume
     , ((0                     ,  xF86XK_AudioMute        ), spawn "amixer sset Master toggle")
     , ((0                     ,  xF86XK_AudioRaiseVolume ), spawn "amixer sset Master 5%+")
     , ((modm                  ,  xF86XK_AudioRaiseVolume ), spawn "amixer sset Master 10%+")
     , ((0                     ,  xF86XK_AudioLowerVolume ), spawn "amixer sset Master 5%-")
     , ((modm                  ,  xF86XK_AudioLowerVolume ), spawn "amixer sset Master 10%-")

      -- backlight 
    , ((0                     ,  xF86XK_MonBrightnessUp  ), spawn "xbacklight -inc +5")    
    , ((modm                  ,  xF86XK_MonBrightnessUp  ), spawn "xbacklight -inc +10")    
    , ((0                     ,  xF86XK_MonBrightnessDown), spawn "xbacklight -dec +5")   
    , ((modm                  ,  xF86XK_MonBrightnessDown), spawn "xbacklight -dec +10")   
    ]
    ++
      --change workspace
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
     --move windows to workspaces
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))                                                    
        | (key, sc) <- zip [xK_w, xK_e, xK_i
        ] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]  

-------------------------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w >> windows W.shiftMaster))    -- mod-button1, Set the window to floating mode and move by dragging
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))                         -- mod-button2, Raise the window to the top of the stack
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w >> windows W.shiftMaster))  -- mod-button3, Set the window to floating mode and resize by dragging
    ]

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Layouts:

myLayout = avoidStruts( Tall 1 (3/100) (1/2) ||| Full ||| simpleTabbed)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Window rules (xprop to find name ):

myManageHook = composeAll
    [ manageDocks
     ,className  =? "Steam"              --> doFloat
     ,className  =? "Pavucontrol"        --> doFloat
--     ,className  =? "Picture in picture" --> doFloat
--     ,className  =? "Freetube"           --> doFloat
--
     ,title      =? "Media viewer"       --> doFloat -- telegram destop image viwer
      
     ,isDialog                           --> doCenterFloat
     ,className  =? "VirtualBox Manager" --> doFloat
     ,className  =? "Gimp"               --> doFloat
     ,resource   =? "Dialog"             --> doFloat]

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Event handling

myEventHook = mempty

 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Status bars and logging for StdinReader 

_topXmobarPP h = xmobarPP {
    ppCurrent = xmobarColor "#50fa7b" "" . wrap "[" "]"
    , ppVisible = xmobarColor "#bd93f9" "" . wrap "" ""
    , ppHidden = xmobarColor "#f1fa8c" "" . wrap "" ""
    , ppHiddenNoWindows = xmobarColor "#c792ea" ""
    , ppSep = "<fc=#ffffff> | </fc>" 
    , ppTitle = xmobarColor "#8be9fd" "" . shorten 60
    , ppLayout = xmobarColor "#ff79c6" ""
    , ppOutput = hPutStrLn h
    --, ppExtras  = [windowCount]
    , ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]}
    

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Startup hook
myStartupHook = do
          spawnOnce "/bin/ls -d -1 '/home/obxd/Pictures/dark_wallpepers'/* | shuf -n 1 | xargs -I % xwallpaper --maximize '%' " 
          spawnOnce "while true; do /bin/ls -d -1 '/home/obxd/Pictures/dark_wallpepers'/* | shuf -n 1 | xargs -I % xwallpaper --maximize '%'; sleep 10m; done "
          spawnOnce "picom --experimental-backends &"
          spawnOnce "udiskie -t &"
          spawnOnce "nm-applet &"
          --spawnOnce "trayer --edge top --align right --widthtype request --padding 6 --SetDockType true --SetPartialStrut true --expand true --monitor 1 --transparent true --alpha 0 --tint 0x282c34  --height 22 &"
          spawnOnce "trayer --edge top --align right --SetDockType true --SetPartialStrut true  --expand true --width 15 --transparent true --alpha 0 --tint 0x282c34 --height 26 --monitor 1 &"


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
main :: IO ()
main = do 
  _topXmobar <- spawnPipe "xmobar /home/obxd/.config/xmobar/xmobar.config"

  xmonad $ docks def
     {
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        focusedBorderColor = myFocusedBorderColor,
        keys               = myKeys,
        layoutHook         = spacingRaw False (Border 0 6 0 6) True (Border 6 0 6 0) True $ smartBorders $ myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = dynamicLogWithPP $ _topXmobarPP _topXmobar,
        startupHook        = myStartupHook
    }
 
