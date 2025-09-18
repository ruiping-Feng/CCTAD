# CCTAD: A topologically associating domains detection method integrating convolutional autoencoder and hierarchical clustering
# About CCTAD
CCTAD is based on a convolutional autoencoder and constrained hierarchical clustering. After applying KR normalization to the Hi-C contact matrix, it employs a one-dimensional convolutional autoencoder (1D-CAE) to extract low-dimensional representations of genomic regions, then uses constrained hierarchical clustering to partition candidate TADs, and finally optimizes the results by merging overly small candidate domains to obtain the final TAD segmentation.
# Requirements
python=3.9.2，torch=2.2.0+cu118，scikit-learn=1.6.1，numpy=1.26.4，scipy=1.13.1
# Usage
## First--prepare_data
1、You can use **“sh download\_raw\_hic.sh”** to download the raw Hi-C data required for the experiments. Then, run **“sh dump\_data\_from\_hic.sh”** to generate the KR-normalized contact frequency matrices. All necessary files are located in the **“prepare\_data”** folder.

2、For the other two cell lines (IMR90 and K562), run the command **“sh Cells\_observed.sh”** to obtain the normalized data.
## Second--Threshold generation
You can run the **“best_t.ipynb”** file to generate the optimal threshold for the corresponding cell line and resolution.
## Final --TAD generation
You can run the **“main.ipynb”** file to generate the final TADs.
