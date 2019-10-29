#!/bin/bash

rm -rf build
mkdir build

# compile ink to javascript
./lib/inklecate -o build/story.json src/story.ink
tr -cd '[:print:]' < build/story.json > build/storyTrimmed.json # clean unprintable characters

{ echo -n "const storyContent = "; cat build/storyTrimmed.json; } > build/story.js

mkdir -p public

cp lib/ink.js public
cp src/main.js public
cp src/index.html public
cp build/story.js public

rm -rf build
