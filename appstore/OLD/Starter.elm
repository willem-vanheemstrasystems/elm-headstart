module Starter where
{-| Game implemented in Elm, using plain HTML and CSS for rendering.
This application is broken up into four distinct parts:
  1. Model  - a full definition of the application's state
  2. Update - a way to step the application state forward
  3. View   - a way to visualise our application state with HTML
  4. Inputs - the signals necessary to manage events
  
This clean division of concerns is a core part of Elm. You can read more about
this in the Pong tutorial: http://elm-lang.org/blog/Pong.elm

This program is not particularly large, so definitely see the following
document for notes on structuring more complex GUIs with Elm:
http://elm-lang.org/learn/Architecture.elm
-}

import Html exposing (..)
import Html.Attributes exposing (style, class, id)
import Html.Events exposing (onClick)


-- MODEL

-- The full application state of our app.
type alias Model = Float


-- UPDATE

-- A description of the kinds of actions that can be performed on the model of
-- our application. See the following post for more info on this pattern and
-- some alternatives: http://elm-lang.org/learn/Architecture.elm

type Action 
    = NoOp
    | Start

-- How we update our Model on a given Action
update : Action -> Model -> Model
update action model =
  case action of
    NoOp -> model
    Start -> model

-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  div 
    [ id "starter"
    , class "starter-wrapper"
    , style [ ("visibility", "visible")
            , ("border", "1px solid red")
            , ("text-align", "center")
            ]
    ]
    [ button [ onClick address Start ] [ text "Start" ]
    ]



countStyle : Attribute
countStyle =
  style
    [ ("font-size", "20px")
    , ("font-family", "monospace")
    , ("display", "inline-block")
    , ("width", "50px")
    , ("text-align", "center")
    ]