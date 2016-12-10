#!/bin/bash
 
# inotifywait-cmd.sh
# Inotifywait watch files and run command
#
# Example:
# inotifywait-cmd.sh test/ 'phpunit --verbose test/ModelReferencesTest.php'
#
# Requires: https://github.com/thekid/inotify-win on windows
#
# author: Gabe LG <gabe@fijiwebdesign.com>
# license: MIT
# 
 
# correct usage instructions
if [ "$#" -ne 2 ]; then
    echo "Usage: 
        $0 path 'command'

 Example:
        $0 test/ 'phpunit --verbose test/ModelReferencesTest.php'

Note: 
        Exit with [Ctr+c]
    "
    exit 1
fi
 
# start inotifywait and eval command when files change
inotifywait -m -r $1 | while read change; do eval $2; done