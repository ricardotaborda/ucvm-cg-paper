
clear

   OUTPUT=covered-areas
 PSOUTPUT=${OUTPUT}.ps
PDFOUTPUT=${OUTPUT}.pdf

MYCOLOR=green@90
MYFONT=6p,Helvetica-Bold
MYBOXLINE=0.5p,0/80/30

# Set GMT constants
# ------------------------------------------------------------------------------

gmt gmtset FONT_LABEL               = 8p,Helvetica
gmt gmtset FONT_ANNOT_PRIMARY       = 8p,Helvetica

# gmt gmtset MAP_FRAME_PEN            = 0.75p,black
# gmt gmtset MAP_FRAME_WIDTH          = 0.75p
# gmt gmtset MAP_TICK_PEN_PRIMARY     = 0.75p
# gmt gmtset MAP_GRID_PEN_PRIMARY     = 0.75p
# gmt gmtset MAP_TICK_PEN_PRIMARY     = 0.75p
# gmt gmtset MAP_TICK_LENGTH_PRIMARY  = 6p/3p
# gmt gmtset MAP_LABEL_OFFSET         = 8p
# gmt gmtset MAP_ANNOT_OFFSET_PRIMARY = 5p

# Basemap and coast line
# ------------------------------------------------------------------------------

gmt psbasemap -JM4i -Rd-127/-111/30/43.5 -Xc -Yc -B2/1WSne -V -P -K > ${PSOUTPUT}
# gmt psbasemap -JB-119/30/30/42/4i -Rd-127/-111/30/42 -Xc -Yc -B2/1WSne -V -P -K > ${PSOUTPUT}
# gmt psbasemap -JPoly/4i -Rd-127/-111/30/42 -Xc -Yc -B2/1WSne -V -P -K > ${PSOUTPUT}
# gmt psbasemap -JT-119/36/4i -Rd-127/-111/30/42 -Xc -Yc -B2/1WSne -V -P -K > ${PSOUTPUT}

gmt pscoast -R -J -Slightblue -G200 -Df -Wthinnest -Na/thinnest -A300/0/4 -B -V -P -K -O >> ${PSOUTPUT}

# CenCalVM Box
# ------------------------------------------------------------------------------

gmt psxy -R -J -G${MYCOLOR} -W${MYBOXLINE} -A -K -O >> ${PSOUTPUT} << END
-126.353173	39.680558
-123.273199	41.484869
-118.944514	36.702176
-121.930857	35.009018
END

gmt pstext -R -J -Dj0.1c -F+f+a+j -K -O >> ${PSOUTPUT} << END
-126.353173	39.680558 ${MYFONT} 38 TL CenCal
END

# Lin-Thurber
# ------------------------------------------------------------------------------

gmt psxy -R -J -G${MYCOLOR} -W${MYBOXLINE} -A -K -O >> ${PSOUTPUT} << END
-126.9210 39.8816
-121.4117 43.0597
-112.8281 33.4362
-118.1781 30.2581
END

gmt pstext -R -J -Dj0.1c -F+f+a+j -K -O >> ${PSOUTPUT} << END
-121.4117 43.0597 ${MYFONT} 38 TR Lin-Thurber
END

# GTL Box
# ------------------------------------------------------------------------------

gmt psxy -R -J -G${MYCOLOR} -W${MYBOXLINE} -A -K -O >> ${PSOUTPUT} << END
-122.5410 30.7046
-112.9958 30.7046
-112.9958 38.5460
-122.5410 38.5460
END

gmt pstext -R -J -Dj0.1c -F+f+j -K -O >> ${PSOUTPUT} << END
-122.54100372309281 38.545964 ${MYFONT} TL Ely-GTL
END

# CVM-H (LR) Box
# ------------------------------------------------------------------------------

gmt psxy -R -J -G${MYCOLOR} -W${MYBOXLINE} -A -K -O >> ${PSOUTPUT} << END
-120.8620 30.9564
-113.3329 30.9564
-113.3329 36.6129
-120.8620 36.6129
END

gmt pstext -R -J -Dj0.1c -F+f+j -K -O >> ${PSOUTPUT} << END
-120.8620 30.9564 ${MYFONT} BL CVM-H (LR)
END

# Carl Tape SoCal
# ------------------------------------------------------------------------------

gmt psxy -R -J -G${MYCOLOR} -W${MYBOXLINE} -A -K -O >> ${PSOUTPUT} << END
-121.8549 36.7301
-121.5939 32.1919
-114.8286 32.2616
-114.7137 36.8027
END

gmt pstext -R -J -Dj0.1c -F+f+j -K -O >> ${PSOUTPUT} << END
-114.8286 32.2616 ${MYFONT} BR Tape
END

# CVM-S4.26 / CVM-S5 Box
# ------------------------------------------------------------------------------

gmt psxy -R -J -G${MYCOLOR} -W${MYBOXLINE} -A -K -O >> ${PSOUTPUT} << END
-116.0000 30.4499
-122.3000 34.7835
-118.9475 38.3035
-112.5182 33.7819
END

gmt pstext -R -J -Dj0.1c -F+f+a+j -K -O >> ${PSOUTPUT} << END
# -122.3000 34.7835 ${MYFONT} 52 TL CVM-S4.26
# -118.9475 38.3035 ${MYFONT} 52 TR CVM-S5
-118.9475 38.3035 ${MYFONT} 52 TR CVM-S4.26
-118.6975 38.1235 ${MYFONT} 52 TR CVM-S5
END

# Wasatch Box
# ------------------------------------------------------------------------------

gmt psxy -R -J -G${MYCOLOR} -W${MYBOXLINE} -A -K -O >> ${PSOUTPUT} << END
-111.1666 39.6667
-111.1666 41.7500
-113.0833 41.7500
-113.0833 39.6667
END

gmt pstext -R -J -Dj0.1c -F+f+j -O >> ${PSOUTPUT} << END
-113.0833 39.6667 ${MYFONT} BL WFCVM
END

# Convert to PDF and move to Raw PDFs directory
# ------------------------------------------------------------------------------

gmt ps2raster ${PSOUTPUT} -Tf -A20p
mv ${PDFOUTPUT} ../pdf/
rm ${PSOUTPUT}
rm gmt.conf gmt.history

open -a Adobe\ Acrobat\ Pro.app ../pdf/${PDFOUTPUT}

