function [h0,h1,f0,f1]=wf(wftype)

[h0,h1,f0,f1]=getfilters(wavelet(1,wftype,[],''));
