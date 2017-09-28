%%filter the noise from the csi signal
%%input:remove the multiple path csi signal
%%output:filter the csi
function filtercsi=FilterCSI(removedCSIInformation)
load SpeakHd2.mat;%%butterwords bandpass filter 0-5hz
[length,sender,receiver,channel]=size(removedCSIInformation);
amptitude=zeros(length,sender,receiver,channel);
filtercsi=zeros(length,sender,receiver,channel);
%%csi=squeeze(csi);
%%t=1:1:30;
%%abs(csi(1,1,:))
%%figure;
%for i=1:1:2
%    for j=1:1:3
%         plot(t,squeeze(db(abs(csi(i,j,:)))));
%         hold on;
%     end
% end
% hold off;
%for k=1:1:length
%for i=1:1:sender
%    for j=1:1:receiver
%        amptitude(k,i,j,:)=db(abs(removedCSIInformation(k,i,j,:)));
%    end
%end
%end
amptitude(:,:,:,:)=(abs(removedCSIInformation(:,:,:,:)));
for i=1:1:sender
    for j=1:1:receiver
        for k=1:1:channel
            filtercsi(:,i,j,k)=filter(SpeakHd2,amptitude(:,i,j,k));
        end
    end
end