set term pdf
set terminal pdf size 7.5in,2.5in
set output 'gve-disconnected.pdf'


## Set global styles
set termoption dashed
set datafile separator ','
set style fill solid border lt -1
set style textbox opaque noborder
set xtics rotate by 30 right
set key above font ",12"
set ylabel  '{/:Bold Fraction of Disconnected communities}'
set logscale y
set format y "10^{%L}"
# set ytics 0.1
set grid y


## Draw plot
plot "gve-compare.csv" \
     using ($6):xtic(1) title 'GVE-Louvain' with histogram fill pattern 3, \
  '' using ($7):xtic(1) title 'GVE-Leiden'  with histogram fill pattern 3 ls 8, \
  '' using ($0-2.5/20):($6):(sprintf("%.1e", $6)) with labels textcolor rgb 'white' rotate by 90 offset character 0,-1.5 title '', \
  '' using ($0+2.5/20):($7):($7>=1e-4? sprintf("%.1e", $7) : "") with labels textcolor rgb 'white' rotate by 90 offset character 0,-1.5 title '', \
  '' using ($0+2.5/20):($7):($7< 1e-4? sprintf("%.1e", $7) : "") with labels textcolor rgb 'black' rotate by 90 offset character 0,1.5 title ''
  # '' using 2 title '' ls 1 lw 3 with linespoints axes x1y2, \
  # '' using 4 title '' ls 2 lw 3 with linespoints axes x1y2, \
  # '' using 6 title '' ls 3 lw 3 with linespoints axes x1y2, \
  # '' using 9 title '' ls 4 lw 3 lc 0 with linespoints axes x1y2




## Columns in CSV file.
# 1. graph
# 2. louvain-t
# 3. leideng-t
# 4. louvain-m
# 5. leideng-m
# 6. louvain-dcf
# 7. leideng-dcf
