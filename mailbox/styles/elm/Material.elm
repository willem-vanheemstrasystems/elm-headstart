module Material (dropzone, dropzone_previews, font, background, widget) where

-- See https://www.google.com/design/spec/material-design/introduction.html

import Html exposing (..)

-- class dropzone
dropzone : List (String, String)
dropzone =
    [ ("-webkit-box-sizing", "border-box")
    , ("-moz-box-sizing", "border-box")
    , ("box-sizing", "border-box")
    , ("position", "relative")
    , ("border", "1px solid rgba(0,0,0,0.08)")
    , ("background", "rgba(0,0,0,0.02)")
    , ("padding", "1em")
    ]


dropzone_previews : List (String, String)
dropzone_previews =
    [ ("-webkit-box-sizing", "border-box")
    , ("-moz-box-sizing", "border-box")
    , ("box-sizing", "border-box")
    ]


-- small reusable CSS properties
font : List (String, String)
font =
    [ ("font-family", "futura, sans-serif")
    , ("color", "rgb(42, 42, 42)")
    , ("font-size", "2em")
    ]


background : List (String, String)
background =
    [ ("background-color", "rgb(245, 245, 245)")
    ]


widget : List (String, String)
widget = 
  [ ("-moz-border-radius", "5px")
  , ("-webkit-border-radius", "5px")
  , ("border-radius", "5px")
  ]