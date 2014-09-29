#!/bin/bash

ps=crustal-box-material.ps

latitude=32
longitude=-118
altitude=160.0
tilt=60
azimuth=10
twist=0
Width=30.0
Height=25.0

PROJ=-JG$longitude/$latitude/$altitude/$azimuth/$tilt/$twist/$Width/$Height/4i

gmt pscoast -Rg $PROJ -B5g2,- -Glightbrown -Slightblue -W -Ia/blue -Dh -Na -Y5i -P -K > $ps
gmt psxy ch-box.txt -R -J -Wthin,black -K -O >> $ps

latitude=34
longitude=-118
altitude=350
tilt=0
azimuth=0
twist=0
Width=0
Height=0

PROJ=-JG$longitude/$latitude/$altitude/$azimuth/$tilt/$twist/$Width/$Height/4i
# PROJ=-JG$longitude/$latitude/45/4i

gmt pscoast -R $PROJ -B10g10 -Glightbrown -Slightblue -W0.5p -Dh -N1/0.5p -N2/0.25p -A300/0/4 -Y-4.5i -K -O >> $ps
gmt psxy ch-box.txt -R -J -Gblack@90 -Wthin,black -O >> $ps

gmt ps2raster ${ps} -Tf -A20p

rm $ps

open -a Adobe\ Acrobat\ Pro.app crustal-box-material.pdf
