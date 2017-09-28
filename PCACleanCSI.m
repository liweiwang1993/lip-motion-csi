%%PCA the filter csi
%%input:filter the csi data
%%output:PCA csi data
function maincomponents=PCACleanCSI(filtercsi,num)
    if (nargin<2)
       num=3;%%select the component num
    end
    warning('off');
    startc=2;%%start component
    endc=startc+num-1;%%end component
    [length,sender,receiver,~]=size(filtercsi);
    maincomponents=zeros(length,sender,receiver,num);
for i=1:1:sender
    for j=1:1:receiver
        a=squeeze(filtercsi(:,i,j,:));
        %[coef,score,latent,t2] = pca(a);
        coef=pca(a);
        maincomponents(:,i,j,:)=a*coef(:,startc:endc);
    end
end
end