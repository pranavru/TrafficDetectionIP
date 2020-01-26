function [result] = detectionLogic(frame, box, numCars)
    % Displaying the detected cars
    result = insertShape(frame, 'Rectangle', box, 'Color', 'yellow');

    % Displaying the result after performing analysis
    result = insertText(result, [10 10], "Number of Cars - " + numCars, 'BoxOpacity', 0.7, ...
    'FontSize', 12);
end