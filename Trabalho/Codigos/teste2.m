clc; close all; clear all;

N = 7;
n=3;
H = [];
h=[ 1 2 3; 4 5 6; 7 8 9;10 11 12; 13 14 15; 16 17 18; 19 20 21];


for k=1:N-2*n
    N-2*n
    H=[H;
       h(:,(k-1)+1:(k-1)+2*n)];
end

H