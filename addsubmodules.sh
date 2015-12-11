
#!/bin/sh
# Created by Lander Brandt
# This script will take all existing cloned subprojects and add them as
# proper git submodules
# To use, run this script from within the main project's root directory

set -e


for submodule in `git ls-files --stage | grep 160000 | cut -f 2`; do
    url=`(cd $submodule && git config --get remote.origin.url)`
    echo $PWD
    git rm --cached $submodule
    git submodule add $url $submodule
    echo $url
    echo $submodule
done
