function [output]=select(x)
[x_r,x_c]=size(x);
y=zeros(x_r,x_c);
% u=x(1:4096);     %64*64
u=x(1:10000);  
%将x中与43相近的值都变成43
for i=1:x_r
    for j=1:x_c
        if (abs(x(i,j)-43)<=2)
            x(i,j)=43;
        end
    end
end
y=x;
%保持低频系数不变
% y(1:4096)=u;
y(1:10000)=u;
output=y;