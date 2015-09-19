How to compile an Elm Project

1) Install the Elm software (see http://elm-lang.org/install)

2) From the root directory, execute the following command:

elm-make Main.elm --output index.html

Alternatively, if you have your own index.html file and want to link to the javascript file:

elm-make Main.elm --output main.js

NOTE: This may require an active Internet connection for downloading required libraries.

NOTE: This assumes there is a file 'Main.elm' in the root directory, that has a 'main' function.