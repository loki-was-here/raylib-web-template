#!/bin/bash
export EMSDK_QUIET=1

if make; then
    cd out && python3 -m http.server 8000
else
    echo Compilation failed.
fi
