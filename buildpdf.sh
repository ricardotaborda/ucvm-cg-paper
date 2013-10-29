pdflatex $1
bibtex   $1
pdflatex $1
pdflatex $1
pdflatex $1

open -a Adobe\ Acrobat\ Pro.app ${1}.pdf

rm ${1}.fff ${1}.log ${1}.aux ${1}.ttt ${1}.bbl ${1}.lof ${1}.blg ${1}.spl

clear