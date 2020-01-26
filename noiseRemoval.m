function [filteredForeGround] = noiseRemoval(frame)
    se = strel('square', 3);
    filteredForeGround = imopen(frame, se);
end