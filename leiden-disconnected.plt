set term pdf
set terminal pdf size 7.5in,2.5in
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
     using  4:xtic(1) title 'Original Leiden [CPU]'   with histogram fill pattern 3, \
  '' using  7:xtic(1) title 'igraph Leiden [CPU]'     with histogram fill pattern 3, \
  '' using 10:xtic(1) title 'NetworKit Leiden [CPU]'  with histogram fill pattern 3, \
  '' using 16:xtic(1) title 'cuGraph Leiden [GPU]'    with histogram fill pattern 3, \
  '' using 13:xtic(1) title 'GVE-Leiden [CPU]'        with histogram fill pattern 3 ls 8, \
  '' using ($0-5.75/20):( $4):(sprintf("%.1e",  $4)) with labels textcolor rgb 'white' rotate by 90 offset character 0,-1.5 title '', \
  '' using ($0-2.75/20):( $7):($7>=1e-6? sprintf("%.1e",  $7) : "") with labels textcolor rgb 'white' rotate by 90 offset character 0,-1.5 title '', \
  '' using ($0-2.75/20):( $7):($7< 1e-6? sprintf("%.1e",  $7) : "") with labels textcolor rgb 'black' rotate by 90 offset character 0,1.5 title '', \
  '' using ($0+0.00/20):($10):($10>=1e-7? sprintf("%.1e", $10) : "") with labels rotate by 90 offset character 0,-1.5 title '', \
  '' using ($0+0.00/20):($10):($10< 1e-7 && $10>0? sprintf("%.1e", $10) : "") with labels rotate by 90 offset character 0,1.5 title '', \
  '' using ($0+2.75/20):($16):(sprintf("%.1e", $16)) with labels textcolor rgb 'black' rotate by 90 offset character 0,-1.5 title '', \
  '' using ($0+5.75/20):($13):(sprintf("%.1e", $13)) with labels textcolor rgb 'white' rotate by 90 offset character 0,-1.5 title ''




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
