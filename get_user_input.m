%%
% Get the input of a user given the type of input to get
% img - image data is being gotten from
% color - color of input polygon
%%
function rectangle = get_user_input(img, color)
    p1 = ginput(1);
    p2 = ginput(1);
    draw_line(p1,p2, color);
    p3 = ginput(1);
    draw_line(p2,p3, color);
    p4 = ginput(1);
    draw_line(p3,p4, color);
    draw_line(p4,p1, color);
    rectangle.p1 = p1;
    rectangle.p2 = p2;
    rectangle.p3 = p3;
    rectangle.p4 = p4;
    rectangle.color = color;
    pause(1);