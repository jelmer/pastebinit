#!/bin/sh
teststring="test from pastebinit"

for interpreter in python python3; do
    for pastebin in $(ls pastebin.d/*.conf | sed 's~^pastebin.d/\(.*\)\.conf$~\1~')
    do
        echo "Trying $pastebin ($interpreter)"
        URL=$(echo "$teststring\n$teststring\n$teststring" | $interpreter ./pastebinit -b $pastebin)

        if [ "$pastebin" = "paste.ubuntu.org.cn" ]; then
            out=$(wget -O - -q "$URL" | gzip -d | grep "$teststring")
        else
            out=$(wget -O - -q "$URL" | grep "$teststring")
        fi

        if [ -n "$out" ]; then
            echo "PASS: $pastebin ($URL) ($interpreter)"
        else
            echo "FAIL: $pastebin ($URL) ($interpreter)"
        fi
        echo ""
    done
done
