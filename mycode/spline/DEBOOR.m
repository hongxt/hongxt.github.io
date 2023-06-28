function val = DEBOOR(T,p,y,order)

% function val = DEBOOR(T,p,y,order)
%
% INPUT:  T     St黷zstellen 节点向量
%         p     Kontrollpunkte (nx2-Matrix)控制点矩阵
%         y     Auswertungspunkte (Spaltenvektor)自变量向量
%         order Spline-Ordnung线条的阶次
%
% OUTPUT: val   Werte des B-Splines an y (mx2-Matrix)
%
% Date:   2007-11-27
% Author: Jonas Ballani
p%控制点的坐标
m = size(p,1);%控制点的个数
n = length(y) %自变量的个数
X = zeros(order,order);%4*4的矩阵
Y = zeros(order,order);%4*4的矩阵
a = T(1);%T的第一个元素
b = T(end);%T的最后一个元素
T = [ones(1,order-1)*a,T,ones(1,order-1)*b];%阶数的重复


for l = 1:n
    t0 = y(l);
    id = find(t0 >= T);
    k = id(end);
		if (k > m)
			return;
		end
    X(:,1) = p(k-order+1:k,1);
    Y(:,1) = p(k-order+1:k,2);

    for i = 2:order
        for j = i:order
            num = t0-T(k-order+j);
            if num == 0
                weight = 0;
            else
                s = T(k+j-i+1)-T(k-order+j);
                weight = num/s;
            end
            X(j,i) = (1-weight)*X(j-1,i-1) + weight*X(j,i-1);
            Y(j,i) = (1-weight)*Y(j-1,i-1) + weight*Y(j,i-1);
        end
    end
    val(l,1) = X(order,order);
    val(l,2) = Y(order,order);
end


