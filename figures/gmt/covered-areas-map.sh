
clear

   OUTPUT=covered-areas
 PSOUTPUT=${OUTPUT}.ps
PDFOUTPUT=${OUTPUT}.pdf

# Set GMT constants
# ------------------------------------------------------------------------------

gmt gmtset FONT_LABEL               = 12

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

gmt psbasemap -JM4i -Rd-126/-111/30/42 -Xc -Yc -B2/1WSne -V -P -K > ${PSOUTPUT}

gmt pscoast -R -J -K -Slightblue -Glightbrown -Df -Wthinnest -N2/thinnest -B -V -P -K -O >> ${PSOUTPUT}

# CVM-H (LR) Box
# ------------------------------------------------------------------------------

gmt psxy -R -J -Ggreen@80 -Wthinnest -A -K -O >> ${PSOUTPUT} << END
-120.862028056 30.9564963889
-113.332939722 30.9564963889
-113.332939722 36.6129505556
-120.862028056 36.6129505556
END

# GTL Box
# ------------------------------------------------------------------------------

gmt psxy -R -J -Ggreen@80 -Wthinnest -A -O >> ${PSOUTPUT} << END
-122.54100372309281 30.704589
-112.99579687593433 30.704589
-112.99579687593433 38.545964
-122.54100372309281 38.545964
END


# Convert to PDF and move to Raw PDFs directory
# ------------------------------------------------------------------------------

gmt ps2raster ${PSOUTPUT} -Tf -A20p
mv ${PDFOUTPUT} ../raw-pdf/
rm ${PSOUTPUT}
rm gmt.conf gmt.history

open -a Adobe\ Acrobat\ Pro.app ../raw-pdf/${PDFOUTPUT}

