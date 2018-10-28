function edge_dectected_img = detect_boulder_edges(img)
    canny_threshold = .7;
    fh = figure;
    % Convert the image to grayscale
    gray_img = rgb2gray(img);
    imshow(gray_img);
    edge_dectected_img = edge(gray_img,'canny', canny_threshold);
    