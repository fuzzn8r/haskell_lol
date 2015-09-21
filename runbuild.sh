#/bin/bash

# WARNING -- it is ill-advised to run this script outside of the
# home directory of this project. You may have some unwanted files
# or accidentally delete folders from other projects.

# NOTE -- we ought to look into a package called "Cabal" which seems
# to be a build tool for haskell. This script will work in the meantime.

# Clean build and binaries folder
echo "[BUILD] - cleaning build folder"
rm -rf ./build
rm -rf ./bin

# Go into source directory and compile files
pushd .
cd ./src
echo "[BUILD] - compiling source..."
ghc *.hs

# Move build and binary files
echo "[BUILD] - moving build files..."
mkdir ../build
mkdir ../bin
mv *.o ../build
mv *.hi ../build
find . -maxdepth 1 -type f ! -name "*.*" -exec mv -t ../bin/ {} \+

# Return to working directory
popd
echo "[BUILD] - finished"
