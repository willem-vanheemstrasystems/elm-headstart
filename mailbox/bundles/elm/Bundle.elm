module Bundle where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


view : Signal.Address String -> String -> Html
view address greeting =
  div [ class "container gutter" ]
    [ div [ class "row" ]
      [ div [ class "col-sm-1" ]
        [ div [ id "1", class "inner app phone no-placeholder" ]
          [ div
              [ onClick address "Hello!" ]
              [ text "Click for English" ],
            p [ ] [ text greeting ]
          ]
        ],
        div [ class "col-sm-1" ]
          [ div [ id "2", class "inner app phone no-placeholder" ]
          [ div
            [ onClick address "Salut!" ]
            [ text "Click for French" ],
            p [ ] [ text greeting ]
          ]
        ]
      ]
    ]


inbox : Signal.Mailbox String
inbox = 
  Signal.mailbox "Waiting..."


main : Signal Html
main =
  Signal.map (view inbox.address) messages


messages : Signal String
messages =
  inbox.signal
