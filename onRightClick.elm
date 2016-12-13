import Html exposing (beginnerProgram, div, button, text)
import Html.Events exposing (onClick, onWithOptions)
import Json.Decode as Json

main =
  beginnerProgram { model = 0, view = view, update = update }


view model =
  div []
    [ button [ onRightClick Decrement ] [ text "click right to decrement" ]
    , div [] [ text (toString model) ]
    , button [ onClick Increment ] [ text "click left to increment" ]
    ]

onRightClick message =
  onWithOptions
    "contextmenu"
    { stopPropagation = True
    , preventDefault = True
    }
    (Json.succeed message)

type Msg = Increment | Decrement


update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1
