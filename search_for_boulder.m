function result = search_for_boulder(archive, skip)
    clc;
    img = '';
    % Filepath
    if(strcmp(skip,'') == 1)
        while(isempty(img))
            filepath_prompt = 'Enter a filepath or (b) Back:\n';
            filepath = input(filepath_prompt,'s');
            while isempty(filepath)
                filepath = input(filepath_prompt,'s');
            end
            if(strcmpi(filepath, 'b'))
                clc;
                return; 
            end
            try
                img = imread(filepath);
            catch
                % Silence and error and have them enter again
            end
        end
    else
        img = imread(skip);
    end
    
    img_size = size(img,1);
    if(img_size > 500)
        img = imresize(img, 0.7);
    elseif(img_size > 1000)
        img = imresize(img, 0.6);
    elseif(img_size > 1500)
        img = imresize(img, 0.5);
    else
    end
            
    [n, archive_size] = size(archive);
    input_poi = detect_points_of_interest(img);
    max_matches = 0;
    max_boulder = '';
    % Iterating over everything in the archive
    for i=1:archive_size
        boulder = archive{i};
        boulder_poi = archive{i}.POI{:};
        [matches, scores] = vl_ubcmatch(boulder_poi, input_poi);
        if(size(matches,2) > max_matches)
           max_matches = size(matches,2);
           max_boulder = boulder.name;
        end
    end
    
    figure;
    archive_img = imread(strcat('Images DB/', max_boulder,'.jpg')); 
    imshow(archive_img); title(max_boulder); hold on;
    clc;


