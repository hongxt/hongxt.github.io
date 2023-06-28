function spline(n,order)

% function spline(n,order)
%
% Plots the B-slpine-curve of n control-points.
% The control points can be chosen by clicking
% with the mouse on the figure.
%
% COMMAND:  spline(n,order)
% INPUT:    n     控制点的个数，
%           order 曲线的阶数，4次曲线Order ob B-Splines
%                 Argnument is arbitrary
%                 default: order = 4
%
% Date:     2007-11-28
% Author:   Stefan H黣ber

close all;
if (nargin ~= 2)%如果没有输入阶数，默认的阶数是4
	order = 4;
end
nplot = 100;

if (n < order)%控制点的个数要大于阶数，不知道为什么
	display([' !!! Error: Choose n >= order=',num2str(order),' !!!']);
	return;
end

figure(1);
hold on; box on;
set(gca,'Fontsize',16);

t = linspace(0,1,nplot);%自变量t，100个离散的t，但是没有使用

for i = 1:n	%循环n次来拾取控制点
	title(['Choose ',num2str(i),' th. control point']);
	p(i,:) = ginput(1);%第i个点放在p矩阵的第i行
	hold off;
	plot(p(:,1),p(:,2),'k-','LineWidth',2);%画出折线
	axis([0 1 0 1]);
	hold on; box on;
	if (i  >= order) 
		T = linspace(0,1,i-order+2);
		y = linspace(0,1,1000);
		p_spl = DEBOOR(T,p,y,order);%控制点的坐标、节点向量、自变量向量、曲线的阶次
		plot(p_spl(:,1),p_spl(:,2),'b-','LineWidth',4);
	end
	plot(p(:,1),p(:,2),'ro','MarkerSize',10,'MarkerFaceColor','r');
end

title(['B-Spline-curve with ',num2str(n),' control points of order ',num2str(order)]);
