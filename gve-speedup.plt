set term pdf
set terminal pdf size 7.5in,2.5in
set output 'gve-speedup.pdf'


## Set global styles
set termoption dashed
set datafile separator ','
set style fill solid border lt -1
set style textbox opaque noborder
set xtics rotate by 30 right
set key above font ",12"
set ylabel  '{/:Bold Speedup}'
set yrange [0.3:]
set grid y


## Draw plot
plot "gve-compare.csv" \
     using ($2/$3):xtic(1) title 'GVE-Louvain' with histogram fill pattern 3, \
  '' using ($0):($2/$3):(sprintf("%.2f", $2/$3)) with labels textcolor rgb 'white' rotate by 90 offset character 0,-1 title ''
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
