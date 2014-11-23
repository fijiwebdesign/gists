#!/bin/bash
 
#
# inotifywait-execute-php.sh
#
# Example:
# inotifywait-execute-php.sh path/to/project/
#
# Requires: https://github.com/thekid/inotify-win on windows
#
# author: Gabe LG <gabe@fijiwebdesign.com>
# license: MIT
# 
 
# correct usage instructions
if [ "$#" -ne 1 ]; then
    echo "Usage:
        $0 path

 Example:
        $0 path/to/project/

Note:
        Exit with [Ctr+c]
    "
    exit 1
fi
 
path=$1
 
while (true); do
 
    file=$( inotifywait $path | awk '{ print $3 }' )
    
    printf 'File changed: %s\n' "$file"
 
    # execute if php file
    is_php=$( echo $file | grep -P "\.php$" )
    if [ $is_php ]; then
        printf 'Executing PHP file: %s\n' "$file"
        php "$path/$file"
    fi
    
    sleep 1; # breathe 
 
done;
 
# Notes:
# read from stdin
#input=`cat "-"` 
#input=`less <&0`
#input=$( cat )