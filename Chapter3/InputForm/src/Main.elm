module Main exposing (Model)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }



-- MODEL


type alias Model =
    { input : String
    , memos : List String
    }


init : Model
init =
    { input = ""
    , memos = []
    }



-- UPDATE


type Msg
    = Input String
    | Submit
    | Delete Int


update : Msg -> Model -> Model
update msg model =
    case msg of
        Input input ->
            { model | input = input }

        Submit ->
            { model
                | input = ""
                , memos = model.input :: model.memos
            }

        Delete n ->
            { model | memos = List.take n model.memos ++ List.drop (n + 1) model.memos }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ Html.form [ onSubmit Submit ]
            [ input [ value model.input, onInput Input ] []
            , button
                [ disabled (String.isEmpty (String.trim model.input)) ]
                [ text "submit" ]
            ]
        , ul [] (List.map viewMemo model.memos)
        ]


viewMemo : String -> Html Msg
viewMemo memo =
    li []
        [ text memo
        , button [ onClick (Delete 2) ] []
        ]
