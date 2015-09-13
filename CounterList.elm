import Counter
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import StartApp


main = 
  StartApp.start
    { model = init
    , update = update
    , view = view
    }


-- MODEL

type alias Model = 
  { counters : List ( ID, Counter.Model )
  , nextID : ID
  }

type alias ID = Int


init : Model
init =
  { counters = []
  , nextID = 0
  }


-- UPDATE

type Action
  = Insert
  | Remove
  | Modify ID Counter.Action


update : Action -> Model -> Model
update action model = 
  case action of
    Insert ->
      let newCounter = ( model.nextID, Counter.init 0 )
          newCounters = model.counters ++ [ newCounter ]
      in
          { model |
              counters <- newCounters,
              nextID <- model.nextID + 1
          }
    Remove ->
      { model | counters <- List.drop 1 model.counters }

    Modify id counterAction ->
      let updateCounter (counterID, counterModel) = 
            if counterID == id
                then (counterID, Counter.update counterAction counterModel)
                else (counterID, counterModel)
      in
          { model | counters <- List.map updateCounter model.counters }     