clc; close all; clear all;

% Example matrix
A = rand(9,4);  % your 9x4 array
l = A.';
B = reshape(A.', [], 1);
% Define how many clusters you want
k = 4;  

% Apply k-means
[idx, C] = kmeans(B, k);

% idx gives you the cluster assignment for each row
disp(idx)

[m, n] = size(A);  % m = 9, n = 4

for k=1:length(idx)
    i = floor((k-1)/n) +1;
    j = (mod((k-1),n)) + 1;
    %fprintf('Vetor %d --> Linha %d, Coluna %d', k, i, j);
   
    %fprintf("B(%d) = %d |A(%d,%d) = %d\n",k,B(k),i,j,A(i,j));
end

