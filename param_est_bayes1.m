load -ascii param_est_data1.mat

x = param_est_data1;

Sigma = [1 0; 0 1]; % covariance
mu0 = [1 2]'; % a priori for mean
Sigma0 = [0.1 0; 0 0.1]; % a priori for covariance

Ni = [1 10 100 1000] % number of applied samples

muB = zeros(size(x, 1), length(Ni));
SigmaB = zeros(size(x, 1), size(x, 1), length(Ni));

for ii = 1:length(Ni)
  N = Ni(ii);

  % Bayesian estimate
  muB(:, ii) = Sigma0 * inv(Sigma0 + 1 / N * Sigma) * 1 / N * ...
    sum(x(:, 1:N), 2) + 1 / N * Sigma * inv(Sigma0 + 1 / N * Sigma) * mu0;
  SigmaB(:, :, ii) = Sigma0 * (Sigma0 + 1 / N * Sigma) * 1 / N * Sigma;
end

muB
[SigmaB(:, :, 1) SigmaB(:, :, 2) SigmaB(:, :, 3) SigmaB(:, :, 4)]
