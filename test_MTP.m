clear
close all
N = 1001;
uin = Fx_gaussianbeam(N,N,0.1,0.005);
% uin = circshift(uin,40,1);
uin = gpuArray(uin);
Paras = gpuArray(Paras);

tic
[U, Paras] = Fx_MTPasFFT(uin,0.1,N,Paras);
toc
figure;
mesh(abs(U))
figure;
mesh(angle(U))
















% uin = uin ./ uin;
tic
m = linspace(0,N-1,N) / N - 0.5;
n = linspace(0,N-1,N) / N - 0.5;
r = linspace(0,N-1,N) / N - 0.5;
s = linspace(0,N-1,N) / N - 0.5; 

[meshM, meshN] = meshgrid(m,n);
[meshR, meshS] = meshgrid(r,s);
omegaX = exp(-1i * 2 * pi * meshM .* meshR.' * N * 0.1);
omegaY = exp(-1i * 2 * pi * meshN .* meshS.' * N * 0.1);

% figure;
% mesh(angle(omegaY))
omegaY = gpuArray(omegaY);
omegaX = gpuArray(omegaX);
uin = gpuArray(uin);

cc = omegaX * uin * omegaY;
toc
figure;
mesh(abs(cc))
figure;
mesh(angle(cc))




ww = Fx_CZT(uin,0.1,N);

figure;
mesh(abs(ww))
figure;
mesh(angle(ww))









ww = fftshift(fft2(uin));
figure;
mesh(abs(ww))
figure;
mesh(angle(ww))