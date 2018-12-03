function POI = detect_points_of_interest(img)
    [img, POI] = vl_sift(single(rgb2gray(img)), 'Levels', 1);  
%     POI = POI(:,1:2:size(POI,2));