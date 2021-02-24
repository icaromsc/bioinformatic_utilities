### Download file from URL
``` bash
wget https://data.qiime2.org/distro/core/qiime2-2020.11-py36-linux-conda.yml
```

### Compress directory
``` bash
tar -zcf GSE63042_kaiju.tar.gz Kaiju_Summary/
```

### Copy file from local to remote server
``` bash
scp covid-19.fasta  csbl-server:/home/CSBL/icaro/
```

### Copy file from remote server to local
``` bash
scp csbl-server:/home/CSBL/icaro/ncbi_error_report.xml report.xml
```

### Copy entire folder from local to remote server
``` bash
scp -r /home/icaro/covid_bali csbl-server:/home/CSBL/icaro/sandbox/
```

### Copy entire folder from remote server to local
``` bash
scp -r csbl-server:/home/CSBL/icaro/sandbox/metatranscriptomics/GSE152418/ /home/icaro/GSE152418
```

### Move all files from subdirectories to current directory?
``` bash
find . -type f -mindepth 2 -exec mv -i -- {} . \;
```

### Clean up the whole bunch of empty subdirectories with
``` bash
find . -depth -mindepth 1 -type d -empty -exec rmdir {} \;
```

### Run command in background
``` bash
Rscript 03_normalization_and_clustering.R & 
```

### Run command in background and redirect output to a file nohup.out
``` bash
nohup Rscript 03_normalization_and_clustering.R & 
```

### Run command in background and redirect output to a file called 03_cite_seq.log
``` bash
nohup Rscript 03_normalization_and_clustering.R &> 03_cite_seq.log & 
```

# BONUS

### Get number of mapped reads against reference
``` bash
samtools view -F 0x904 -c covid-19_mapped.sam
```

### Convert bam to fastq
``` bash
samtools bam2fq SAMPLE.bam > SAMPLE.fastq
```

### Replace spaces in filenames with underscores
``` bash
for i in *' '*; do   mv "$i" `echo $i | sed -e 's/ /_/g'`; done
```
