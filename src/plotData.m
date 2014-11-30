function plotData(x, y)
    figure;
    hold on;
    plot(x, y, 'rx', 'MarkerSize', 10);
    ylabel('Lucro em $ 10.000 s');
    xlabel('População de cidade em 10.000 s');
end
