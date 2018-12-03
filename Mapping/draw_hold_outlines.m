function [holds] = draw_hold_outlines(archive, img)
    [archive_pts,input_pts] = calc_inliers(imread(cell2mat(archive.filepath)), img);

    archive_pt = archive_pts.Location(1,:);
    input_pt = input_pts.Location(1,:);
    d = archive_pt - input_pt;
    
    holds.starts = cell2mat(archive.starts);
    holds.ends = cell2mat(archive.ends);
    
    
    p1 = holds.starts.p1 - d;
    p2 = holds.starts.p2 - d;
    p3 = holds.starts.p3 - d;
    p4 = holds.starts.p4 - d;
    color = holds.starts.color;
    
    draw_line(p1,p2, color);
    draw_line(p2,p3, color);
    draw_line(p3,p4, color);
    draw_line(p4,p1, color);
    

    p1 = holds.ends.p1 - d;
    p2 = holds.ends.p2 - d;
    p3 = holds.ends.p3 - d;
    p4 = holds.ends.p4 - d;
    color = holds.ends.color;
    
    draw_line(p1,p2, color);
    draw_line(p2,p3, color);
    draw_line(p3,p4, color);
    draw_line(p4,p1, color);
end

