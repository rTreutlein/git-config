import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Scratchpad
--import XMonad.Actions.Volume
--import XMonad.Config.Gnome
import XMonad.StackSet as S
import XMonad.Actions.SpawnOn
import System.IO
--import System.Exit

main = do
    xmproc <- spawnPipe "xmobar"

    xmonad $ def
        { XMonad.manageHook = myManageHooks
        , XMonad.layoutHook = avoidStruts $ layoutHook def
        , XMonad.handleEventHook = docksEventHook <+> handleEventHook def
        , XMonad.startupHook = myStartupHook
        , XMonad.logHook    = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , XMonad.modMask    = myModMask
        , XMonad.workspaces = workspaceNames
        , XMonad.terminal   = myTerminal
        }`additionalKeys`
        [ ((myModMask,xK_grave) , scratchpadSpawnActionTerminal myTerminal)
      --, ((0,xK_F2), toggleMute >> return ())
      --, ((0,xK_F3), setMute False >> lowerVolume 4 >> return ())
      --, ((0,xK_F4), setMute False >> raiseVolume 4 >> return ())
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0,           xK_Print), spawn "scrot")
        , ((myModMask .|. shiftMask, xK_Return), spawn "gnome-terminal")
        ]

myModMask = mod4Mask

myTerminal = "urxvt"

myManageHooks = manageDocks
                <+> manageScratchPad
                <+> manageHook def

myStartupHook = do
    spawnOn "Term" "gnome-terminal"
    spawnOn "Web" "chromium"
    spawnOn "Term" "stalonetray"
    spawnOn "Term" "feh --bg-scale /usr/share/backgrounds/gnome/Terraform-green.jpg"

manageScratchPad = scratchpadManageHook (S.RationalRect l t w h)
  where
    h = 0.3     -- terminal height, 30%
    w = 1       -- terminal width, 100%
    t = 0       -- distance from top edge,  0%
    l = 1 - w   -- distance from left edge, 0%

workspaceNames = [ "Term"
                 , "Web"
                 , "Util"
                 , "4"
                 , "5"
                 , "6"
                 , "7"
                 , "8"
                 , "NSP"
                 ]

--Lock Scree doesnt' work immidiatelly enters again (tested on ubuntu)
--((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock; xset dpms force off")

--default keybindins for experimetation
--, ((mod4Mask,        xK_p), spawn "dmenu_run -i")
--, ((mod4Mask .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
