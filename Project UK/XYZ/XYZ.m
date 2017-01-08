
clc;
M = csvread('XYZ.csv');
n = numel( M )/3;
%B = reshape(M,[n,3]);
%J = imresize(M,0.02);
%imshow(J);
t = 1:1:2000;
z = zeros(2000);
x=0;

for i = 1000:6000
    r = rem(i,3);
    if r == 0
        x = x+1 ;
        %fprintf('%f\n',M(i) );
        z(x) =  M(i);
    end
end
plot(t,z)