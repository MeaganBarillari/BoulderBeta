function main(vargs)
    db_list = {'Broken Pottery','Easy Slab','Easy','Sloper Problem',...
                'Spotted Cow','Sunny & 60s','The Clinger','Flying Mancuso',...
                'Spread Eagle','Stairway','Baby Crane'};

    search_list = {'Broken Pottery', 'Easy','Spotted Cow','Sunny & 60s','Baby Crane'}
    archive = {};
    clc;
    main_prompt = 'Would you like to:\n(a) - Archive a boulder \n(f) - Find a boulder \n(i) - import all images\n(t) - test find all\n(q) - Quit\n';
    while(1)
        user_input = lower(input(main_prompt,'s'));
        switch user_input
            case 'f'
                search_for_boulder(archive, '');
            case 'a'
                archive = archive_image(archive);
            case 'q'
                disp('Quitting...');
                return;
            case 'i'
                disp('Importing:');
                for i = 1:size(db_list,2)
                    name = cell2mat(db_list(i));
                    img = imread(strcat('Images/',name,'.jpg'));
                    imwrite(img, strcat('Images DB/',name,'.jpg'));
                    feature = {};
                    feature.POI = { detect_points_of_interest(img) };
                    feature.name = name;
                    feature.filepath = { strcat('Images/',name,'.jpg') };
                    archive(size(archive,2) + 1) = {feature};
                    disp(strcat(name,'...'));
                end
            case 't'
                for i = 1:size(search_list,2)
                    disp(strcat('Seachring:',name));
                    name = cell2mat(search_list(i));
                    search_for_boulder(archive, strcat('Images 2/',name,'.jpg'));
                end
        end
    end
end

