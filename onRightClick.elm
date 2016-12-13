import Html exposing (div, button, text)
import Html.App exposing (beginnerProgram)
import Html.Events exposing (onClick, onWithOptions)
import Json.Decode as Json


main =
  beginnerProgram { model = 0, view = view, update = update }


view model =
  div []
    [ button [ onRightClick Decrement ] [ text "-" ]
    , div [] [ text (toString model) ]
    , button [ onClick Increment ] [ text "+" ]
    ]

onRightClick message =
  onWithOptions
    "oncontextmenu"
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
