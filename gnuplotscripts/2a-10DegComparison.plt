###  
###  Released under the MIT License (MIT) --- see ../LICENSE
###  Copyright (c) 2014 Ankit Singla, Sangeetha Abdu Jyothi, Chi-Yao Hong, Lucian Popa, P. Brighten Godfrey, Alexandra Kolla
###  

# Note you need gnuplot 4.4 for the pdfcairo terminal.
set terminal pdfcairo font "Gill Sans, 8" linewidth 4 rounded

# Line style for axes
set style line 80 lt rgb "#808080"

# Line style for grid
set style line 81 lt 0  # dashed
set style line 81 lt rgb "#808080"  # grey

set grid back linestyle 81
set border 3 back linestyle 80 # Remove border on top and right.  These
             # borders are useless and make it harder
	                  # to see plotted lines near the border.
			      # Also, put it in grey; no need for so much emphasis on a border.
			      set xtics nomirror
			      set ytics nomirror

#set log x
#set mxtics 10    # Makes logscale look good.

# Line styles: try to pick pleasing colors, rather
# than strictly primary colors or hard-to-see colors
# like gnuplot's default yellow.  Make the lines thick
# so they're easy to see in small plots in papers.
set style line 1 lt rgb "#A00000" lw 2 pt 1
set style line 2 lt rgb "#00A000" lw 2 pt 6
set style line 3 lt rgb "#5060D0" lw 2 pt 2
set style line 4 lt rgb "#F25900" lw 2 pt 9
set style line 5 lt rgb "#996600" lw 2 pt 4

set output "../plots/10DegComparison.pdf"
set xlabel "Network Size"
set ylabel "Throughput\n(Ratio to Upper-bound)"

set yrange [0:1]
set xrange [0:200]

set key bottom right 

plot "../resultfiles/inc_sw_allall.txt" using 1:6 title "All to All"  w lp ls 1, \
     "../resultfiles/inc_sw_10match.txt" using 1:6 title "Permutation (10 Servers per switch)" w lp ls 2, \
     "../resultfiles/inc_sw_5match.txt" using 1:6 title "Permutation (5 Servers per switch)" w lp ls 3

#     "../ankit_results/bound_test/40sizeBound_16match.txt" using 3:6 title "16-matchings / Bound" w lp ls 2, \
#"../ankit_results/bound_test/inc_deg_vardata.txt" using 3:($5/$4) title "Ratio" w lp ls 3, \

#plot "../ankit_results/bound_test/result_bound_test_inc_deg_16matchings.txt" using 3:4 title "Bound"  w lp ls 1, \
 #    "../ankit_results/bound_test/result_bound_test_inc_deg_16matchings.txt" using 3:5 title "Experiment" w lp ls 2
