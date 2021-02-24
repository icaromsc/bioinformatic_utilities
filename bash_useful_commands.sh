#Replace spaces in filenames with underscores
for i in *' '*; do   mv "$i" `echo $i | sed -e 's/ /_/g'`; done

# Run command in background
Rscript 03_normalization_and_clustering.R & 

# Run command in background and redirect output to a file nohup.out
nohup Rscript 03_normalization_and_clustering.R & 

# Run command in background and redirect output to a file called 03_cite_seq.log
nohup Rscript 03_normalization_and_clustering.R &> 03_cite_seq.log & 
