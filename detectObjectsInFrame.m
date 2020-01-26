function [numCars] = detectObjectsInFrame(reffrms, framenumber, videoString) 
    %Initialize the variables 
    referenceFrames = reffrms;
    frameToRead = framenumber;
    video = videoString;

    %Initialize Foreground Detection.
    foregroundDetector = vision.ForegroundDetector('NumGaussians', 3, ...
        'NumTrainingFrames', referenceFrames);

    % Background Detection
    videoReader = vision.VideoFileReader(video);
    for i = 1 : frameToRead
        frame = step(videoReader); % read the next video frame
        foreground = step(foregroundDetector, frame);
    end

    outputDisplay(frame, 'Video Frame');
    outputDisplay(foreground, 'Foreground Image');

    % Noise Removal - 3x3 matrix
    filterForeground = noiseRemoval(foreground);
    outputDisplay(filterForeground, 'Noise Removal from Foreground');
    
    % Conducting Blob Analysis
    bbox = insertBox(filterForeground);
    numCars = size(bbox, 1);
    result = detectionLogic(frame, bbox, numCars);
    outputDisplay(result, 'Detected Cars');
end