#!/bin/sh


createEpsPlotForceVSTime()
{
    gnuplot<<EOF
    set terminal postscript eps color enhanced
    set output "force.eps"
	set ylabel "Force (N)"
	set xlabel "Times (sec)"
	#set xrange [0:0.06]
	#set yrange [-2e7:1e7]
	#set arrow from 0,-2e7 to 0,1e7 nohead
	#set arrow from -1e-4,0 to 4e-5,0 nohead
	set title "ForcevsTime"
	#set style line 1 lt 1 lc rgb "red" lw 3
    set grid
	plot './log.lammps' u 2:(sqrt(\$5*\$5+\$6*\$6)) w l lc rgb "red" title "ForcevsTime"
EOF
}
createEpsPlotForceVSTime
