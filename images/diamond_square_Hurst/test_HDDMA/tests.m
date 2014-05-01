addpath('~/Dropbox/Masteroppgave/master/statistics/Hurst/estimating_using_octave/')

theta_vec = [0.0, 0.5, .99999];

if true % 1D %
    nSamples = 1000;
    N = 2^10;
    input_H = (.05):0.1:.95;
    H_samples = zeros(nSamples,length(input_H));

    for theta = theta_vec
        for iH = 1:length(input_H)
            H = input_H(iH)
            for sample = 1:nSamples
                fBm = wfbm(H, N);
                H_samples(sample, iH) = estimate_Hurst_HDDMA(fBm, theta);
            end
        end
        dlmwrite(sprintf('H_samples_wfbm_HDDMA_nSamples-%d_theta-%.2f_H0.05-0.1-0.95.txt', nSamples, theta), H_samples, 'delimiter','\t','precision', '%.5f')
    end

    for theta = theta_vec
        for iH = 1:length(input_H)
            H = input_H(iH)
            for sample = 1:nSamples
                fBm = fbmwoodchan(N,H);
                H_samples(sample, iH) = estimate_Hurst_HDDMA(fBm, theta);
            end
        end
        dlmwrite(sprintf('H_samples_fbmwoodchan_HDDMA_nSamples-%d_theta-%.2f_H0.05-0.1-0.95.txt', nSamples, theta), H_samples, 'delimiter','\t','precision', '%.5f')
    end

    for theta = theta_vec
        for iH = 1:length(input_H)
            H = input_H(iH)
            for sample = 1:nSamples
                fBm = fbmlevinson(N,H);
                H_samples(sample, iH) = estimate_Hurst_HDDMA(fBm, theta);
            end
        end
        dlmwrite(sprintf('H_samples_fbmlevinson_HDDMA_nSamples-%d_theta-%.2f_H0.05-0.1-0.95.txt', nSamples, theta), H_samples, 'delimiter','\t','precision', '%.5f')
    end

end % end 1D %

if true % 2D %
    nSamples = 100;
    N = 2^7;
    input_H = (.05):0.1:.95;
    H_samples = zeros(nSamples,length(input_H));

    for theta = theta_vec
        for iH = 1:length(input_H)
            H = input_H(iH)
            for sample = 1:nSamples
                fBm = synth2(N, H);
                H_samples(sample, iH) = estimate_Hurst_HDDMA(fBm, theta);
            end
        end
        dlmwrite(sprintf('H_samples_synth2_HDDMA_nSamples-%d_theta-%.2f_H0.05-0.1-0.95.txt', nSamples, theta), H_samples, 'delimiter','\t','precision', '%.5f')
    end
end % end 2D %