function edge_detected_img = detect_boulder_edges(img)
    canny_threshold = .3;
    fh = figure;
    % Convert the image to grayscale
    gray_img = rgb2gray(img);
    edge_detected_img = edge(gray_img,'canny', canny_threshold);
    