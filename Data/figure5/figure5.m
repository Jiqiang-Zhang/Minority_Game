%处理0.15下的结果
original_action_data1 = load(['E:\program files\MATLAB\minority game' ...
    '\action\0.15\agent_action_0.15.txt']);
cluster1 = load(['E:\program files\MATLAB\minority game\action\0.15' ...
    '\cluster\r_cluster_1_ids.txt']);
cluster2 = load(['E:\program files\MATLAB\minority game\action\0.15' ...
    '\cluster\r_cluster_2_ids.txt']);
cluster3 = load(['E:\program files\MATLAB\minority game\action\0.15' ...
    '\cluster\r_cluster_3_ids.txt']);      % import Q data
cluster11 = load(['E:\program files\MATLAB\minority game\action\0.15' ...
    '\cluster\c_cluster_1_ids.txt']);
cluster21 = load(['E:\program files\MATLAB\minority game\action\0.15' ...
    '\cluster\c_cluster_2_ids.txt']);
cluster31 = load(['E:\program files\MATLAB\minority game\action\0.15' ...
    '\cluster\c_cluster_3_ids.txt']);      % import classical data
%%
Nc = int16(301*0.15);
Nq = 301 - Nc;
color_1_0 = [0.4 0.4 0.6]; % 淡蓝色，代表前十行的 0
color_1_1 = [1 0.6 0.2]; % 淡橙色，代表前十行的 1
color_2_0 = [0.6 0.6 0.6]; % 稍深的蓝色，代表后十行的 0
color_2_1 = [1 0.8 0.4]; % 稍深的橙色，代表后十行的 1

cmap = [color_1_0; color_1_1; color_2_0; color_2_1];
action_timeseries = reshape(original_action_data1(:,4), [301, 200]);
reshape_timeseries = [action_timeseries(cluster1(:),:); action_timeseries(cluster3(:),:); ...
    action_timeseries(cluster2(:),:); action_timeseries(cluster11(:),:); ...
    action_timeseries(cluster21(:),:); action_timeseries(cluster31(:),:)];
reshape_timeseries(1:Nq,:) = reshape_timeseries(1:Nq,:) + 1;
reshape_timeseries(Nq+1:301,:) = reshape_timeseries(Nq+1:301,:) + 3;
figure('Position', [100, 100, 800, 450]); % [左, 下, 宽, 高]

% 手动调整子图位置
subplot_positions = [
    0.1, 0.55, 0.35, 0.35; % 第一个子图位置 [左, 下, 宽, 高]
    0.55, 0.55, 0.35, 0.35; % 第二个子图位置
    0.1, 0.1, 0.35, 0.35; % 第三个子图位置
    0.55, 0.1, 0.35, 0.35]; % 第四个子图位置
subplot('Position', subplot_positions(1, :))
imagesc(reshape_timeseries);
colormap(cmap);
% 获取当前坐标轴的范围
ax = gca;
x_lim = ax.XLim;
% 添加横线
hold on;
row_position = Nq;
plot(x_lim, [row_position, row_position], 'r', 'LineWidth', 1.5);
row_position = 98;
plot(x_lim, [row_position, row_position], 'r--', 'LineWidth', 1.5);
row_position = 196;
plot(x_lim, [row_position, row_position], 'r--', 'LineWidth', 1.5);
hold off;
axis fill
% 步骤 6: 设置坐标轴标签和标题等（可选）
xlabel('\tau');
ylabel('Agent');
label = char('(a)');
text(-0.25, 0.95, label, 'Units', 'normalized', 'FontSize', 10, 'FontWeight','bold',...
    'FontName','times');
set(ax,'fontname','times','fontsize',8)
cbar = colorbar;
set(cbar, 'Ticks', 1.375:0.75:3.625, 'TickLabels', {'Q_0', 'Q_1', 'C_0','C_1'});
%%
%处理0.55下的结果
original_action_data1 = load(['E:\program files\MATLAB\minority game' ...
    '\action\0.55\agent_action_0.55.txt']);
cluster1 = load(['E:\program files\MATLAB\minority game\action\0.55' ...
    '\cluster\r_cluster_1_ids.txt']);
cluster2 = load(['E:\program files\MATLAB\minority game\action\0.55' ...
    '\cluster\r_cluster_2_ids.txt']);
cluster3 = load(['E:\program files\MATLAB\minority game\action\0.55' ...
    '\cluster\r_cluster_3_ids.txt']);      % import Q data
cluster11 = load(['E:\program files\MATLAB\minority game\action\0.55' ...
    '\cluster\c_cluster_1_ids.txt']);
cluster21 = load(['E:\program files\MATLAB\minority game\action\0.55' ...
    '\cluster\c_cluster_2_ids.txt']);
cluster31 = load(['E:\program files\MATLAB\minority game\action\0.55' ...
    '\cluster\c_cluster_3_ids.txt']);      % import classical data
%%
Nc = int16(301*0.55);
Nq = 301 - Nc;

cmap = [color_1_0; color_1_1; color_2_0; color_2_1];
action_timeseries = reshape(original_action_data1(:,4), [301, 200]);
reshape_timeseries = [action_timeseries(cluster1(:),:); action_timeseries(cluster3(:),:); ...
    action_timeseries(cluster2(:),:); action_timeseries(cluster11(:),:); ...
    action_timeseries(cluster21(:),:); action_timeseries(cluster31(:),:)];
reshape_timeseries(1:Nq,:) = reshape_timeseries(1:Nq,:) + 1;
reshape_timeseries(Nq+1:301,:) = reshape_timeseries(Nq+1:301,:) + 3;
subplot('Position', subplot_positions(2, :))
imagesc(reshape_timeseries);
colormap(cmap);
colorbar; % 显示颜色条
ax = gca;
x_lim = ax.XLim;
% 添加横线
hold on;
row_position = Nq;
plot(x_lim, [row_position, row_position], 'r', 'LineWidth', 1.5);
row_position = 45;
plot(x_lim, [row_position, row_position], 'r--', 'LineWidth', 1.5);
row_position = 87;
plot(x_lim, [row_position, row_position], 'r--', 'LineWidth', 1.5);
hold off;
axis fill

% 步骤 6: 设置坐标轴标签和标题等（可选）
xlabel('\tau');
ylabel('Agent');
label = char('(b)');
text(-0.25, 0.95, label, 'Units', 'normalized', 'FontSize', 10, 'FontWeight','bold',...
    'FontName','times');
set(ax,'fontname','times','fontsize',8)
cbar = colorbar;
set(cbar, 'Ticks', 1.375:0.75:3.625, 'TickLabels', {'Q_0', 'Q_1', 'C_0','C_1'});
%%
%处理0.75下的结果
original_action_data1 = load(['E:\program files\MATLAB\minority game' ...
    '\action\0.70\agent_action_0.70.txt']);
cluster1 = load(['E:\program files\MATLAB\minority game\action\0.70' ...
    '\cluster\r_cluster_1_ids.txt']);
cluster2 = load(['E:\program files\MATLAB\minority game\action\0.70' ...
    '\cluster\r_cluster_2_ids.txt']);
cluster3 = load(['E:\program files\MATLAB\minority game\action\0.70' ...
    '\cluster\r_cluster_3_ids.txt']);      % import Q data
cluster11 = load(['E:\program files\MATLAB\minority game\action\0.70' ...
    '\cluster\c_cluster_1_ids.txt']);
cluster21 = load(['E:\program files\MATLAB\minority game\action\0.70' ...
    '\cluster\c_cluster_2_ids.txt']);
cluster31 = load(['E:\program files\MATLAB\minority game\action\0.70' ...
    '\cluster\c_cluster_3_ids.txt']);      % import classical data
%%
Nc = int16(301*0.70);
Nq = 301 - Nc;

cmap = [color_1_0; color_1_1; color_2_0; color_2_1];
action_timeseries = reshape(original_action_data1(:,4), [301, 200]);
reshape_timeseries = [action_timeseries(cluster2(:),:); action_timeseries(cluster1(:),:);...
     action_timeseries(cluster3(:),:); action_timeseries(cluster11(:),:); ...
    action_timeseries(cluster21(:),:); action_timeseries(cluster31(:),:)];
reshape_timeseries(1:Nq,:) = reshape_timeseries(1:Nq,:) + 1;
reshape_timeseries(Nq+1:301,:) = reshape_timeseries(Nq+1:301,:) + 3;
subplot('Position', subplot_positions(3, :))
imagesc(reshape_timeseries);
colormap(cmap);
colorbar; % 显示颜色条
ax = gca;
x_lim = ax.XLim;
% 添加横线
hold on;
row_position = Nq;
plot(x_lim, [row_position, row_position], 'r', 'LineWidth', 1.5);
row_position = 29;
plot(x_lim, [row_position, row_position], 'r--', 'LineWidth', 1.5);
row_position = 49;
plot(x_lim, [row_position, row_position], 'r--', 'LineWidth', 1.5);
hold off;
axis fill

% 步骤 6: 设置坐标轴标签和标题等（可选）
xlabel('\tau');
ylabel('Agent');
label = char('(c)');
text(-0.25, 0.95, label, 'Units', 'normalized', 'FontSize', 10, 'FontWeight','bold',...
    'FontName','times');
set(ax,'fontname','times','fontsize',8)
cbar = colorbar;
set(cbar, 'Ticks', 1.375:0.75:3.625, 'TickLabels', {'Q_0', 'Q_1', 'C_0','C_1'});
%%
%处理0.85下的结果
original_action_data1 = load(['E:\program files\MATLAB\minority game' ...
    '\action\0.85\agent_action_0.85.txt']);
cluster1 = load(['E:\program files\MATLAB\minority game\action\0.85' ...
    '\cluster\r_cluster_1_ids.txt']);
cluster2 = load(['E:\program files\MATLAB\minority game\action\0.85' ...
    '\cluster\r_cluster_2_ids.txt']);
cluster3 = load(['E:\program files\MATLAB\minority game\action\0.85' ...
    '\cluster\r_cluster_3_ids.txt']);      % import Q data
cluster11 = load(['E:\program files\MATLAB\minority game\action\0.85' ...
    '\cluster\c_cluster_1_ids.txt']);
cluster21 = load(['E:\program files\MATLAB\minority game\action\0.85' ...
    '\cluster\c_cluster_2_ids.txt']);
cluster31 = load(['E:\program files\MATLAB\minority game\action\0.85' ...
    '\cluster\c_cluster_3_ids.txt']);      % import classical data

%%
Nc = int16(301*0.80);
Nq = 301 - Nc;

cmap = [color_1_0; color_1_1; color_2_0; color_2_1];
action_timeseries = reshape(original_action_data1(:,4), [301, 200]);
reshape_timeseries = [action_timeseries(cluster2(:),:); action_timeseries(cluster1(:),:);...
     action_timeseries(cluster3(:),:); action_timeseries(cluster11(:),:); ...
    action_timeseries(cluster21(:),:); action_timeseries(cluster31(:),:)];
reshape_timeseries(1:Nq,:) = reshape_timeseries(1:Nq,:) + 1;
reshape_timeseries(Nq+1:301,:) = reshape_timeseries(Nq+1:301,:) + 3;
subplot('Position', subplot_positions(4, :))
imagesc(reshape_timeseries);
colormap(cmap);
colorbar; % 显示颜色条
ax = gca;
x_lim = ax.XLim;
% 添加横线
hold on;
row_position = Nq;
plot(x_lim, [row_position, row_position], 'r', 'LineWidth', 1.5);
row_position = 10;
plot(x_lim, [row_position, row_position], 'r--', 'LineWidth', 1.5);
row_position = 29;
plot(x_lim, [row_position, row_position], 'r--', 'LineWidth', 1.5);
hold off;
axis fill
% 步骤 6: 设置坐标轴标签和标题等（可选）
xlabel('\tau');
ylabel('Agent');
label = char('(d)');
text(-0.25, 0.95, label, 'Units', 'normalized', 'FontSize', 10, 'FontWeight','bold',...
    'FontName','times');
set(ax,'fontname','times','fontsize',8)
cbar = colorbar;
set(cbar, 'Ticks', 1.375:0.75:3.625, 'TickLabels', {'Q_0', 'Q_1', 'C_0','C_1'});