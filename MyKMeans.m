%%
% The MyKMeans performs the Kmeans algorithm
%
% The parameters received are:
% - X (N x 3): Matrix for a color image RGB, where N is the number of
% pixels. 
% - K (1 x 1): Number of clusters (number of colors in the compression)
%
% The function should return:
% - r (N x K): Contains 0 or 1, where r(n,k) contains 1 if pixel n belongs to
% cluster k, otherwise 0
% - mu (K x 3): Contains the K centroids found, representing the K colors
% learned
% - J (2*iter x 1): Error function value calculated after every r-update
% and mu-update. If MyKmeans converges in iter iterations, the vectors has
% 2*iter values
%
function [r,mu,J] = MyKMeans(X,K)
    %Limits number of iterations to 100
    max_iter = 100;

    % initial mu
    N = size(X,1);
    m_idx = randperm(N);
    mu = X(m_idx(1:K),:); % <-- mu starts with random rows of X
    
    r=zeros(13400,K);
    
    for iter=1:max_iter
        if iter==1
            J=zeros(2,1); %%Initialize J
        end
        if iter>1
            J=[J;zeros(2,1)]; %%Add two rows to the end of J
        end
        
        %% r update
        %Recall that r is the matrix containing whether a pixel belong to
        %k-centroid i
        % update r, using MyKmeansUpdateR
        disp('entering updateR')
        r = MyKmeansUpdateR(X,K,mu);
        disp('exiting updateR')
        
        % calculate error function, using current r and mu
        disp('entering errorFunction')
        jR = MyKmeansErrorFunction(X,r,mu);
        J(2*iter-1,1)=jR;
        disp('exiting errorFunction')

        
        %% mu update
        %Recall that mu is the Kx3 matrix for the K-colors learned
        % update mu, using MyKmeansUpdateMu
        disp('about to get to updateMu')
        mu = MyKmeansUpdateMu(X,K,r)
        disp('exiting updateMu')

        % calculate error function, using current r and mu
        jMu = MyKmeansErrorFunction(X,r,mu);
        %%%%
        J(2*iter,1)=jMu;        
        

        %% check convergence
        % check convergence by checking if the the error function decreased
        % less than 1e-6 from the previous iteration. Break loop if
        % converged
   if iter>1
        jDelta=sqrt((J(2*iter,1)-J(2*iter-2,1))^2)
        if jDelta<0.000001  
        iterations=iter;
        break
        end
   end
        
    end

end

