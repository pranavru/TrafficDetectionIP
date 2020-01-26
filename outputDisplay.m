function [] = outputDisplay(frame, frameDesc)
    figure; imshow(frame); title(frameDesc);
    if(frameDesc == "Video Frame" || frameDesc == "Noise Removal from Foreground")
        figure; imhist(frame); title("Histogram " + frameDesc);
    end
end