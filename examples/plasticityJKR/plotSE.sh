#!/bin/sh

awk 'NR%10==0 && NR>1' se.lammpstrj > se.dat


#set terminal postscript eps color enhanced

createEpsPlotSigmaVSStrain()
{
    gnuplot<<EOF
    set terminal jpeg
    set output "sigmaVsStrain.jpg"
	set xlabel "Strain"
	set ylabel "Stress"
	set xrange [0:0.06]
	#set yrange [-2e7:1e7]
	#set arrow from 0,-2e7 to 0,1e7 nohead
	#set arrow from -1e-4,0 to 4e-5,0 nohead
	set title "sigmavsstrain"
	set style line 1 lt 1 lc rgb "red" lw 3
    set grid
	plot './se.dat' u (-\$13):(-\$12) w p lt 1 pt 1
EOF
}
createEpsPlotSigmaVSStrain
