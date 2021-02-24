#Download file from URL
wget https://data.qiime2.org/distro/core/qiime2-2020.11-py36-linux-conda.yml

#compress directory
tar -zcf GSE63042_kaiju.tar.gz Kaiju_Summary/

#copy file from local to remote server
scp covid-19.fasta  csbl-server:/home/CSBL/icaro/

#copy file from remote server
scp csbl-server:/home/CSBL/icaro/ncbi_error_report.xml report.xml

#copy entire folder from local to remote server
scp -r /home/icaro/covid_bali csbl-server:/home/CSBL/icaro/sandbox/

#copy entire folder from remote server to local
scp -r csbl-server:/home/CSBL/icaro/sandbox/metatranscriptomics/GSE152418/ /home/icaro/GSE152418

#Move all files from subdirectories to current directory?
find . -type f -mindepth 2 -exec mv -i -- {} . \;
#Clean up the whole bunch of empty subdirectories with
find . -depth -mindepth 1 -type d -empty -exec rmdir {} \;

#Get number of mapped reads against reference
samtools view -F 0x904 -c covid-19_mapped.sam

#Convert bam to fastq
samtools bam2fq SAMPLE.bam > SAMPLE.fastq

#Replace spaces in filenames with underscores
for i in *' '*; do   mv "$i" `echo $i | sed -e 's/ /_/g'`; done

# Run command in background
Rscript 03_normalization_and_clustering.R & 

# Run command in background and redirect output to a file nohup.out
nohup Rscript 03_normalization_and_clustering.R & 

# Run command in background and redirect output to a file called 03_cite_seq.log
nohup Rscript 03_normalization_and_clustering.R &> 03_cite_seq.log & 
