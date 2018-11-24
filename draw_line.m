function draw_line(p1, p2, color)
    hold on;
    plot([p1(1) p2(1)], [p1(2) p2(2)], color, 'LineWidth', 2)