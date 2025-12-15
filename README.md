# CCTAD: A topologically associating domains detection method integrating convolutional autoencoder and hierarchical clustering
# About CCTAD
CCTAD is an unsupervised framework for identifying topologically associating domains (TADs) from Hi-C contact matrices using a one-dimensional convolutional autoencoder combined with adjacency-constrained hierarchical clustering.
# Requirements
python=3.9.2，torch=2.2.0+cu118，scikit-learn=1.6.1，numpy=1.26.4，scipy=1.13.1
# Usage
## First --prepare_data
1.Run the following command to download the raw Hi-C data required for the experiments:
```
sh download_raw_hic.sh
```
2.Run the following command to generate the KR-normalized contact frequency matrices (all required files are in the prepare_data folder):
```
sh dump_data_from_hic.sh
```
3.For the other two cell lines (IMR90 and K562), run the following command to obtain normalized data:
```
sh Cells_observed.sh
```
## Second --Threshold generation
After obtaining the KR normalized Hi-C matrix, modify the relevant parameters in the best_t.ipynb file, including(For example, with "HIC002_50k_KR.chr20")
```
dir='/home/houshiyuan/frp/CCTAD'   # Set the main project directory
Dataset='HIC002'    # Dataset name
resolution=50        # Hi-C resolution (kb)
hic_matrix_dir='/mnt/sdi/frp/data/hic_matrix'   # Directory of Hi-C matrices
```
then run:
```
jupyter notebook best_t.ipynb
```
This will generate the optimal threshold for the corresponding cell line and resolution.
## Final --TAD generation
After obtaining the optimal threshold, modify the relevant parameters in the main.ipynb file, including(For example, with "HIC002_50k_KR.chr20")
```
dir='/home/houshiyuan/frp/CCTAD'   # Set the main project directory
Dataset='HIC002'    # Dataset name
resolution=50         # Hi-C resolution (kb)
hic_matrix_dir='/mnt/sdi/frp/data/hic_matrix'  # Directory of Hi-C matrices
chromosomes = [f"chr{i}" for i in range(20,21)]   # Chromosome
best_threshold=1.0  # Best threshold
```
Then run:
```
jupyter notebook main.ipynb
```
to generate the final TADs.

# Reproduced results
Modify the corresponding parameters,including(For example, with "HIC002_50k_KR.chr20")
```
dir='/home/houshiyuan/frp/CCTAD'   # Set the main project directory
Dataset='HIC002'    # Dataset name
resolution=50        # Hi-C resolution (kb)
hic_matrix_dir='/mnt/sdi/frp/data/hic_matrix'   # Directory of Hi-C matrices
chromosomes = [f"chr{i}" for i in range(20,21)]  # Chromosome
```
```
k=2    # Reproduced from random seeds
seed=1754115236    # Random seeds corresponding to the optimal model for a certain chromosome
best_threshold=1.0  # Corresponding best threshold
```
Then run:
```
jupyter notebook main.ipynb
```
