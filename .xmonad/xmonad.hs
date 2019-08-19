import XMonad
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import XMonad.Hooks.ManageDocks
import Graphics.X11.ExtraTypes.XF86
import XMonad.Actions.CycleWS
import System.Exit
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run(spawnPipe)
import XMonad.Layout.NoBorders
import System.IO

main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ defaultConfig {
    workspaces = myWorkspaces
  , layoutHook = myLayoutHook
  , manageHook = manageDocks <+> manageHook defaultConfig
  , handleEventHook = handleEventHook defaultConfig <+> docksEventHook
  , logHook = dynamicLogWithPP xmobarPP
              { ppOutput = hPutStrLn xmproc }
  , modMask = mod4Mask
  , terminal = myTerminal
  , keys = myKeys
  }

myTerminal :: String
myTerminal = "gnome-terminal"

myLayoutHook = smartBorders $ avoidStruts  $  layoutHook defaultConfig

myWorkspaces :: [String]
myWorkspaces =
  [ "1", "2", "3", "4", "5", "6", "7"]

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- launch a terminal
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)

    -- launch dmenu
    , ((modm,               xK_p     ), spawn "rofi -show run")

    -- launch gmrun
    , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")

    -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)

     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)

    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ((modm,               xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

--    , ((modm .|. shiftMask, xK_u), captureWorkspacesWhen defaultPredicate defaultHook horizontally)

    -- toggle the status bar gap (used with avoidStruts from Hooks.ManageDocks)
    -- , ((modm , xK_b ), sendMessage ToggleStruts)

    -- Quit Xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- lock screen
    , ((modm .|. shiftMask, xK_l     ),  spawn "gnome-screensaver-command -l")

    -- Restart xmonad
    , ((modm              , xK_q     ), restart "xmonad" True)

    -- multimedia keys

    , ((0, xF86XK_AudioLowerVolume   ), spawn "amixer set Master 2-")
    , ((0, xF86XK_AudioRaiseVolume   ), spawn "amixer set Master 2+")
    , ((0, xF86XK_AudioMute          ), spawn "amixer set Master toggle")

    , ((0, xF86XK_MonBrightnessUp ), spawn "xbacklight -inc 5")
    , ((0, xF86XK_MonBrightnessDown ), spawn "xbacklight -dec 5")

    -- move focus between screens
     , ((modm .|. controlMask, xK_Right), prevScreen)
     , ((modm .|. controlMask, xK_Left),  nextScreen)
     , ((modm .|. controlMask, xK_o),  shiftNextScreen)
     ]
    ++

      --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modMask, button1), (\w -> focus w >> mouseMoveWindow w))

    -- mod-button2, Raise the window to the top of the stack
    , ((modMask, button2), (\w -> focus w >> windows W.swapMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modMask, button3), (\w -> focus w >> mouseResizeWindow w))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]
