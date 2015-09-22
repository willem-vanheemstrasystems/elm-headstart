module BUNDLE683682163861286312 where

import APP69fe31e2e8ac41d7bb1cc7aace3eb683 exposing(..)
import APPb34a8d71d12642c787cbddb242ea0c9c exposing(..)
import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Mouse
import Signal exposing ((<~))
import Window

-- Import reset events from JS
port reset : Signal ()


-- Events can either be mouse clicks or reset events
events : Signal (Maybe (Int,Int))
events =
  Signal.merge
    (Just <~ Signal.sampleOn Mouse.clicks Mouse.position)
    (always Nothing <~ reset)


-- Keep a list of stamps, resetting when appropriate
clickLocations : Signal (List (Int,Int))
clickLocations =
  let update event locations =
    case event of
      Just loc -> loc :: locations
      Nothing  -> []
  in
      Signal.foldp update [] events


-- Show the stamp list on screen
scene : (Int, Int) -> List (Int, Int) -> Element
scene (w,h) locs =
  let drawPentagon (x,y) =
    ngon 5 20
    |> filled (hsla (toFloat x) 1 0.5 0.7)
    |> move (toFloat x - toFloat w / 2, toFloat h / 2 - toFloat y)
    |> rotate (toFloat x)
  in
    layers
      [ collage w h (List.map drawPentagon locs)
      , show "APP69fe..."
      ]


main =
  Signal.map2 scene Window.dimensions clickLocations


-- Export the number of stamps
port count : Signal Int
port count =
  Signal.map List.length clickLocations