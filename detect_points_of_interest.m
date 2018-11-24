function points_of_interest_img = detect_points_of_interest(img)
    points_of_interest_img = detectSURFFeatures(im2bw(img)); 
    
        

    