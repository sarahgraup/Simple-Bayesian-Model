%a simple Bayesian model

clear all; clc; close all;

%% Consider all possible hypotheses

% define possible theta values for hypothesis
theta = 0: 0.05 : 1;

%% Compute the likelihood term P(D|h) for each possible hypothesis
% define data
Nh = 3;
Nt = 2; 

% define likelihood
for i = 1:length(theta)
    likelihood(i) = (theta(i).^Nh).*((1-theta(i)).^Nt);
end;

% likelihood = (theta.^Nh).*((1-theta).^Nt);

% display the array of theta and corresponding likelhood values
[theta' likelihood']

% plot the likelihood as a function of theta
figure('Name','likelihood');
plot(theta, likelihood);
xlabel('\theta'); ylabel('Likelilhood');


% MLE estimation
[MaxL MaxID] = max(likelihood)

% display the MLE estimate
disp('MLE estimate: theta =');
MLEest = theta(MaxID);
disp(MLEest);

%% Compute the prior distribution P(h) for each possible hypothesis
% define parameters for priors
Vh = 10;
Vt = 10; 
aval = Vh+1;
bval = Vt+1;

% compute the prior distribution
prior = ((theta.^(aval-1)).*((1-theta).^(bval-1)))/beta(aval, bval);

% plot the prior distribution
figure('Name','Prior');
plot(theta, prior); 
xlabel('\theta'); ylabel('Prior');
sum(prior*0.05)


%% compute the posterior distribution P(h|D) by combining likelihood and prior
% post = ____________;
post = likelihood.*prior;

% MAP estimate
[M,ID] = max(post);

% display the MAP estimate
disp('MAP estimate: theta =');
MAPEst = theta(ID);
disp(MAPEst);

% plot the posterior distribution
figure('Name','Posterior');
plot(theta, post);
xlabel('\theta');ylabel('Post');

