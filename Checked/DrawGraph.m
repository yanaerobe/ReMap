function DrawGraph
    Total = 16;
    Array = 16;
    Power = Total - Array;
    
    AxisFont = 8;
    LabelFont = 8;
    
    Grey = 0.3;
    Color = [Grey, Grey, Grey];
    
    FileName = uigetfile({'*.bin', 'Binary File (*.bin)'}, 'Open');
    if FileName == 0
        fprintf('\n\n');
        return;
    else
        NewFileName = strrep(FileName, '.bin', '');                             %remove '.bin'
    end
    
    tic;
    File = fopen(FileName, 'r');
    hold on;

    for Multiplier = 0 : 2^Power - 1
        disp(Multiplier); 
        x = ((Multiplier * 2^Array) + 1) : ((Multiplier + 1) * 2^Array);
        y = fread(File, 2^Array, 'float32');
        plot(x, y, 'k', 'LineWidth', 1);
    end

    set(gcf, 'Position', [200, 200, 330, 250]);                             %sets the position and size of the figure window[left, bottom, width, height]
    %set(gca, 'OuterPosition', [-0.05, 0, 1.08, 1]);                      %sets the position and size of the graph [left, bottom, width, height]
    set(gca, 'FontSize', LabelFont);                                        %sets the font size of the tick markers
    %set(gca, 'YTickLabel', sprintf('% .2f|', get(gca, 'Ytick')));           %sets the number of decimal places on Y-Axis
    set(gca, 'XScale', 'log', 'XGrid', 'on', 'XColor', Color);              %X-Axis parameters
    set(gca, 'YScale', 'linear', 'YGrid', 'on', 'YColor', Color);           %Y-Axis parameters
    
%     xlabel(' ', 'FontSize', AxisFont);                                      %prevent X-Axis alignment error due to change in font size
%     ylabel(' ', 'FontSize', AxisFont);                                      %prevent Y-Axis alignment error due to change in font size
    
%     xlabel('Input N', 'Color', 'k', 'FontSize', AxisFont);                  %X-Axis label
%     TextBox = uicontrol('Style', 'text');                                   %declare textbox
%     set(TextBox, 'FontSize', AxisFont);                                     %sets the font size
%     set(TextBox, 'ForegroundColor', 'k');                                   %sets the textbox text color
%     set(TextBox, 'BackgroundColor', [1, 1, 1]);                             %sets the textbox background color
%     set(TextBox, 'Position', [55, 235, 100, 12]);                           %sets the textbox position [left, bottom, width, height]
%     set(TextBox, 'HorizontalAlignment', 'left');                            %sets the alginment of text
%     if strfind(FileName, 'Percentage')
%         set(TextBox, 'String', 'Percentage Error(%)');
%     else
%         set(TextBox, 'String', 'Error');
%     end
    
    Copy = copyobj(gca, gcf);
    set(Copy, 'Color', 'none');
    set(Copy, 'Xcolor','k', 'Xgrid','off');                                 %X-Axis tick mark label color
    set(Copy, 'Ycolor','k', 'Ygrid','off');                                 %Y-Axis tick mark label color
    
    saveas(gcf, NewFileName, 'bmp');
    hold off;
    fclose('all');
    toc;
    fprintf('\n\n');
end