# Video Category Classification

### Authors: Aunnoy K Mutasim, Rayhan Sardar Tipu, M. Raihanul Bashar, Md. Kafiul Islam, M. Ashraful Amin

To generate the final results, execute the two steps below:

1. Run the file named exampleRunAllDatasetClassifierFeatextr.m in the base folder in Matlab. (Will take about 10 hours to 24 hours to finish execution depending on computer configuration)
2. Run the file named BestCombinationOfAlgorithms.py in the Results folder in Python 3.

All results will be generated in the folder "Results\Combination of Algorithms (Average of Subjects)". The files generated in this folder are named following the format "DeviceName Channel DataType" and the data in the second last column of each of these files correspond to a column in Table V and/or Table VI and/or Table VII of our paper referenced below. The data in each of these files are presented in the following format: Filter, Feature Extraction Algorithm, Feature Selection Algorithm, Classifier, Average Classification Accuracy, and Average Execution Time.

Results that can be reproduced: Tables V, VI and VII of our paper referenced below.

Note: MinGW-w64 C++ Compiler must be installed in Matlab and all the experiments were run in a Windows platform.

#### Associated Paper
1. Mutasim, A.K., Bashar, M.R., Tipu, R.S., Islam, M.K. and Amin, M.A., 2018, August. Effect of Artefact Removal Techniques on EEG Signals for Video Category Classification. In 2018 International Conference on Pattern Recognition (ICPR 2018).

#### Reference
1. Oikonomou, V.P., Liaros, G., Georgiadis, K., Chatzilari, E., Adam, K., Nikolopoulos, S. and Kompatsiaris, I. (2016) EEG processing toolbox. Available at: https://github.com/MAMEM/eeg-processing-toolbox (Accessed: 14 November 2016).
