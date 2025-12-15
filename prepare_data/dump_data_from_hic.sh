#!/bin/bash
# Check whether a directory exists; if not, create it
checkMakeDirectory(){
        echo -e "checking directory: $1"
        if [ ! -e "$1" ]; then
                echo -e "\tmakedir $1"
                mkdir -p "$1"
        fi
}
# Dump Hi-C contact matrices from .hic files
# and convert them into text format
dumpdata() {
    # Generate dataset index list (from $1 to $2)
    list=($(seq $1 $2))
    # Define chromosome list: chr1–chr22 and chrX
    chromList=($(seq 1 22))
    chromList[${#chromList[*]}]=X

    # Loop over dataset indices
    for li in ${list[@]}; do
        j=$((1551550+li-1))
        previous_name="GSM"$j
        latter_name=$(printf "HIC%03d" $li)
        dataset=${previous_name}_${latter_name}.hic
        #echo $dataset
        resolution=(10000 25000 50000 100000)
        mkdir -p $latter_name
        
        # Loop over chromosomes and resolutions
        for chrom in ${chromList[@]}; do
            for reso in ${resolution[@]}; do
                display_reso=$(reso / 1000)
                java -jar juicer_tools.jar dump observed KR ./${dataset} chr${chrom} chr${chrom} BP ${reso} ${latter_name}/${latter_name}_${display_reso}k_KR.chr${chrom}_tmp -d
                python remove_nan.py ${latter_name}/${latter_name}_${display_reso}k_KR.chr${chrom}_tmp ${latter_name}/${latter_name}_${display_reso}k_KR.chr${chrom}
            done
        done
    done
}
dumpdata 2 2    # Dump dataset HIC002
dumpdata  50 56  # Dump datasets HIC050–HIC056
dumpdata  69 74   # Dump datasets HIC069–HIC074

