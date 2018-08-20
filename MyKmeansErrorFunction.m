%%
% The MyKmeansErrorFunction calculated the Kmeans error function
%
% The parameters received are:
% - X (N x 3): Matrix for a color image RGB, where N is the number of
% pixels. 
% - r (N x K): Contains 0 or 1, where r(n,k) contains 1 if pixel n belongs to
% cluster k, otherwise 0
% - mu (K x 3): Contains the K centroids found, representing the K colors
% learned
%
% The function should return:
% - j (1 x 1): Error function calculated using the current mu and r
%
function j = MyKmeansErrorFunction(X,r,mu)
[rowsX,colsX]=size(X);
[rowsR, colsR]=size(r); %%colsR is the one you want here, since it's the K-means you're using
[rowsMu, colsMu]=size(mu)
eucDist=zeros(1,colsR);
EUC=zeros(1,colsR);
j=0;

%Measuring the Euclidean distance for each of the k-means

for n=1:rowsX
rowOfX=X(n,:); %%This row vector holds the values of the nth row of matrix X
EUC(1,:)=0;

for k=1:rowsMu
rowOfMu=mu(k,:); %%This row vector holds the values of Mu's kth row
%Calculate Euclidean distance, step by step
eucDistVec=rowOfX-rowOfMu; %Subtract out the mean
euclideanDistance=eucDistVec*eucDistVec';  %%Square the values
euclideanDistance=sqrt(euclideanDistance);  %%Take the square root of the euclideanDistance value to get the real Euclidean Distance
EUC(1,k)=euclideanDistance;
end

%%Now, you have the euclidean distances for each of the k-means. Take the
%%one with the smallest distance
[M,I]=min(EUC);
r(n,:)=0;
r(n,I)=1;
j=j+M;
end

%disp('here is J')
%disp(j)
end

