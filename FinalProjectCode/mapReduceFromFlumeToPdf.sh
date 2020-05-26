cd "/Users/xtrs84zk/Documents/Proyecto Final Big Data/análisis/"
echo Preparando la salida del MapReduce para ser utilizable por el WordCloud.
java PrepareMapReduceToWordCloud
echo Preparando WordCloud.
Rscript "/Users/xtrs84zk/Documents/Proyecto Final Big Data/análisis/flumeToWordCloud.R"
mv Rplots.pdf WordCloud.pdf
open WordCloud.pdf