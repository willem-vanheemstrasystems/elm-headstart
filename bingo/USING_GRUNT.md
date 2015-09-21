To compile Bingo.elm into bingo.js, type

grunt elm

If you need to clean up the build artifacts, you can run

grunt clean

Finally, to watch for changes and recompile as necessary, type

grunt watch

You should see the following output as it patiently waits for changes to the .elm files:

Running "watch" task
Waiting...

Make a change to your Bingo.elm file, save it, and the file should get automatically recompiled into bingo.js. Huzzah!