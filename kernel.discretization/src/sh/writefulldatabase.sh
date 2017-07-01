#!/bin/bash
for f in Database.*csv; do tail -10 $f >>tmp;printf '\n'>>tmp;head -1 $f >header.txt; done
cat header.txt >> Full.Database.
grep -v DataPath tmp >> Full.Database.
rm header.txt
rm tmp
