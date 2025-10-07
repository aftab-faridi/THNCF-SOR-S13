% Sample data for bar graphs functions
categories = {'0.1', '0.2', '0.3', '0.4','0.5'};
%function1_values = [1.48, 4.29, 7.15, 9.75, 12.04];  % Ethylene glycol 
%function2_values = [1.64, 4.61, 7.68, 10.57, 13.05]; % Nanofluid
%function3_values = [1.71, 4.65, 7.71, 10.61, 13.31]; % Hybrid nanofluid
%function4_values = [1.78, 4.69, 7.79, 10.72, 13.38]; % Tri - hybrid
%function5_values = [1.89, 4.81, 7.98, 11.03, 13.81]; % Tetra - hybrid
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function1_values = [3.562, 3.361, 3.143, 2.903, 2.632];  
function2_values = [3.461, 3.275, 3.072, 2.851, 2.601]; 

% Combine data into a matrix for grouped bars
%values = [function1_values; function2_values; function3_values; function4_values; function5_values]';
values = [function1_values; function2_values]';
% Create the grouped bar graph
figure;
%bar(values, 'BarWidth', 1);
b = bar(values, 'BarWidth', 1 );

% Change colors of the bars
%b(1).FaceColor = [1 1 0]; % Set color for the first group (e.g., yellow)
%b(2).FaceColor = [1 1 0]; % Set color for the first group (e.g., yellow)
%b(3).FaceColor = [0 1 0]; % Set color for the second group (e.g., blue)
%b(4).FaceColor = [1 0 1]; % Set color for the second group (e.g., green)
%b(5).FaceColor = [1 0 0]; % Set color for the second group (e.g., red)
% Customize the bar graph
%title('Impact of Hybridization on Heat Transfer Rate');
title('Tri-hybrid vs Tetra-hybrid');
xlabel('H_g');
ylabel('Re_x^{-1/2} Nu_x');
%ylabel(' - Re_x^{1/2} C_f');
set(gca, 'XTickLabel', categories);

% Add legend
legend('(Ag - TiO_2 - GO / EG)','(Ag - TiO_2 - GO - Co / EG)');
%legend('Pure Fluid','Mono Nanofluid','Hybrid Nanofluid','Tri-Hybrid Nanofluid','Tetra-Hybrid Nanofluid');
% Display the values on top of the bars
for i = 1:length(categories)
    text(i - 0.15, function1_values(i), num2str(function1_values(i)), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom');
    text(i + 0.15, function2_values(i), num2str(function2_values(i)), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom');
    %text(i + 0.15, function2_values(i), num2str(function3_values(i)), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom');
    %text(i + 0.15, function2_values(i), num2str(function4_values(i)), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom');
    %text(i + 0.15, function2_values(i), num2str(function5_values(i)), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom');
end

axis([0 6 0 4])
% Optional: Customize bar colors
% set(gca, 'ColorOrder', [0 0.4470 0.7410; 0.8500 0.3250 0.0980], 'NextPlot', 'replacechildren');
% colormap([0.2 0.6 0.8; 0.8 0.4 0.2]);

% Grid for readability
grid on;