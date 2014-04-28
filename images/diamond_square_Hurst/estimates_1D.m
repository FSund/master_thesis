addpath('~/Dropbox/Masteroppgave/master/statistics/Hurst/estimating_using_octave/')

nSamples = 200;
N = 2^10;
input_H = 0:0.1:1.0;
H_samples = zeros(nSamples,length(input_H));

for iH = 1:length(input_H)
    H = input_H(iH)
    for sample = 1:nSamples
    %     tic
        fBm = wfbm(H, N);
    %     toc
         tic
        H_samples(sample, iH) = estimate_Hurst_HDDMA(fBm);
         toc
    end
end
