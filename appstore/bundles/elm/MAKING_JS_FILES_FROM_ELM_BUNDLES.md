To make a js file (e.g. BUNDLE683682163861286312.js) that contains all compiled elm code from a bundle (e.g. BUNDLE683682163861286312.elm) in the js directory (../js/) run the following command from within this directory:

  elm-make BUNDLE683682163861286312.elm  --output ../js/BUNDLE683682163861286312.js

or for all elm files in one go:

  elm-make *.elm --output ../js/*.js

Note: A bundle can import elm modules (e.g. ../../apps/elm/APP69fe31e2e8ac41d7bb1cc7aace3eb683.elm), like so, at the start of e.g. BUNDLE683682163861286312.elm:

  module BUNDLE683682163861286312 where
  import APP69fe31e2e8ac41d7bb1cc7aace3eb683 exposing(..)


Hence, a bundle comprises a collection (i.e. 'bundle') of app modules.

Referencing a js file, that is compiled from a bundle elm file, in a html page:

  <script src="bundles/js/BUNDLE683682163861286312.js"></script>

 This will thus pull in all logic of the bundle and its imported apps. The shared Elm code is in there once and all app modules can be individually referred to in the html page as follows:

  <div id="APP69fe31e2e8ac41d7bb1cc7aace3eb683"></div>

  var divAPP69fe31e2e8ac41d7bb1cc7aace3eb683 = document.getElementById('APP69fe31e2e8ac41d7bb1cc7aace3eb683');
  
  var APP69fe31e2e8ac41d7bb1cc7aace3eb683 = Elm.embed(Elm.APP69fe31e2e8ac41d7bb1cc7aace3eb683, divAPP69fe31e2e8ac41d7bb1cc7aace3eb683, { reset:[] });