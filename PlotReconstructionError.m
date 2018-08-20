%%
% The PlotReconstructionError plot the reconstruction error in J, so that 
% even position have one color and odd positions another color (you can, 
% for example, call scatter twice).
%
% The parameters received are:
% - J (iter*2 x 1): Vector with all the reconstruction errors returned by 
% MyKMeans
%
function PlotReconstructionError(J)
[a,b]=size(J);
rows=a/2;
jMu=zeros(rows,1);
jR=zeros(rows,1);
xAxis=zeros(rows,1);
for i=1:rows
jR(i,1)=J(i*2-1,1);
jMu(i,1)=J(i*2,1);
xAxis(i,1)=i;
end %%Now you have two vectors, one each for the Rs and the Mus

color1=[.1,.1,.1]
color2=[.2,.2,.2]

%%scatter(jR(:,1),jMu(:,2),1,y_pred(:,1))
scatter(xAxis(:,1),jR(:,1),1,color1)
hold on
scatter(xAxis(:,1),jMu(:,1),1,color2)
%%%%
end

