m=size(wordle_data,1);
D1=zeros(2,m);
D1(1,:)=wordle_data(:,1)';
D2=zeros(2,m);
D2(1,:)=wordle_data(:,1)';
D3=zeros(2,m);
D3(1,:)=wordle_data(:,1)';
%数据读取

n=1:7;
A= n;
B= log(n)+1;
C= exp(n-1);
%三类模型

for i=1:358
    
   for j=1:7
   D1(2,i)= D1(2,i)+ wordle_data(i,j+1)*A(j);
   D2(2,i)= D2(2,i)+ wordle_data(i,j+1)*B(j);
   D3(2,i)= D3(2,i)+ wordle_data(i,j+1)*C(j);
   end
end
%因子准备


[N1,I1]=sort(D1(2,:),2);
[N2,I2]=sort(D2(2,:),2);
[N3,I3]=sort(D3(2,:),2);
d11=D1(1,:);
d12=D1(2,:);
d1=560-d11(I1);
D1=[d11(I1);d12(I1)];

d21=D2(1,:);
d22=D2(2,:);
d2=560-d21(I2);
D2=[d21(I2);d22(I2)];

d31=D3(1,:);
d32=D3(2,:);
d3=560-d31(I3);
D3=[d31(I3);d32(I3)];
%分别对指标数进行重排，并且进行处理作为之后各类中计算分完组后数据权重的索引

k1=1;
k2=72;
k3=143;
k4=215;
k5=287;
k6=358;
%分类的排名对应数

M1=zeros(5,10);
M2=zeros(5,10);
M3=zeros(5,10);
%三种模型对应的不同类的属性特征合集

%第一种模型
P1=zeros(5,72);
PP1=zeros(5,72);
Q1=zeros(5,72);
for k=k1:k2
    P1(1,k)=(k-k1)/(k2-k1);%百分位数计算
    PP1(1,k)=icdf('normal',P1(1,k),0,1);
    Q1(1,k)=pdf('normal',PP1(1,k),0,1);
    M1(1,:)=M1(1,:)+wordle_data(I1(k),9:18)*Q1(1,k);
end
M1(1,:)=M1(1,:)/(sum(Q1(1,:)));

for k=k2:k3
    P1(2,k)=(k-k2)/(k3-k2);%百分位数计算
    PP1(2,k)=icdf('normal',P1(2,k),0,1);
    Q1(2,k)=pdf('normal',PP1(2,k),0,1);
    M1(2,:)=M1(2,:)+wordle_data(I1(k),9:18)*Q1(2,k);
end
M1(2,:)=M1(2,:)/(sum(Q1(2,:)));

for k=k3:k4
    P1(3,k)=(k-k3)/(k4-k3);%百分位数计算
    PP1(3,k)=icdf('normal',P1(3,k),0,1);
    Q1(3,k)=pdf('normal',PP1(3,k),0,1);
    M1(3,:)=M1(3,:)+wordle_data(I1(k),9:18)*Q1(3,k);
end
M1(3,:)=M1(3,:)/(sum(Q1(3,:)));

for k=k4:k5
    P1(4,k)=(k-k4)/(k5-k4);%百分位数计算
    PP1(4,k)=icdf('normal',P1(4,k),0,1);
    Q1(4,k)=pdf('normal',PP1(4,k),0,1);
    M1(4,:)=M1(4,:)+wordle_data(I1(k),9:18)*Q1(4,k);
end
M1(4,:)=M1(4,:)/(sum(Q1(4,:)));

for k=k5:k6
    P1(5,k)=(k-k5)/(k6-k5);%百分位数计算
    PP1(5,k)=icdf('normal',P1(5,k),0,1);
    Q1(5,k)=pdf('normal',PP1(5,k),0,1);
    M1(5,:)=M1(4,:)+wordle_data(I1(k),9:18)*Q1(5,k);
end
M1(5,:)=M1(5,:)/(sum(Q1(5,:)));


%第二种模型
P2=zeros(5,72);
PP2=zeros(5,72);
Q2=zeros(5,72);
for k=k1:k2
    P2(1,k)=(k-k1)/(k2-k1);%百分位数计算
    PP2(1,k)=icdf('normal',P2(1,k),0,1);
    Q2(1,k)=pdf('normal',PP2(1,k),0,1);
    M2(1,:)=M2(1,:)+wordle_data(I2(k),9:18)*Q2(1,k);
end
M2(1,:)=M2(1,:)/(sum(Q2(1,:)));

for k=k2:k3
    P2(2,k)=(k-k2)/(k3-k2);%百分位数计算
    PP2(2,k)=icdf('normal',P2(2,k),0,1);
    Q2(2,k)=pdf('normal',PP2(2,k),0,1);
    M2(2,:)=M2(2,:)+wordle_data(I2(k),9:18)*Q2(2,k);
end
M2(2,:)=M2(2,:)/(sum(Q2(2,:)));

for k=k3:k4
    P2(3,k)=(k-k3)/(k4-k3);%百分位数计算
    PP2(3,k)=icdf('normal',P2(3,k),0,1);
    Q2(3,k)=pdf('normal',PP2(3,k),0,1);
    M2(3,:)=M2(3,:)+wordle_data(I2(k),9:18)*Q2(3,k);
end
M2(3,:)=M2(3,:)/(sum(Q2(3,:)));

for k=k4:k5
    P2(4,k)=(k-k4)/(k5-k4);%百分位数计算
    PP2(4,k)=icdf('normal',P2(4,k),0,1);
    Q2(4,k)=pdf('normal',PP2(4,k),0,1);
    M2(4,:)=M2(4,:)+wordle_data(I2(k),9:18)*Q2(4,k);
end
M2(4,:)=M2(4,:)/(sum(Q2(4,:)));

for k=k5:k6
    P2(5,k)=(k-k5)/(k6-k5);%百分位数计算
    PP2(5,k)=icdf('normal',P2(5,k),0,1);
    Q2(5,k)=pdf('normal',PP2(5,k),0,1);
    M2(5,:)=M2(4,:)+wordle_data(I2(k),9:18)*Q2(5,k);
end
M2(5,:)=M2(5,:)/(sum(Q2(5,:)));


%第三种模型
P3=zeros(5,72);
PP3=zeros(5,72);
Q3=zeros(5,72);
for k=k1:k2
    P3(1,k)=(k-k1)/(k2-k1);%百分位数计算
    PP3(1,k)=icdf('normal',P3(1,k),0,1);
    Q3(1,k)=pdf('normal',PP3(1,k),0,1);
    M3(1,:)=M3(1,:)+wordle_data(I3(k),9:18)*Q3(1,k);
end
M3(1,:)=M3(1,:)/(sum(Q3(1,:)));

for k=k2:k3
    P3(2,k)=(k-k2)/(k3-k2);%百分位数计算
    PP3(2,k)=icdf('normal',P3(2,k),0,1);
    Q3(2,k)=pdf('normal',PP3(2,k),0,1);
    M3(2,:)=M3(2,:)+wordle_data(I3(k),9:18)*Q3(2,k);
end
M3(2,:)=M3(2,:)/(sum(Q3(2,:)));

for k=k3:k4
    P3(3,k)=(k-k3)/(k4-k3);%百分位数计算
    PP3(3,k)=icdf('normal',P3(3,k),0,1);
    Q3(3,k)=pdf('normal',PP3(3,k),0,1);
    M3(3,:)=M3(3,:)+wordle_data(I3(k),9:18)*Q3(3,k);
end
M3(3,:)=M3(3,:)/(sum(Q3(3,:)));

for k=k4:k5
    P3(4,k)=(k-k4)/(k5-k4);%百分位数计算
    PP3(4,k)=icdf('normal',P3(4,k),0,1);
    Q3(4,k)=pdf('normal',PP3(4,k),0,1);
    M3(4,:)=M3(4,:)+wordle_data(I3(k),9:18)*Q3(4,k);
end
M3(4,:)=M3(4,:)/(sum(Q3(4,:)));

for k=k5:k6
    P3(5,k)=(k-k5)/(k6-k5);%百分位数计算
    PP3(5,k)=icdf('normal',P3(5,k),0,1);
    Q3(5,k)=pdf('normal',PP3(5,k),0,1);
    M3(5,:)=M3(4,:)+wordle_data(I3(k),9:18)*Q3(5,k);
end
M3(5,:)=M3(5,:)/(sum(Q3(5,:)));

VC1=norm(M1(2,:)-M1(1,:))+norm(M1(3,:)-M1(2,:))+norm(M1(4,:)-M1(3,:))+norm(M1(5,:)-M1(4,:))
VC2=norm(M2(2,:)-M2(1,:))+norm(M2(3,:)-M2(2,:))+norm(M2(4,:)-M2(3,:))+norm(M2(5,:)-M2(4,:))
VC3=norm(M3(2,:)-M3(1,:))+norm(M3(3,:)-M3(2,:))+norm(M3(4,:)-M3(3,:))+norm(M3(5,:)-M3(4,:))

M=[0, 1, 0, 3, 1, 1, 1,0.09318,0.063,2];
V=[norm(M-M1(1,:)),norm(M-M1(2,:)),norm(M-M1(3,:)),norm(M-M1(4,:)),norm(M-M1(5,:))]
