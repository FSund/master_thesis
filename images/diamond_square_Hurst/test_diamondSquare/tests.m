addpath('~/Dropbox/Masteroppgave/master/statistics/Hurst/estimating_using_octave/')



power2 = 7;
addition = 0;
pbc = 0;
randomCorners = 1;
sigma = 1.0;
randomFactor = 1/sqrt(2);
rng = 2;

% theta = ?

nSamples = 100;
input_H = 0.0:0.1:1.2;


for addition = [0,1]
    for pbc = [0,1]
        H_samples = zeros(nSamples,length(input_H));
        for iH = 1:length(input_H)
            H = input_H(iH)
            for sample = 1:nSamples
%                 tic
                seed = randi([0,1000000]);
                fBm = diamondSquare(power2, H, randomCorners, sigma, randomFactor, addition, pbc, rng, seed);
        %         fBm = synth2(2^power2+1, H);
%                 toc
                tic
                H_samples(sample, iH) = estimate_Hurst_HDDMA(fBm);
                toc
            end
        end
        H_samples
        dlmwrite(sprintf('randseed_H_samples_diamondSquare_HDDMA_addition-%d_pbc-%d_nSamples-%d_H0.0-0.1-1.2.txt', addition, pbc, nSamples), H_samples, 'delimiter','\t','precision', '%.5f')
    end
end
