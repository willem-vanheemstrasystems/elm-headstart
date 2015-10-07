module Style (dropzone, dropzone_previews, font, background, widget) where

import Html exposing (..)
import Material exposing (..)


-- uses Material

dropzone : List (String, String)
dropzone =
    Material.dropzone


dropzone_previews : List (String, String)
dropzone_previews =
    Material.dropzone_previews


-- small reusable CSS properties

font : List (String, String)
font =
    Material.font


background : List (String, String)
background =
    Material.background


widget : List (String, String)
widget = 
  Material.widget

