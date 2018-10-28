function main(vargs)
    img_list = {'Images/Broken Pottery.jpg','Images/Spotted Cow.jpg'};
    for i = 1:length(img_list)
        I = imread([img_list{i}]);
        % How do I get this to work?
        points = detectSURFFeatures(I); 
        imshow(I); hold on;
        plot(points.selectStrongest(10));
    end
end

