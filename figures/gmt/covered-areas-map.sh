
clear

   OUTPUT=covered-areas
 PSOUTPUT=${OUTPUT}.ps
PDFOUTPUT=${OUTPUT}.pdf

# Set GMT constants
# ------------------------------------------------------------------------------

gmt gmtset FONT_LABEL               = 12p,Helvetica
gmt gmtset FONT_ANNOT_PRIMARY       = 10p,Helvetica

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

gmt psbasemap -JM4i -Rd-127/-111/30/42 -Xc -Yc -B2/1WSne -V -P -K > ${PSOUTPUT}
# gmt psbasemap -JB-119/30/30/42/4i -Rd-127/-111/30/42 -Xc -Yc -B2/1WSne -V -P -K > ${PSOUTPUT}
# gmt psbasemap -JPoly/4i -Rd-127/-111/30/42 -Xc -Yc -B2/1WSne -V -P -K > ${PSOUTPUT}
# gmt psbasemap -JT-119/36/4i -Rd-127/-111/30/42 -Xc -Yc -B2/1WSne -V -P -K > ${PSOUTPUT}

gmt pscoast -R -J -Slightblue -G200 -Df -Wthinnest -Na/thinnest -B -V -P -K -O >> ${PSOUTPUT}

# CenCalVM Box
# ------------------------------------------------------------------------------

gmt psxy -R -J -Ggreen@80 -Wthinnest -A -K -O >> ${PSOUTPUT} << END
-126.353173	39.680558
-123.273199	41.484869
-118.944514	36.702176
-121.930857	35.009018
END

gmt pstext -R -J -Dj0.1c -F+f+a+j -K -O >> ${PSOUTPUT} << END
-126.353173	39.680558 7p,Helvetica-Bold 38 TL CenCal
END

# GTL Box
# ------------------------------------------------------------------------------

gmt psxy -R -J -Ggreen@80 -Wthinnest -A -K -O >> ${PSOUTPUT} << END
-122.54100372309281 30.704589
-112.99579687593433 30.704589
-112.99579687593433 38.545964
-122.54100372309281 38.545964
END

gmt pstext -R -J -Dj0.1c -F+f+j -K -O >> ${PSOUTPUT} << END
-122.54100372309281 38.545964 7p,Helvetica-Bold TL GTL
END

# CVM-H (LR) Box
# ------------------------------------------------------------------------------

gmt psxy -R -J -Ggreen@80 -Wthinnest -A -K -O >> ${PSOUTPUT} << END
-120.862028056 30.9564963889
-113.332939722 30.9564963889
-113.332939722 36.6129505556
-120.862028056 36.6129505556
END

gmt pstext -R -J -Dj0.1c -F+f+j -K -O >> ${PSOUTPUT} << END
-120.862028056 36.6129505556 7p,Helvetica-Bold TL CVM-H
END

# Wasatch Box
# ------------------------------------------------------------------------------

gmt psxy -R -J -Ggreen@80 -Wthinnest -A -K -O >> ${PSOUTPUT} << END
-111.166666667 39.6666666667
-111.166666667 41.7500000000
-113.083333333 41.7500000000
-113.083333333 39.6666666667
END

gmt pstext -R -J -Dj0.1c -F+f+j -O >> ${PSOUTPUT} << END
-113.083333333 39.6666666667 7p,Helvetica-Bold BL WFCVM
END

# Convert to PDF and move to Raw PDFs directory
# ------------------------------------------------------------------------------

gmt ps2raster ${PSOUTPUT} -Tf -A20p
mv ${PDFOUTPUT} ../raw-pdf/
rm ${PSOUTPUT}
rm gmt.conf gmt.history

open -a Adobe\ Acrobat\ Pro.app ../raw-pdf/${PDFOUTPUT}

