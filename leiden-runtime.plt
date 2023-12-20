set term pdf
set terminal pdf size 10in,2.5in
set output 'leiden-runtime.pdf'


## Set global styles
set termoption dashed
set datafile separator ','
set style fill solid border lt -1
set style textbox opaque noborder
set xtics rotate by 30 right
set key above font ",12"
set ylabel  '{/:Bold Runtime (s)}'
set logscale y
set grid y


## Draw plot
plot "leiden-compare.csv" \
     using ( $3/1000):xtic(1) title 'Original Leiden'   with histogram fill pattern 3, \
  '' using ( $6/1000):xtic(1) title 'igraph Leiden'     with histogram fill pattern 3, \
  '' using ( $9/1000):xtic(1) title 'NetworKit Leiden'  with histogram fill pattern 3, \
  '' using ($12/1000):xtic(1) title 'GVE-Leiden'        with histogram fill pattern 3 ls 8, \
  '' using ($0-5.0/20):( $3/1000):(sprintf("%.0f",  $3/1000)) with labels textcolor rgb 'white' rotate by 90 offset character 0,-1 title '', \
  '' using ($0-1.5/20):( $6/1000):(sprintf("%.0f",  $6/1000)) with labels textcolor rgb 'white' rotate by 90 offset character 0,-1 title '', \
  '' using ($0+1.5/20):( $9/1000):(sprintf("%.0f",  $9/1000)) with labels rotate by 90 offset character 0,-1 title '', \
  '' using ($0+5.0/20):($12/1000):(sprintf("%.1f", $12/1000)) with labels textcolor rgb 'white' rotate by 90 offset character 0,-1 title ''
  # '' using 2 title '' ls 1 lw 3 with linespoints axes x1y2, \
  # '' using 4 title '' ls 2 lw 3 with linespoints axes x1y2, \
  # '' using 6 title '' ls 3 lw 3 with linespoints axes x1y2, \
  # '' using 9 title '' ls 4 lw 3 lc 0 with linespoints axes x1y2




## Columns in CSV file.
# 01. graph
# 02. vtraag-m
# 03. vtraag-t
# 04. vtraag-d
# 05. igraph-m
# 06. igraph-t
# 07. igraph-d
# 08. networkit-m
# 09. networkit-t
# 10. networkit-d
# 11. sahu-m
# 12. sahu-t
# 13. sahu-d
