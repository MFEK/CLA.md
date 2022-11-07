#!/bin/bash
TITLE="Modular Font Editor K Foundation Inc. (d/b/a MFEK Foundation Inc.)<br/>Individual Contributor License Agreement<br/>$(date +%Y/%m/%d)"
cat << EOF
---
title: $TITLE
output:
  prettydoc::html_pretty:
    theme: cayman
    highlight: github
---
EOF
