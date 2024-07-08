set term pdf
set terminal pdf size 10in,2.5in
set output 'leiden-disconnected.pdf'


## Set global styles
set termoption dashed
set datafile separator ','
set style fill solid border lt -1
set style textbox opaque noborder
set xtics rotate by 30 right
set key above font ",12"
set ylabel '{/:Bold Fraction of Disconnected communities}'
set logscale y
set format y '10^{%L}'
# set ytics 0.1
set grid y


## Draw plot
plot "leiden-compare.csv" \
     using 10:xtic(1) title 'NetworKit Leiden'  with histogram fill pattern 3 ls 3, \
  '' using 16:xtic(1) title 'cuGraph Leiden'    with histogram fill pattern 3 ls 4, \
  '' using 13:xtic(1) title 'GVE-Leiden'        with histogram fill pattern 3 ls 8, \
  '' using ($0-4.00/20):($10):($10>=1e-7? sprintf("%.1e", $10) : "") with labels rotate by 90 offset character 0,-1.5 title '', \
  '' using ($0-4.00/20):($10):($10< 1e-7 && $10>0? sprintf("%.1e", $10) : "") with labels rotate by 90 offset character 0,1.5 title '', \
  '' using ($0+0.00/20):($16):(sprintf("%.1e", $16)) with labels textcolor rgb 'black' rotate by 90 offset character 0,-1.5 title '', \
  '' using ($0+4.00/20):($13):(sprintf("%.1e", $13)) with labels textcolor rgb 'white' rotate by 90 offset character 0,-1.5 title ''




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
# 14. cugraph-m
# 15. cugraph-t
# 16. cugraph-d
