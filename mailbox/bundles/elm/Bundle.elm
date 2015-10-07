module Bundle where

-- HTML

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

-- APP

import AppCounter exposing (update, view)

-- TASK

import Task exposing (Task)

-- STYLE

import Style exposing (dropzone, dropzone_previews, font, background, widget)

-- VIEW

view : Signal.Address String -> String -> Html
view address greeting =
  container address greeting


-- DOM

container : Signal.Address String -> String -> Html
container address greeting =
  div [ class "container gutter" ]
    [ row address greeting
    ]


row : Signal.Address String -> String -> Html
row address greeting =
  div [ class "row" ]
    [ column address greeting
    ]


column : Signal.Address String -> String -> Html
column address greeting =
  div [ class "col-sm-1" ]
    [  inner address greeting
    ]


inner : Signal.Address String -> String -> Html
inner address greeting = 
  div [ class "inner app phone no-placeholder",
        style widget
      ]
    [ elClickable address
    , elOutput greeting
    , elDropzone greeting
    ]


elClickable : Signal.Address String -> Html
elClickable address =
  div [ onClick address "Hello" ]
    [ text "Click for English" ]


elOutput : String -> Html
elOutput greeting =
  p [ style (font ++ background) ]
    [ text greeting ]


elDropzone : String -> Html
elDropzone greeting =
  p [ class Style.dropzone ]
    [ text greeting ]


-- MAILBOX

inbox : Signal.Mailbox String
inbox = 
  Signal.mailbox "Waiting..."


-- TASK

--contentTasks : Signal (Task x ())
--contentTasks =
--  Signal.map (view inbox.address) messages


-- PORT

--port updateContent : Task x ()
--port updateContent =
--  Signal.send inbox.address "hello!"


-- WIRE THE APP TOGETHER!

main : Signal Html
main =
  Signal.map (view inbox.address) messages


messages : Signal String
messages =
  inbox.signal
