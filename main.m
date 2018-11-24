function main(vargs)
%     img_list = {'Images/Easy.jpg'};
    archive = {};
    main_prompt = 'Would you like to:\n(a) - Archive a boulder \n(f) - Find a boulder \n(q) - Quit\n';
    while(1)
        user_input = lower(input(main_prompt,'s'));
        switch user_input
            case 'f'
                disp('finding a boulder');
            case 'a'
                archive = archive_image(archive);
            case 'q'
                disp('Quitting...');
                return;
        end
%         edges = detect_boulder_edges(I);
%         POI = detect_points_of_interest(I);
%         
%         imshow(edges); hold on;
%         plot(POI.selectStrongest(10));
    end
end

