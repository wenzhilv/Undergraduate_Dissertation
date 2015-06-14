function [K]=make_key(k)
PC1=[57 49 41 33 25 17  9;
      1 58 50 42 34 26 18;
     10  2 59 51 43 35 27;
     19 11  3 60 52 44 36;
     63 55 47 39 31 23 15;
      7 62 54 46 38 30 22;
     14  6 61 53 45 37 29;
     21 13  5 28 20 12  4];
 k0=matrixchange(k,PC1);
 PC2=[14 17 11 24  1  5;
       3 28 15  6 21 10;
      23 19 12  4 26  8;
      16  7 27 20 13  2;
      41 52 31 37 47 55;
      30 40 51 45 33 48;
      44 49 39 56 34 53;
      46 42 50 36 29 32];
  recycle_num=[1 1 2 2 2 2 2 2 1 2 2 2 2 2 2 1];
  C=zeros(17,28);D=zeros(17,28);K=zeros(16*8,6);
  C=[k0(1,:) k0(2,:) k0(3,:) k0(4,:)];
  D=[k0(5,:) k0(6,:) k0(7,:) k0(8,:)];
  for i=1:16
      temp1=C(i,:);
      temp2=leftrecycle(recycle_num(i),temp1);
      C(i+1,:)=temp2;
      temp1=D(i,:);
      temp2=leftrecycle(recycle_num(i),temp1);
      D(i+1,:)=temp2;
      temp1=[ C(i+1,:) D(i+1,:)];
      temp2=matrixchange(temp1,PC2);
      K(8*(i-1)+1,:)=temp2(1,:);K(8*(i-1)+2,:)=temp2(2,:);
      K(8*(i-1)+3,:)=temp2(3,:);K(8*(i-1)+4,:)=temp2(4,:);
      K(8*(i-1)+5,:)=temp2(5,:);K(8*(i-1)+6,:)=temp2(6,:);
      K(8*(i-1)+7,:)=temp2(7,:);K(8*(i-1)+8,:)=temp2(8,:);     
  end
     
      
      
  
  