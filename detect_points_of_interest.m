function points_of_interest = detect_points_of_interest(img)
    POI = detectSURFFeatures(im2bw(img)); 
    points_of_interest = POI.selectStrongest(100);
    
        

    