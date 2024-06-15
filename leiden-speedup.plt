set term pdf
set terminal pdf size 10in,2.5in
set output 'leiden-speedup.pdf'


## Set global styles
set termoption dashed
set datafile separator ','
set style fill solid border lt -1
set style textbox opaque noborder
set xtics rotate by 30 right
set key above font ",12"
set ylabel  '{/:Bold Speedup}'
set logscale y
set grid y


## Draw plot
plot "leiden-compare.csv" \
     using ( $3/$12):xtic(1) title 'Original Leiden'   with histogram fill pattern 3, \
  '' using ( $6/$12):xtic(1) title 'igraph Leiden'     with histogram fill pattern 3, \
  '' using ( $9/$12):xtic(1) title 'NetworKit Leiden'  with histogram fill pattern 3, \
  '' using ($15/$12):xtic(1) title 'cuGraph Leiden'    with histogram fill pattern 3, \
  '' using ($0-5.0/20):( $3/$12):(sprintf("%.0f",  $3/$12)) with labels textcolor rgb 'white' rotate by 90 offset character 0,-1 title '', \
  '' using ($0-1.5/20):( $6/$12):(sprintf("%.0f",  $6/$12)) with labels textcolor rgb 'white' rotate by 90 offset character 0,-1 title '', \
  '' using ($0+1.5/20):( $9/$12):(sprintf("%.1f",  $9/$12)) with labels rotate by 90 offset character 0,-1 title '', \
  '' using ($0+5.0/20):($15/$12):(sprintf("%.1f", $15/$12)) with labels rotate by 90 offset character 0,-1 title ''




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
