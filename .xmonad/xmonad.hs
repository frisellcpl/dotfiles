import System.IO
import Data.Char
import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.Grid
import XMonad.Layout.ThreeColumns
import XMonad.Util.EZConfig(additionalKeys, additionalMouseBindings)
import XMonad.Util.Run(spawnPipe)
import qualified XMonad.StackSet as W

main = do
    xmproc <- spawnPipe statusBar'
    xmonad $ defaultConfig
        { layoutHook = layoutHook'
        , manageHook = manageHook' <+> manageHook defaultConfig
        , logHook = logHook' xmproc
        , borderWidth = 2
        , modMask = modMask'
        , terminal = "urxvt"
        , normalBorderColor = "#091f2e"
        , focusedBorderColor = "#c23127"
        , startupHook = do
            setWMName "LG3D"}
        `additionalKeys` keyBindings'
        `additionalMouseBindings` mouseBindings'

layoutHook' = avoidStruts $ smartBorders $ smartSpacing 5 $ layouts
    where layouts = tiled ||| threecol ||| Full ||| Grid
          tiled = Tall nmaster delta ratio
          threecol = ThreeCol nmaster delta ratio
          nmaster = 1
          ratio = 1/2
          delta = 3/100

manageHook' = composeAll
    [ className =? "Gimp" --> doFloat
    , className =? "MPlayer" --> doFloat
    , className =? "Xmessage" --> doFloat
    , isFullscreen --> doFullFloat
    ]

logHook' xmproc = dynamicLogWithPP xmobarPP
    { ppOutput = hPutStrLn xmproc
    , ppOrder = \(ws:l:t:_) -> [ws, map toLower $ "[" ++ drop 10 l ++ "]", t]
    , ppCurrent = xmobarColor "#FFFFFF" ""
    , ppTitle = xmobarColor "#666666" "" . shorten 50
    , ppSep = " "
    }

keyBindings' =
    [ ((modMask', xK_Left), sendMessage Shrink)
    , ((modMask', xK_Right), sendMessage Expand)
    , ((0, xK_XF86AudioMute), spawn "amixer -q set Master toggle")
    , ((0, xK_XF86AudioRaiseVolume), spawn "amixer -q set Master 5%+")
    , ((0, xK_XF86AudioLowerVolume), spawn "amixer -q set Master 5%-")
    , ((0, xK_XF86MonBrightnessUp), spawn "xbacklight +5")
    , ((0, xK_XF86MonBrightnessDown), spawn "xbacklight -5")
    ]

xK_XF86AudioMute = 0x1008ff12
xK_XF86AudioRaiseVolume = 0x1008ff13
xK_XF86AudioLowerVolume = 0x1008ff11
xK_XF86MonBrightnessUp = 0x1008ff02
xK_XF86MonBrightnessDown = 0x1008ff03

mouseBindings' =
    [ ((modMask' .|. shiftMask, button1), floatAndResize)
    ]

modMask' = mod4Mask

floatAndResize w = focus w >> mouseResizeWindow w >> windows W.shiftMaster

statusBar' = "xmobar"
