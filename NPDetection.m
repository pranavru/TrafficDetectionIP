clc
close all;
clear;

%Load the recognition data
load imgRecognitionData;

% Load an Image from the Local System.
[file, path] = uigetfile({'*.png;*.jpg;*.jpeg;*.tif;*.bmp'}, 'Select an Image to find License Plate Number');   
imageChoosen = [path, file];
img = imread(imageChoosen);

%Call the function extractNumberPlate() to get the data.
numberPlateValue = extractNumberPlate(img);

%Display the Values.
fprintf('The License Plate value is: ');
disp(numberPlateValue);