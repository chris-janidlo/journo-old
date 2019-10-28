#!/bin/bash

### CLEAN
rm -rf public


### BUILD
mkdir -p public

# compile ink to javascript
./lib/inklecate -o public/story.json src/story.ink
tr -cd '[:print:]' < public/story.json > public/storyTrimmed.json # clean unprintable characters
{ echo -n "const storyContent = "; cat public/storyTrimmed.json | tr -d "[:space:]"; } > public/story.js
rm public/story.json public/storyTrimmed.json

# copy every other file
cp lib/ink.js public
cp src/main.js public
cp src/index.html public
