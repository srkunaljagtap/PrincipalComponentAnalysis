function [eigenVector,newX,eigenValue] = PrincipalComponentAnalysis(X)
%% this is the matlab implementation for Principal Component analysis

% Input arguments: X input dataset 
% Output arguments: 
 % find the mean of the data in columns
 mu = mean(X);
 % centered data at mean
 Xc =X - repmat(mu, [size(X, 1) 1]);
 % find the covariance matrix
 C = (Xc' * Xc) / (size(X, 1) -1);
 % find eigen vector and eigen values of covarince matrix
 [eigenVector,eigenValue] = eig(C);
 % sort the eigen values in descending order
 [eigenValue,order] = sort(diag(eigenValue), 'descend'); 
 eigenVector = eigenVector(:,order);
newX = Xc*eigenVector(:,1:end);

%% Transformeddata with 2 eigenvectors
plot(newX(:,1),newX(:,2), 'r+');
Cnew = (newX' * newX) / (size(X, 1) -1);
[Vnew Dnew] = eig(Cnew);
hold on
A =10 * Vnew';
plot([-A(1,1) A(1,1)],[-A(1,2) A(1,2)],'g:');
plot([-A(2,1) A(2,1)],[-A(2,2) A(2,2)],'b:');
title('Transformeddata with 2 eigenvectors');
end