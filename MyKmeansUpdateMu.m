%%
% The MyKmeansUpdateMu updates mu, given the current r values
%
% The parameters received are:
% - X (N x 3): Matrix for a color image RGB, where N is the number of
% pixels. 
% - K (1 x 1): Number of clusters (number of colors in the compression)
% - r (N x K): Contains 0 or 1, where r(n,k) contains 1 if pixel n belongs to
% cluster k, otherwise 0
%
% The function should return:
% - mu (K x 3): Contains the K centroids found, representing the K colors
% learned
%
function mu = MyKmeansUpdateMu(X,K,r)
%disp('enters updateMu')
mu=zeros(K,3);
[p,q]=size(r)
S = sum(r); %%S is a row matrix containing the sum of each column in r. This is the total number of points in each cluster
%disp('this is S')
%disp(S)
mu = r'*X; %%This creates a matrix where each row is mu; each column is a d-coordinate for each mu. So, each row is basically the coordinates of each mean. However, you still need to divide by the elements of matrix S to get the mean (right now, it's just the sum)
for a=1:K %%This is a loop that divides each row of mu by the number of entries that were in that centroid. So now, you've turned Mu into a matrix where each row holds the coordinates of the centroid.
   mu(a,:)=mu(a,:)/S(1,a);
end 
%%%%
end

