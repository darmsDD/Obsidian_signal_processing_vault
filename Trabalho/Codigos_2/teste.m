clc; clear all; close all;

K_linha = [ 0 2+1i 1-1i];
K_coluna = [0 0;2+1i 4-6i;1-1i 2+1i; ];
fliplr(conj(K_linha(2:end)));
flipud(conj(K_coluna(2:end,:)));

k2_linha = [K_linha fliplr(conj(K_linha(2:end)))];
k2_coluna = [K_coluna ;flipud(conj(K_coluna(2:end,:)))]

[linha,coluna] = size(k2_coluna);
l = k2_coluna(ceil(linha/2)+1:end,:)
l = flipud(l)

m = k2_coluna(2:ceil(linha/2),:)
isequal(abs(l),abs(m))

% [linha,coluna] = size(k2_coluna);
% 
% for j=1:coluna
%     p = 0;
%     i=2;
%     while(i< linha-p)
%         %k2_coluna(i,j)
%         %k2_coluna(end-0,j)
%         abs(k2_coluna(i,j)) == abs(k2_coluna(end-p,j))
%         disp([i,linha-p])
%         p = p+1;
%         i = i+1;
%     end
%     disp("Proxima coluna")
% end

