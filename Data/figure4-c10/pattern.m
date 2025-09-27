clear;
%%
action = load('agent_action_0.70.txt');
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
fraction = 0.70;
num_classical = fix(301*fraction);
original_classical_matrix = correlation_matrix(1:num_classical,1:num_classical);
original_reinforce_matrix = correlation_matrix(num_classical+1:301,num_classical+1:301);
k = 3;
opts = statset('Display', 'final');
[reinforce_idx, ~, ~] = kmedoids(original_reinforce_matrix, k, 'Replicates', 1000, 'Options', opts);

%reinforce_idx = kmedoids(reinforce_matrix, k);


%%
reinforce_index_vector = cell(k);
for i =1:1:k
    reinforce_index_vector{i} = find(reinforce_idx==i);
end
 

% index1 = find(reinforce_idx==1);
% index2 = find(reinforce_idx==2);
% index3 = find(reinforce_idx==3);
% index4 = find(reinforce_idx==4);
%%
resort_reinforce_matrix = zeros(size(original_reinforce_matrix, 1), size(original_reinforce_matrix, 2));
temp_vector = []; 
for i = 1:1:size(reinforce_index_vector, 2)
    temp_vector = [temp_vector; reinforce_index_vector{i}];
end

for i = 1:1:size(reinforce_idx)
    for j = 1:1:size(reinforce_idx)
        resort_reinforce_matrix(i, j) = original_reinforce_matrix(temp_vector(i), temp_vector(j));
    end
end 


%%
figure

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
imagesc(resort_reinforce_matrix)
clim([0, 1]);
colorbar;
%%
[U, S, V] = svd(resort_reinforce_matrix);
k = 3;
U_k = U(:, 1:k);
V_k = V(:, 1:k);
singular_values = diag(S);
X_reduced = U_k * diag(singular_values(1:k)) * V_k';

%%
figure

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
imagesc(X_reduced)
clim([0, 1]);
colorbar;



%%
k = 9;
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

for i = 1:1:size(classical_idx)
    for j = 1:1:size(classical_idx)
        resort_classical_matrix(i, j) = original_classical_matrix(temp_vector(i), temp_vector(j));
    end
end 
%%
figure

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
colorbar;
%%
[U, S, V] = svd(resort_classical_matrix);
k = 9;
U_k = U(:, 1:k);
V_k = V(:, 1:k);
singular_values = diag(S);
X_reduced = U_k * diag(singular_values(1:k)) * V_k';

%%
figure

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
imagesc(X_reduced)
clim([0, 1]);
colorbar;







