
clear

   OUTPUT=covered-areas
 PSOUTPUT=${OUTPUT}.ps
PDFOUTPUT=${OUTPUT}.pdf

CVMCOLOR=springgreen1@90
CVMCOLORTHICK=springgreen1@80
GTLCOLOR=orange1@90
MYFONT=6p,Helvetica-Bold
CVMBOXLINE=0.5p,green4
CVMBOXLINETHICK=0.7p,green4
GTLBOXLINE=0.5p,darkorange3

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

# gmt psbasemap -JM4i -Rd-127/-111/30/43.5 -Xc -Yc -B2/1WSne -V -P -K > ${PSOUTPUT}

gmt psbasemap -JPoly/4i -Rd-131/-109/27/46.5 -Xc -Yc -B2/2WSne -V -P -K > ${PSOUTPUT}

# gmt psbasemap -JB-119/30/30/42/4i -Rd-127/-111/30/42 -Xc -Yc -B2/1WSne -V -P -K > ${PSOUTPUT}
# gmt psbasemap -JPoly/4i -Rd-127/-111/30/42 -Xc -Yc -B2/1WSne -V -P -K > ${PSOUTPUT}
# gmt psbasemap -JT-119/36/4i -Rd-127/-111/30/42 -Xc -Yc -B2/1WSne -V -P -K > ${PSOUTPUT}

gmt pscoast -R -J -Slightblue -G200 -Df -Wthinnest,steelblue4 -Na/thinnest,white -A300/0/4 -B -V -P -K -O >> ${PSOUTPUT}

# Vs30/DEM Box
# ------------------------------------------------------------------------------

gmt psxy -R -J -G${GTLCOLOR} -W${GTLBOXLINE} -A -K -O >> ${PSOUTPUT} << END
-129.7500 40.7500
-121.0950 45.7772
-109.9632 32.0737
-117.8794 27.8247
END

gmt pstext -R -J -Dj0.1c -F+f+a+j -K -O >> ${PSOUTPUT} << END
-129.7500 40.7500 ${MYFONT} 36 TL Vs30
END

gmt pstext -R -J -Dj0.1c/0.35c -F+f+a+j -K -O >> ${PSOUTPUT} << END
-129.7500 40.7500 ${MYFONT} 36 TL DEM
END

# Ely-GTL Box
# ------------------------------------------------------------------------------

gmt psxy -R -J -G${GTLCOLOR} -W${GTLBOXLINE} -A -K -O >> ${PSOUTPUT} << END
-122.5410 30.7046
-112.9958 30.7046
-112.9958 38.5460
-122.5410 38.5460
END

gmt pstext -R -J -Dj0.08c/0c -F+f+j -K -O >> ${PSOUTPUT} << END
-112.9958 38.5460 ${MYFONT} TL Ely-GTL
END

# CVM-NCI
# ------------------------------------------------------------------------------

gmt psxy -R -J -G${CVMCOLOR} -W${CVMBOXLINE} -A -K -O >> ${PSOUTPUT} << END
-121.700000 35.300000     
-126.000000 41.150000     
-120.957499 43.349444     
-116.931501 37.300656
END

gmt pstext -R -J -Dj0c/0.1c -F+f+a+j -K -O >> ${PSOUTPUT} << END
-126.000000 41.150000 ${MYFONT} 28 BL CVM-NCI
END

# CenCalVM Box
# ------------------------------------------------------------------------------

gmt psxy -R -J -G${CVMCOLOR} -W${CVMBOXLINE} -A -K -O >> ${PSOUTPUT} << END
-126.353173	39.680558
-123.273199	41.484869
-118.944514	36.702176
-121.930857	35.009018
END

gmt pstext -R -J -Dj0.08c -F+f+a+j -K -O >> ${PSOUTPUT} << END
-126.353173	39.680558 ${MYFONT} -54 BL CenCal
END

# Lin-Thurber
# ------------------------------------------------------------------------------

gmt psxy -R -J -G${CVMCOLOR} -W${CVMBOXLINE} -A -K -O >> ${PSOUTPUT} << END
-126.9210 39.8816
-121.4117 43.0597
-112.8281 33.4362
-118.1781 30.2581
END

gmt pstext -R -J -Dj0.08c -F+f+a+j -K -O >> ${PSOUTPUT} << END
-121.4117 43.0597 ${MYFONT} -52 TL Lin-Thurber
END

# CVM-H Box
# ------------------------------------------------------------------------------

gmt psxy -R -J -G${CVMCOLOR} -W${CVMBOXLINE} -A -K -O >> ${PSOUTPUT} << END
-120.8620 30.9564
-113.3329 30.9564
-113.3329 36.6129
-120.8620 36.6129
END

gmt pstext -R -J -Dj0.08c -F+f+a+j -K -O >> ${PSOUTPUT} << END
-120.8620 30.9564 ${MYFONT} 2 BL CVM-H
END

# Carl Tape SoCal
# ------------------------------------------------------------------------------

gmt psxy -R -J -G${CVMCOLOR} -W${CVMBOXLINE} -A -K -O >> ${PSOUTPUT} << END
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

gmt psxy -R -J -G${CVMCOLORTHICK} -W${CVMBOXLINETHICK} -A -K -O >> ${PSOUTPUT} << END
-116.0000 30.4499
-122.3000 34.7835
-118.9475 38.3035
-112.5182 33.7819
END

gmt pstext -R -J -Dj0.08c -F+f+a+j -K -O >> ${PSOUTPUT} << END
-118.9475 38.3035 ${MYFONT} 52 TR CVM-S4.26
END

gmt pstext -R -J -Dj0.08c/0.18c -F+f+a+j -K -O >> ${PSOUTPUT} << END
-118.6975 38.1235 ${MYFONT} 52 TR CVM-S5
END

# CMRG
# ------------------------------------------------------------------------------

gmt psxy -R -J -G${CVMCOLOR} -W${CVMBOXLINE} -A -K -O >> ${PSOUTPUT} << END
-124.500000 40.000000
-124.500000 40.750000
-123.750000 40.750000
-123.750000 40.000000
END

gmt pstext -R -J -Dj0c/0.08c -F+f+a+j -K -O >> ${PSOUTPUT} << END
-124.500000 40.000000 ${MYFONT} -2 TL CMRG
END

# Wasatch Box
# ------------------------------------------------------------------------------

gmt psxy -R -J -G${CVMCOLOR} -W${CVMBOXLINE} -A -K -O >> ${PSOUTPUT} << END
-111.1666 39.6667
-111.1666 41.7500
-113.0833 41.7500
-113.0833 39.6667
END

gmt pstext -R -J -Dj0c/0.08c -F+f+a+j -O >> ${PSOUTPUT} << END
-113.0833 41.7500 ${MYFONT} 5 BL WFCVM
END

# Convert to PDF and move to Raw PDFs directory
# ------------------------------------------------------------------------------

gmt ps2raster ${PSOUTPUT} -Tf -A20p
mv ${PDFOUTPUT} ../pdf/
rm ${PSOUTPUT}
rm gmt.conf gmt.history

open -a Adobe\ Acrobat\ Pro.app ../pdf/${PDFOUTPUT}

