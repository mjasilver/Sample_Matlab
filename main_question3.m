%% Load data

[X,w,h] = ReadBmpImage('stadium.bmp');
%%%%

Ks = [3,5,7];
figure % <-- this line will create a new window to plot. You can change/remove if you want
%Runs KMeans algorithm for 'Ks' number of K-means
for i=1:length(Ks)
    K = Ks(i);
    disp('number of K ')
    disp(K)
    disp('not k anymore')
    %% 3a) Executing MyKmeans
    % run kmeans on X, for K clusters, using MyKmeans
    [r,mu,J] = MyKMeans(X,K);
    %%%%

    % Generate new X_new with K colors resulting from MyKmeans
    % X_new will have same size as X, but with K colors only
    X_new=r*mu;
    %%%%
   
    subplot(2,3,i); % <--- this line will create a subplot in the window created by "figure". You can change/remove if you want
    % View image using X_new, using PlotBmpImage (the function is already
    % implemented)
    PlotBmpImage(X_new,w,h)
    %%%%
    
    %% 3b) Plot reconstruction error
    subplot(2,3,3+i); % <--- this line will create a subplot in the window created by "figure". You can change/remove if you want
    % Plot the reconstruction error J returned by MyKmeans, using PlotReconstructionError
    PlotReconstructionError(J)
    %%%%
    
end
