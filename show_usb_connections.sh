#!/bin/bash
column=7
lsusb | awk -F " " ' { if (NF !=0) print $column ; column ++ } '
