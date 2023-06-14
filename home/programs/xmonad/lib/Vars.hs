module Vars where

import Colors
import XMonad
import XMonad.Prompt
import XMonad.Actions.DynamicProjects

myTerminal :: String
myTerminal = "kitty"

promptConfig :: XPConfig
promptConfig = def {
    font = "-adobe-helvetica-medium-r-normal-*-*-100-*-*-*-*-*-*",
    bgColor = color1,
    fgColor = "#FFFFFF",
    bgHLight = color2,
    fgHLight = "#000000",
    borderColor = color2,
    promptBorderWidth = 2
}

projects :: [Project]
projects = [
    Project { projectName = "scratch"
            , projectDirectory = "~/"
            , projectStartHook = Nothing
    }, Project { projectName = "web"
            , projectDirectory = "~/Downloads/"
            , projectStartHook = Nothing
    }, Project { projectName = "gaming"
            , projectDirectory = "~/"
            , projectStartHook = Nothing
    }, Project { projectName = "social"
            , projectDirectory = "~/"
            , projectStartHook = Nothing
    }, Project { projectName = "dev"
            , projectDirectory = "~/Documents/git"
            , projectStartHook = Nothing
    }
    ]

names :: [WorkspaceId]
names = map projectName projects
