function [Uout, Paras] = Fx_MTPasFFT(Uin, ratio, N, omegaX)


if nargin == 3;
    m = linspace(0,N-1,N) / N - 0.5 + 0.5 /N;
    [meshM] = meshgrid(m,m);
    omegaX = exp(-1i * 2 * pi * meshM .* meshM.' * N * ratio);
end

Uout = omegaX * Uin * omegaX;
Paras = omegaX;
end