import Html as HTML exposing (beginnerProgram, div, button, text)
import Html.Events exposing (onClick, onWithOptions)
import Json.Decode as Json
import Svg exposing (svg, text_, text, rect, g)
import Svg.Attributes exposing (x, y, height, width, version, style, fontSize, dominantBaseline, fill)

main =
  beginnerProgram { model = 0, view = view, update = update }

svgBox model = 
    let w = 600
        h = 40

    in svg [ version "1.1"
           , width (toString w)
           , height (toString h)
           ] 
           [ g [] 
               [ rect [ width (toString w)
                      , height (toString h) 
                      , fill "grey"
                      , onClick Increment
                      , onRightClick Decrement
                      ] 
                      []
               , text_ [ x "10"
                       , y (toString (h/2))
                       , fontSize (toString (h-10))
                       , dominantBaseline "middle"
                       , onClick Increment
                       , onRightClick Decrement
                       ] 
                       [ Svg.text "click left or right to decrement or increment" 
                       ]
              ]
           ]


view model =
  div []
    [ button [ onRightClick Decrement ] [ HTML.text "click right to decrement" ]
    , div [] [ HTML.text (toString model) ] , button [ onClick Increment ] [ HTML.text "click left to increment" ]
    , div [] [ ]
    , svgBox model
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
