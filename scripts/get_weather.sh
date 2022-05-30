#!/bin/bash
curl wttr.in/${1:-Köln}\?lang=de\&format="+%c+%t+%o" --silent
