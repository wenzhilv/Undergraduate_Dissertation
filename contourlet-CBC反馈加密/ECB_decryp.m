%[123;76;190;65;156;123;76;110]
clc
clear
%EBC模式
%产生密钥组
disp('欢迎使用ECB模式进行解密运算')
k1=input('请输入解密密钥:');
k=zeros(8,8);
for i=1:8
    k(i,:)=D2B(k1(i));
end
K=make_key(k);%密钥组
%读入文件并对其进行分组
a=fopen('2.txt','r');
b=fread(a,'uint8');
l=length(b);
c=floor(l/8);
d=mod(l,8);
if d==0;
    d1=0;
else
    d1=1;
end
l1=8*(c+d1);
e=zeros(l1,8);
e1=zeros(1,8);
for i=1:l1%把ASSIC码转化为二进制码
   e1=D2B(b(i));
   e(i,:)=e1;
end
cryp=zeros(l1,8);
for i=1:l1/8%DES加密
    temp=[e(8*(i-1)+1,:);e(8*(i-1)+2,:);e(8*(i-1)+3,:);e(8*(i-1)+4,:);
          e(8*(i-1)+5,:);e(8*(i-1)+6,:);e(8*(i-1)+7,:);e(8*(i-1)+8,:)];
       cryp1=decryp(temp,K);
       cryp(8*(i-1)+1,:)=cryp1(1,:); cryp(8*(i-1)+2,:)=cryp1(2,:);
       cryp(8*(i-1)+3,:)=cryp1(3,:); cryp(8*(i-1)+4,:)=cryp1(4,:);
       cryp(8*(i-1)+5,:)=cryp1(5,:); cryp(8*(i-1)+6,:)=cryp1(6,:);
       cryp(8*(i-1)+7,:)=cryp1(7,:); cryp(8*(i-1)+8,:)=cryp1(8,:);
end
g=zeros(l1,1);
for i=1:l1
    f=cryp(i,:);
    g(i)=B2D(f);
end
h=fopen('3.txt','wb');
fwrite(h,g,'uint8');
fclose(h);





