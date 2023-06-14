module Polybar where

import XMonad
import PolybarThemes.Hack as Hack
import qualified Codec.Binary.UTF8.String as UTF8
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.FadeInactive
import qualified DBus as D
import qualified DBus.Client as D

mkDbusClient :: IO D.Client
mkDbusClient = do
  dbus <- D.connectSession
  D.requestName dbus (D.busName_ "org.xmonad.log") opts
  return dbus
 where
  opts = [D.nameAllowReplacement, D.nameReplaceExisting, D.nameDoNotQueue]

dbusOutput :: D.Client -> String -> IO ()
dbusOutput dbus str =
  let opath  = D.objectPath_ "/org/xmonad/Log"
      iname  = D.interfaceName_ "org.xmonad.Log"
      mname  = D.memberName_ "Update"
      signal = D.signal opath iname mname
      body   = [D.toVariant $ UTF8.decodeString str]
  in  D.emit dbus $ signal { D.signalBody = body }
  
polybarHook :: D.Client -> PP
polybarHook dbus =
  let wrapper c s | s /= "NSP" = wrap ("%{F" <> c <> "} ") " %{F-}" s
                  | otherwise  = mempty
  in  def { ppOutput          = dbusOutput dbus
          , ppCurrent         = wrapper Hack.green
          , ppVisible         = wrapper Hack.foreground
          , ppUrgent          = wrapper Hack.yellow
          , ppHidden          = wrapper Hack.red
          , ppHiddenNoWindows = wrapper Hack.red
          , ppTitle           = wrapper Hack.foreground . shorten 90
          }

myPolybarLogHook dbus = myLogHook <+> dynamicLogWithPP (polybarHook dbus)
    where
        myLogHook = fadeInactiveLogHook 0.9
