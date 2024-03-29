function [w, c] = logistic_l1_train(data, labels, par)
%w is equivalent to the first d dimension of weights in logistic train
% c is the bias term, equivalent to the last dimension in weights in logistic train.
% Specify the options (use without modification).
opts.rFlag = 1;  % range of par within [0, 1].
opts.tol = 1e-6; % optimization precision
opts.tFlag = 4;  % termination options.
opts.maxIter = 1000; % maximum iterations.
[w, c] = LogisticR(data, labels, par, opts);