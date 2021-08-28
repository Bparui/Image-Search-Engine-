# Image-Search-Engine

This is a small scale implementation to mimic a google image search engine.
The code was written in MATLAB.

### Method Used
* The algorithm adopts Histogram of Images to extract relevant information regarding the images.
* Chi-Squared distance was used as the metric for determining the degree of similarity between images. 
* It compares the histogram of Query image with the images in dataset to give a score of similarity.
* Setting a threshold then outputs top 3-4 matches of query image in the dataset.


#### Sample Query Image
![Sample Query Image](https://github.com/Bparui/Image-Search-Engine-/blob/main/bbt1.jpg)
