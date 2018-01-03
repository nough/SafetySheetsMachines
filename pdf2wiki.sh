#!/bin/sh
set -e

pdfexplode safety-sheets.pdf

set `cat safety-sheets.tex | grep machinePage | sed -e 's/\\\\machinePage{//' -e 's/}.*//' -e 's/ /_/g'`

L=`ls safety-sheets.explode/*.pdf| wc -l`

if $# != $L; then
	echo Number of pages does not match number of machines. Giving up.
	exit 1
fi
 
for i in safety-sheets.explode/*.pdf
do
  	sips -s format png $i --out safety-sheets.explode/safetysheet-$1.png
	shift
done

exit 0
