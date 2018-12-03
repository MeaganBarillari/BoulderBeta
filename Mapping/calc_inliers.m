function [archive_pts,input_points] = calc_inliers(archive, input)
    original = rgb2gray(archive);
    distorted = rgb2gray(input);

    ptsOriginal  = detectSURFFeatures(original);
    ptsDistorted = detectSURFFeatures(distorted);
    
    [featuresOriginal,   validPtsOriginal] = extractFeatures(original,  ptsOriginal);
    [featuresDistorted, validPtsDistorted] = extractFeatures(distorted, ptsDistorted);
    
    index_pairs = matchFeatures(featuresOriginal, featuresDistorted);
    matchedPtsOriginal  = validPtsOriginal(index_pairs(:,1));
    matchedPtsDistorted = validPtsDistorted(index_pairs(:,2));

    [tform,inlierPtsDistorted,inlierPtsOriginal] = estimateGeometricTransform(matchedPtsDistorted,matchedPtsOriginal,'similarity','MaxDistance',100);
%     figure; showMatchedFeatures(original,distorted,inlierPtsOriginal,inlierPtsDistorted);
    figure; imshow(original);
    
    outputView = imref2d(size(original));
    Ir = imwarp(distorted, tform, 'OutputView', outputView);
    figure; imshow(Ir); title('Recovered image');

end


