#!/bin/bash

SOURCE_DIR="../password-manager/source"


echo "checking console..."
cppcheck --enable=all --inconclusive --suppress=missingIncludeSystem --output-file=console.txt  $SOURCE_DIR/console

echo "checking ui..."
cppcheck --enable=all --inconclusive --suppress=missingIncludeSystem --output-file=ui.txt  $SOURCE_DIR/ui


