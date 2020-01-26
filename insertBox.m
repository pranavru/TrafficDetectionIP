function [box] = insertBox(frame)
    blobAnalysis = vision.BlobAnalysis('BoundingBoxOutputPort', true, 'AreaOutputPort', false, 'CentroidOutputPort', false, 'MinimumBlobArea', 150);
    box = step(blobAnalysis, frame);
end