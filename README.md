# CCTAD: A topologically associating domains detection method integrating convolutional autoencoder and hierarchical clustering
# About CCTAD
CCTAD is based on a convolutional autoencoder and constrained hierarchical clustering. After applying KR normalization to the Hi-C contact matrix, it employs a one-dimensional convolutional autoencoder (1D-CAE) to extract low-dimensional representations of genomic regions, then uses constrained hierarchical clustering to partition candidate TADs, and finally optimizes the results by merging overly small candidate domains to obtain the final TAD segmentation.
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
After obtaining the KR-normalized Hi-C matrices, modify the input/output file paths, then run:
```
jupyter notebook best_t.ipynb
```
This will generate the optimal threshold for the corresponding cell line and resolution.
## Final --TAD generation
After obtaining the optimal threshold, modify the input/output file paths in the main.ipynb file, along with the parameters resolution, best_threshold, and chromosomes.
For example, with "HIC002_50k_KR.chr20":
```
resolution = 50
best_threshold = 1.0
chromosomes = [f"chr{i}" for i in range(20, 21)]
```
Then run:
```
jupyter notebook main.ipynb
```
to generate the final TADs.
