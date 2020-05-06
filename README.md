# Eye Direction Detection From Image

## Introduction
Eye Direction Detection refers to the process of measuring where we look, also known as our point of gaze. These measurements are carried out by an eye Direction Detection system, that detect the eye first and then the position of the eyes. The main goal is to detect the direction of the eye. This project can identify the eye direction correctly.

## Dataset
For eye direction detection, we need some images containing face to take as an input.

## Steps of the Process
The process of eye direction detection are given below:

### 1. Process input image:
Take an input image of a face.

### 2. Covert it into gray scale image: 
Convert the image into gray scale image. We need less information for each pixel to detect eye direction. That’s why, we convert it into grey scale from colour image. We have used rgb2gray function for this process. 

### 3. Apply Viola Jones Method: 
The algorithm has 4 stages:
-	Haar Features: The eye region is darker than the upper- cheeks. The nose bridge is brighter than the eyes.
-	Creating an Integral Image
-	Adaboost Training
-	Cascading Classifier: On average only 0.01% of all sub-windows (faces) are positive. Equal computation time is spent on all sub-windows.

### 4. Apply Hough Transformation:
-	At first, we create the accumulation space for each pixel. 
-	Initially each cell is set to 0. 
-	For each edge point(i,j) in the image, increment all the cells according to the equation of the centre of a circle.
-	For each possible value that are found in the previous step, find all possible values which satisfy the equation.
-	Then, search for the local maxima in the accumulator space. 
-	These cells represent circles that are detected by the algorithm.

### 5. Eye direction detection:
-	The centre of Iris is takes at first. 
-	The distance of left and right corner from the center is calculated.
-	Check which sides distance is bigger.
-	If left distance is bigger than right distance, then the eye is staring at right and 
-	if the right distance is bigger than left, then the eye is staring at left.

## Features
1. Localize of the pupil
2. Mark the pupil in the image
3. Detect the center of the pupil
4. Eye gazing detection of the following directions: a. Left b. Right c. Straight 


