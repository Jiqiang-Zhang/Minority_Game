clear;
%%
action = load('agent_action_0.15.txt');
fraction = 0.15;
action_matrix = zeros(size(action,1),2);
for i = 1:1:size(action,1)
    if(action(i,4)==1)
        action_matrix(i,:) = [1 0];
    else
        action_matrix(i,:) = [0 1];
    end 
end
%%
agent_action_matrix = zeros(301, 2, 200);
for i = 1:1:size(action,1)
    j = action(i, 1) - 1999801 + 1;
    k = mod(i, 301);
    if(k==0)
        k = 301;
    end 
    agent_action_matrix(k, :, j) = action_matrix(i, :);
end
%%
Temp_T = zeros(200, 200);
correlation_matrix = zeros(301, 301);
temp_matrix1 = zeros(2, 200); 
temp_matrix2 = zeros(2, 200);
for i = 1:1:301
    for j = 1:1:301 
        temp_matrix1 = reshape(agent_action_matrix(i,:,:), [2, 200]);
        temp_matrix2 = reshape(agent_action_matrix(j,:,:), [2, 200]);
        Temp_T = temp_matrix1*temp_matrix2';
        correlation_matrix(i, j) = sum(trace(Temp_T))/200; 
    end
end 

%%
num_classical = fix(301*fraction);
original_classical_matrix = correlation_matrix(1:num_classical,1:num_classical);
original_reinforce_matrix = correlation_matrix(num_classical+1:301,num_classical+1:301);
k = 3;
opts = statset('Display', 'final');
classical_idx = kmedoids(original_classical_matrix, k);
%%
index_vector = cell(k);
for i =1:1:k
    classical_index_vector{i} = find(classical_idx==i);
end

resort_classical_matrix = zeros(size(original_classical_matrix, 1), size(original_classical_matrix, 2));
temp_index =  0; 
temp_vector = []; 
for i = 1:1:size(classical_index_vector, 2)
    temp_vector = [temp_vector; classical_index_vector{i}];
end

for i = 1:1:size(classical_idx,1)
    for j = 1:1:size(classical_idx,1)
        resort_classical_matrix(i, j) = original_classical_matrix(temp_vector(i), temp_vector(j));
    end
end 

%%
% 设定纵横比
aspect_ratio = 9/7;

% 设定图形窗口的高度
height = 800;
% 根据纵横比计算宽度
width = height * aspect_ratio;

% 设置画布大小
figure('Position', [100, 100, width, height]);
subplot(2, 2, 1)
% 定义颜色映射的点数
numColors = 256;

% 初始化颜色映射矩阵
cmap = zeros(numColors, 3);

% 计算中间索引
midIndex = floor(numColors / 2); % 128

% 下半部分（0到0.5）：从蓝色到白色
for i = 1:midIndex
    ratio = (i - 1) / (midIndex - 1); % 0到1
    cmap(i, 1) = ratio;          % 红色通道线性增加
    cmap(i, 2) = ratio;          % 绿色通道线性增加
    cmap(i, 3) = 1;                  % 蓝色通道保持1
end

% 上半部分（0.5到1）：从白色到红色
for i = midIndex + 1:numColors
    ratio = (i - midIndex) / (numColors - midIndex); % 0到1
    cmap(i, 1) = 1;                                % 红色通道保持1
    cmap(i, 2) = 1 - ratio;                        % 绿色通道线性降低
    cmap(i, 3) = 1 - ratio;                        % 蓝色通道线性降低
end

% 设置自定义颜色映射
colormap(cmap);

%colormap hot
imagesc(resort_classical_matrix)
clim([0, 1]);
colorbar; axis square;
text(-0.15, 0.95, '(a)', 'Units', 'normalized', 'FontSize', 20, 'FontName','times',...
    'FontWeight','bold');
set(gca,'fontname','times','fontsize',18)
xlabel('agent','FontSize',18,'FontName','times')
ylabel('agent','FontSize',18,'FontName','times')

%%
action = load('agent_action_0.55.txt');
fraction = 0.55;
action_matrix = zeros(size(action,1),2);
for i = 1:1:size(action,1)
    if(action(i,4)==1)
        action_matrix(i,:) = [1 0];
    else
        action_matrix(i,:) = [0 1];
    end 
end
%%
agent_action_matrix = zeros(301, 2, 200);
for i = 1:1:size(action,1)
    j = action(i, 1) - 1999801 + 1;
    k = mod(i, 301);
    if(k==0)
        k = 301;
    end 
    agent_action_matrix(k, :, j) = action_matrix(i, :);
end
%%
Temp_T = zeros(200, 200);
correlation_matrix = zeros(301, 301);
temp_matrix1 = zeros(2, 200); 
temp_matrix2 = zeros(2, 200);
for i = 1:1:301
    for j = 1:1:301 
        temp_matrix1 = reshape(agent_action_matrix(i,:,:), [2, 200]);
        temp_matrix2 = reshape(agent_action_matrix(j,:,:), [2, 200]);
        Temp_T = temp_matrix1*temp_matrix2';
        correlation_matrix(i, j) = sum(trace(Temp_T))/200; 
    end
end 

%%
num_classical = fix(301*fraction);
original_classical_matrix = correlation_matrix(1:num_classical,1:num_classical);
original_reinforce_matrix = correlation_matrix(num_classical+1:301,num_classical+1:301);
k = 3;
opts = statset('Display', 'final');
classical_idx = kmedoids(original_classical_matrix, k);
%%
index_vector = cell(k);
for i =1:1:k
    classical_index_vector{i} = find(classical_idx==i);
end

resort_classical_matrix = zeros(size(original_classical_matrix, 1), size(original_classical_matrix, 2));
temp_index =  0; 
temp_vector = []; 
for i = 1:1:size(classical_index_vector, 2)
    temp_vector = [temp_vector; classical_index_vector{i}];
end

for i = 1:1:size(classical_idx,1)
    for j = 1:1:size(classical_idx,1)
        resort_classical_matrix(i, j) = original_classical_matrix(temp_vector(i), temp_vector(j));
    end
end 
%%
subplot(2,2,2)

% 定义颜色映射的点数
numColors = 256;

% 初始化颜色映射矩阵
cmap = zeros(numColors, 3);

% 计算中间索引
midIndex = floor(numColors / 2); % 128

% 下半部分（0到0.5）：从蓝色到白色
for i = 1:midIndex
    ratio = (i - 1) / (midIndex - 1); % 0到1
    cmap(i, 1) = ratio;          % 红色通道线性增加
    cmap(i, 2) = ratio;          % 绿色通道线性增加
    cmap(i, 3) = 1;                  % 蓝色通道保持1
end

% 上半部分（0.5到1）：从白色到红色
for i = midIndex + 1:numColors
    ratio = (i - midIndex) / (numColors - midIndex); % 0到1
    cmap(i, 1) = 1;                                % 红色通道保持1
    cmap(i, 2) = 1 - ratio;                        % 绿色通道线性降低
    cmap(i, 3) = 1 - ratio;                        % 蓝色通道线性降低
end

% 设置自定义颜色映射
colormap(cmap);

%colormap hot
imagesc(resort_classical_matrix)
clim([0, 1]);
colorbar; axis square;
text(-0.15, 0.95, '(b)', 'Units', 'normalized', 'FontSize', 20, 'FontName','times',...
    'FontWeight','bold');
set(gca,'fontname','times','fontsize',18)
xlabel('agent','FontSize',18,'FontName','times')
ylabel('agent','FontSize',18,'FontName','times')
%%
action = load('agent_action_0.70.txt');
fraction = 0.70;
action_matrix = zeros(size(action,1),2);
for i = 1:1:size(action,1)
    if(action(i,4)==1)
        action_matrix(i,:) = [1 0];
    else
        action_matrix(i,:) = [0 1];
    end 
end
%%
agent_action_matrix = zeros(301, 2, 200);
for i = 1:1:size(action,1)
    j = action(i, 1) - 1999801 + 1;
    k = mod(i, 301);
    if(k==0)
        k = 301;
    end 
    agent_action_matrix(k, :, j) = action_matrix(i, :);
end
%%
Temp_T = zeros(200, 200);
correlation_matrix = zeros(301, 301);
temp_matrix1 = zeros(2, 200); 
temp_matrix2 = zeros(2, 200);
for i = 1:1:301
    for j = 1:1:301 
        temp_matrix1 = reshape(agent_action_matrix(i,:,:), [2, 200]);
        temp_matrix2 = reshape(agent_action_matrix(j,:,:), [2, 200]);
        Temp_T = temp_matrix1*temp_matrix2';
        correlation_matrix(i, j) = sum(trace(Temp_T))/200; 
    end
end 

%%
num_classical = fix(301*fraction);
original_classical_matrix = correlation_matrix(1:num_classical,1:num_classical);
original_reinforce_matrix = correlation_matrix(num_classical+1:301,num_classical+1:301);
k = 3;
opts = statset('Display', 'final');
classical_idx = kmedoids(original_classical_matrix, k);
%%
index_vector = cell(k);
for i =1:1:k
    classical_index_vector{i} = find(classical_idx==i);
end

resort_classical_matrix = zeros(size(original_classical_matrix, 1), size(original_classical_matrix, 2));
temp_index =  0; 
temp_vector = []; 
for i = 1:1:size(classical_index_vector, 2)
    temp_vector = [temp_vector; classical_index_vector{i}];
end

for i = 1:1:size(classical_idx,1)
    for j = 1:1:size(classical_idx,1)
        resort_classical_matrix(i, j) = original_classical_matrix(temp_vector(i), temp_vector(j));
    end
end 
%%
subplot(2,2,3)

% 定义颜色映射的点数
numColors = 256;

% 初始化颜色映射矩阵
cmap = zeros(numColors, 3);

% 计算中间索引
midIndex = floor(numColors / 2); % 128

% 下半部分（0到0.5）：从蓝色到白色
for i = 1:midIndex
    ratio = (i - 1) / (midIndex - 1); % 0到1
    cmap(i, 1) = ratio;          % 红色通道线性增加
    cmap(i, 2) = ratio;          % 绿色通道线性增加
    cmap(i, 3) = 1;                  % 蓝色通道保持1
end

% 上半部分（0.5到1）：从白色到红色
for i = midIndex + 1:numColors
    ratio = (i - midIndex) / (numColors - midIndex); % 0到1
    cmap(i, 1) = 1;                                % 红色通道保持1
    cmap(i, 2) = 1 - ratio;                        % 绿色通道线性降低
    cmap(i, 3) = 1 - ratio;                        % 蓝色通道线性降低
end

% 设置自定义颜色映射
colormap(cmap);

%colormap hot
imagesc(resort_classical_matrix)
clim([0, 1]);
colorbar; axis square;
text(-0.15, 0.95, '(c)', 'Units', 'normalized', 'FontSize', 20, 'FontName','times',...
    'FontWeight','bold');
set(gca,'fontname','times','fontsize',18)
xlabel('agent','FontSize',18,'FontName','times')
ylabel('agent','FontSize',18,'FontName','times')

%%
action = load('agent_action_0.85.txt');
fraction = 0.85;
action_matrix = zeros(size(action,1),2);
for i = 1:1:size(action,1)
    if(action(i,4)==1)
        action_matrix(i,:) = [1 0];
    else
        action_matrix(i,:) = [0 1];
    end 
end
%%
agent_action_matrix = zeros(301, 2, 200);
for i = 1:1:size(action,1)
    j = action(i, 1) - 1999801 + 1;
    k = mod(i, 301);
    if(k==0)
        k = 301;
    end 
    agent_action_matrix(k, :, j) = action_matrix(i, :);
end
%%
Temp_T = zeros(200, 200);
correlation_matrix = zeros(301, 301);
temp_matrix1 = zeros(2, 200); 
temp_matrix2 = zeros(2, 200);
for i = 1:1:301
    for j = 1:1:301 
        temp_matrix1 = reshape(agent_action_matrix(i,:,:), [2, 200]);
        temp_matrix2 = reshape(agent_action_matrix(j,:,:), [2, 200]);
        Temp_T = temp_matrix1*temp_matrix2';
        correlation_matrix(i, j) = sum(trace(Temp_T))/200; 
    end
end 

%%
num_classical = fix(301*fraction);
original_classical_matrix = correlation_matrix(1:num_classical,1:num_classical);
original_reinforce_matrix = correlation_matrix(num_classical+1:301,num_classical+1:301);
k = 3;
opts = statset('Display', 'final');
classical_idx = kmedoids(original_classical_matrix, k);
%%
index_vector = cell(k);
for i =1:1:k
    classical_index_vector{i} = find(classical_idx==i);
end

resort_classical_matrix = zeros(size(original_classical_matrix, 1), size(original_classical_matrix, 2));
temp_index =  0; 
temp_vector = []; 
for i = 1:1:size(classical_index_vector, 2)
    temp_vector = [temp_vector; classical_index_vector{i}];
end

for i = 1:1:size(classical_idx,1)
    for j = 1:1:size(classical_idx,1)
        resort_classical_matrix(i, j) = original_classical_matrix(temp_vector(i), temp_vector(j));
    end
end 
%%
subplot(2,2,4)

% 定义颜色映射的点数
numColors = 256;

% 初始化颜色映射矩阵
cmap = zeros(numColors, 3);

% 计算中间索引
midIndex = floor(numColors / 2); % 128

% 下半部分（0到0.5）：从蓝色到白色
for i = 1:midIndex
    ratio = (i - 1) / (midIndex - 1); % 0到1
    cmap(i, 1) = ratio;          % 红色通道线性增加
    cmap(i, 2) = ratio;          % 绿色通道线性增加
    cmap(i, 3) = 1;                  % 蓝色通道保持1
end

% 上半部分（0.5到1）：从白色到红色
for i = midIndex + 1:numColors
    ratio = (i - midIndex) / (numColors - midIndex); % 0到1
    cmap(i, 1) = 1;                                % 红色通道保持1
    cmap(i, 2) = 1 - ratio;                        % 绿色通道线性降低
    cmap(i, 3) = 1 - ratio;                        % 蓝色通道线性降低
end

% 设置自定义颜色映射
colormap(cmap);

%colormap hot
imagesc(resort_classical_matrix)
clim([0, 1]);
colorbar; axis square;
text(-0.15, 0.95, '(d)', 'Units', 'normalized', 'FontSize', 20, 'FontName','times',...
    'FontWeight','bold');
set(gca,'fontname','times','fontsize',18)
xlabel('agent','FontSize',18,'FontName','times')
ylabel('agent','FontSize',18,'FontName','times')