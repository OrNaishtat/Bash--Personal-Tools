#! /bin/bash
read -p "Which process would you like to Seek&Destroy?" UPROC
pgrep $UPROC | xargs kill -9
