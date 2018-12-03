%%
% Gets the start/end holds from the user
% img - image to get the data from
%%
function archive = archive_image(archive)
    img = ''; 
    filepath_prompt = 'Enter a filepath or (b) Back:\n';
    % Filepath
    while(isempty(img))
        clc;
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
            filepath_prompt = '***Image not found***\nEnter a filepath or (b) Back:\n';
        end
    end
    feature = {};
    % Boulder Name
    name = '';
    while isempty(name)
        clc;
        name = input('Enter boulder name:','s');
    end
    
    feature.name = name;
    feature.filepath = { filepath };
    
    main_prompt = 'Would you like to:\n(s) - Enter a start hold\n(e) - Enter an end hold\n(d) - Done\n';
    input_figure = figure();
    set(input_figure, 'Visible', 'off');
    imshow(img); hold on;
    starts = {}; ends = {};
    while(1)
        clc;
        input_type = lower(input(main_prompt,'s'));
        % Printing all the features out
        next_feature_index = size(feature) + 1;
        switch input_type
            case 's'
                set(input_figure, 'Visible', 'on');
                starts(size(starts) + 1) = { get_user_input(img, 'r') };
            case 'e'
                set(input_figure, 'Visible', 'on');
                ends(size(ends) + 1) = { get_user_input(img, 'b') };
            case 'd'
                clc;
%                 if(~isempty(starts) && ~isempty(ends))
                   feature.starts = starts;
                   feature.ends = ends;
                   feature.POI = { detect_points_of_interest(img) };
                   archive(size(archive,2) + 1) = {feature};
                   saveas(input_figure, strcat('Images DB/', name, '.jpg'));
%                 end
                return;
        end
        set(input_figure, 'Visible', 'off');
    end
    
end