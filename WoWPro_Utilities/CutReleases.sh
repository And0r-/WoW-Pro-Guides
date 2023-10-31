#!/bin/bash -x 
set -e
WoWPro_Utilities/CutRelease.sh
WoWPro_Utilities/CutRelease.sh --trial
awk 'BEGIN{flag=0}/^# /{flag=flag+1}{if(flag <2) print $0}' < Notes.md > release-notes.md

gh release create `date +"%Y%m%d"` -F release-notes.md "`ls -t *-mainline.zip | head -n 1`" "`ls -t *-vanilla.zip | head -n 1`" "`ls -t *-tbc.zip | head -n 1`" "`ls -t *-wrath.zip | head -n 1`"
