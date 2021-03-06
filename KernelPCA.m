function [eigenValue,eigenVector,newX] =  KernelPCA(X,ncomponents,sigma)
%% This is the matlab implementation for kernel Principal Component 
% Input Arguments : X input data set
% ncomponents : number of components to be returned
% sigma : value of variance for gaussian kernel
% Output arguments: eigenVector,eigenValue,Xnew

% dimensions of input data set
[m,n] = size(X);
% to do a kernel PCA we need phi(X)
% we will use guassian as our phi function

% calculating the kernel matrix
K = zeros(m,m);
for i=1:m
    for j = 1:m
K(i,j) = exp(- sigma *  abs((X(i,:)-X(j,:)) * (X(i,:)-X(j,:))'));        
    end
end

% Centered Kernel Matrix
one = ones(m,m) / m;
Kcentered =  K - (one * K) - (K * one) + (one * K * one);

% finding the eigen values and eigen vectors of the centered Kernel matrix

 [eigenVector,eigenValue] = eig(Kcentered);
 % sort the eigen values in descending order
 [eigenValue,order] = sort(diag(eigenValue), 'descend'); 
 eigenVector = eigenVector(:,order);
 eigenVector = eigenVector(:,1:ncomponents);
newX = Kcentered*eigenVector;
figure(1),
plot(newX(:,1),newX(:,2), 'b+');
title('Transformed data with 2 eigenvectors');
end
