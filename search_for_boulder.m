function result = search_for_boulder(archive)
    img = '';
    % Filepath
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
    
    [archive_size] = size(archive);
    % Iterating over everything in the archive
    for i=1:archive_size
        % Get the fingerprints
        boulder = archive(i)
        % archive{1}.POI{:}.selectStrongest(100)
        % Get fingerprints from start/end holds
    end
end

