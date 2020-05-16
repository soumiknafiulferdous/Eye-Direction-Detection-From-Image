# Eye Direction Detection From Image

## Overview
Eye Direction Detection refers to the process of measuring where we look, also known as our point of gaze. These measurements are carried out by an eye direction detection system, that detects the eye first and then detects the position of the eyes. The main goal is to detect the original direction of the eye. This project can identify the eye direction correctly.

## Dataset
For eye direction detection, four images containing face are used as input.

## Steps of the Process
The process of eye direction detection are given below:

### 1. Take input image:
Take an input image of a face.

### 2. Covertion of gray scale image: 
Convert the image into gray scale image. Less information for each pixel are needed to detect eye direction. That’s why, they are converted into grey scale image from color image. Rgb2gray function is used for this process. 

### 3. Apply Viola Jones Method: 

This algorithm has 4 stages:
-	Haar Features: The human eye region is darker than their upper-cheeks. The nose bridge is brighter than the eyes.
-	Creating an Integral Image
-	Adaboost Training
-	Cascading Classifier: On average only 0.01% of all sub-windows (faces) are positive. Equal computation time is spent on all sub-windows.

### 4. Apply Hough Transformation:
-	At first, accumulation space for each pixel is created. 
-	Initially, each cell is set to 0. 
-	For each edge point (i, j) in the image, increment all the cells according to the equation of the centre of a circle.
-	For each possible value that are found in the previous steps, calculate all possible values which satisfy the equation.
-	Search for the local maxima in the accumulator space. 
-	These cells represent circles that are detected by the algorithm.

### 5. Detection eye direction:
-	The centre of Iris is considered at first. 
-	The distance of left and right corner from the center is calculated.
-	Then check which side's distance is larger.
-	If left distance is larger than right distance, then the eye is staring at right. 
-	If the right distance is bigger than left, then the eye is staring at left.

## Features
1. It can localize of the pupil.
2. Mark the pupil in the image.
3. It can detect the center of the pupil.
4. Eye gazing detection of the following directions: a. Left b. Right c. Straight 
5. It can also give alert if there is no face in the image. 

## Screenshots
![1-001](https://user-images.githubusercontent.com/30154496/82124214-5642fd80-97bf-11ea-89ea-c99aecca4eb7.jpg)


![2-001](https://user-images.githubusercontent.com/30154496/82124217-57742a80-97bf-11ea-834f-2c533ae6e1e0.jpg)


![3-001](https://user-images.githubusercontent.com/30154496/82124218-580cc100-97bf-11ea-9c4d-811010b2b345.jpg)


![4-001](https://user-images.githubusercontent.com/30154496/82124219-58a55780-97bf-11ea-981d-a7fb682ecf64.jpg)



