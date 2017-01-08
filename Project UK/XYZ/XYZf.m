function z = XYZf(file,c,k)
M = csvread(file);
n = numel( M )/3;
%B = reshape(M,[n,3]);
%J = imresize(M,0.02);
%imshow(J);
t = 1:1:200;
z = zeros(200,1);
x=0;

for i = 1:k
    r = rem(i,3);
    if r == c
        x = x+1 ;
        %fprintf('%f\n',M(i) );
        z(x) =  M(i);
    end
end
% figure;
% plot(t,z) ;

% L=length(z);
% fprintf('%f\n',L );
% dt=3.5*10^(-6); %time.
% fs=1/dt;
% t=(0:1:L-1)*dt; %If you'd like to plot the time signal: plot(t,x)
% out=fft(x,L)/L;
% figure, plot(fs/2*linspace(0,1,(length(out)/2)+1),abs(out(1:(length(out)/2)+1))),title('One sided Spectrum')
% xlabel('Normalized frequency')
% ylabel('Magnitude')

end