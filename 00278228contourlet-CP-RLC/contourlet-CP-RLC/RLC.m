function [code]=RLC(origin)
[origin_length,origin_width]=size(origin);
code(1,1:2)=[origin_length,origin_width];
%将低频子带数据放进元胞数组中
code_index=3;
% for j=1:64
%     for i=1:64*64
   for i=1:10000
        code(code_index)=origin(i);
        code_index=code_index+1;
    end
% end
% origin_tr(1:64,1:64)=63;
% origin_tr(1:64*64)=40;
% origin(1:64,1:64)=origin_tr;  %将origin的第一个64x64的系数化为63
% h=0;
% for j=1:origin_width/2;       %j = 1：256
    h=0;
    for i=10001:origin_width/4;          %origin_width/4;  %64*64=4096
        code_contain=origin(i);
        if(10001==i)
            code_value=origin(i);
            formervalue=code_value;
            codenumber=1;
        else
            if (code_contain==formervalue)
                if(i~=origin_width/2)
                    codenumber=codenumber+1;
                else
                    code(code_index)=codenumber+1;   
                    code(code_index+1)=formervalue;  
                    code_index=code_index+2;
                end
            else
                if(i~=origin_length/2)
                    code(code_index)=codenumber;      %记录个数
                    code(code_index+1)=formervalue;   %记录数值
                    formervalue=code_contain;
                    codenumber=1;
                    code_index=code_index+2;
                else
                    code(code_index)=codenumber;
                    code(code_index+1)=formervalue;
%                     codenumber=1;
%                     code_index=code_index+2;
%                     code(code_index)=1;
%                     code(code_index+1)=code_contain;
%                     code_index=code_index+2;
                end
            end
        end
    end
    [m,n]=size(code);
    for k=10001:2:n
        h=h+code(k);
    end
    if (mod(h,256)~=0)
        j
        return;
    end
end