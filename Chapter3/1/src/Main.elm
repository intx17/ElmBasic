module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (href)


main : Html msg
main =
    div [] [ header, content ]


header : Html msg
header =
    h1 [] [ text "Userful Links" ]


content : Html msg
content =
    ul []
        [ linkItem "https://elm-lang.org" "Homepage"
        , linkItem "https://package.elm-lang.org" "Packages"
        , linkItem "https://ellie-app.com" "Packages"
        ]


linkItem : String -> String -> Html msg
linkItem url text_ =
    li [] [ a [ href url ] [ text text_ ] ]
