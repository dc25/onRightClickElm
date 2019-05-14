import Browser exposing (sandbox)
import Html as HTML exposing (div, button, text)
import Html.Events as HEV exposing (custom, onClick)
import Json.Decode as Json
import Svg exposing (svg, text_, text, rect, g)
import Svg.Attributes exposing (x, y, height, width, version, style, fontSize, dominantBaseline, fill)
import String exposing (fromInt, fromFloat)

main : Program () Int Msg
main =  Browser.sandbox
       { init = 0
       , view = view
       , update = update}

svgBox = 
    let w = 700
        h = 30

    in svg [ version "1.1"
           , width (fromInt w)
           , height (fromInt h)
           ] 
           [ g [] 
               [ rect [ width (fromInt w)
                      , height (fromInt h) 
                      , fill "grey"
                      , onClick Increment
                      , onRightClick Decrement
                      ] 
                      []
               , text_ [ x "10"
                       , y (fromFloat (h/2))
                       , fontSize (fromInt (h-10))
                       , dominantBaseline "middle"
                       , onClick Increment
                       , onRightClick Decrement
                       ] 
                       [ Svg.text "SVG rectangle with text. Click left  to increment or right to decrement. " 
                       ]
              ]
           ]


view model =
  div []
    [ button [ onRightClick Decrement ] [ HTML.text "click right to decrement" ]
    , div [] [ HTML.text (fromInt model) ] , button [ onClick Increment ] [ HTML.text "click left to increment" ]
    , div [] [ ]
    , svgBox 
    ]

onRightClick : msg -> HTML.Attribute msg
onRightClick msg =
    HEV.custom "contextmenu"
        (Json.succeed
            { message = msg
            , stopPropagation = True
            , preventDefault = True
            }
        )

type Msg = Increment | Decrement


update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1
