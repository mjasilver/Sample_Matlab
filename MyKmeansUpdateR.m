%%
% The MyKmeansUpdateR updates r, given the current mu values
%
% The parameters received are:
% - X (N x 3): Matrix for a color image RGB, where N is the number of
% pixels. 
% - K (1 x 1): Number of clusters (number of colors in the compression)
% - mu (K x 3): Contains the K centroids found, representing the K colors
% learned
%
% The function should return:
% - r (N x K): Contains 0 or 1, where r(n,k) contains 1 if pixel n belongs to
% cluster k, otherwise 0
%
function r = MyKmeansUpdateR(X,K,mu)
[N,cX]=size(X);
RowX=zeros(1,3); %%Will receive the target row of X
eucVEC=zeros(1,3);  %%Will store the euclidean distances for the row

for t=1:N %%Iterates through every row in the matrix
  for j=1:K  %%Iterates for all means. So, each row tests against all means
    RowX=X(t,:);    %R is the current row of X
    XMinusMu=RowX-mu(j,:); %%XminusMu is now the distance of each RGB color from MUi. Need to convert to euclidean now
    eucDist=XMinusMu*XMinusMu';    %%Squares the sum. Almost at the euclidean distance -- just need the square root now
    eucDist=sqrt(eucDist);  %%Square root makes it Euclidean distance
     eucVEC(1,j)=eucDist;  %%euc stores all the euclidean distances
  end %%ends j
  for q=1:K
  r(t,q)=0;   %%clear the row before you reassign the new 1's and 0's
  end
   [M,I]=min(eucVEC,[],2);
   r(t,I)=1;
end %%ends t
    
%%%%
end

