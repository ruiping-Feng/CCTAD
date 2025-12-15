#!/bin/bash

#GSE63525
# Script to download Hi-C data files from GEO dataset GSE63525
# Function to download Hi-C files for a range of indices
download_hic(){
start_idx=$1
end_idx=$2
 # Loop through each index from start_idx to end_idx
for ((idx=$start_idx; idx<=$end_idx; idx++))
do
	number=$(expr $idx + 549)
	wget ftp://ftp.ncbi.nlm.nih.gov/geo/samples/GSM1551nnn/GSM1551`printf "%03d" $number`/suppl/GSM1551`printf "%03d" $number`_HIC`printf "%03d" $idx`.hic
done
}
# Call the function to download the Hi-C file for index 80
download_hic 80 80

