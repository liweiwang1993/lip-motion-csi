%%remove the multiple path distortion to clean the csi
%%input:raw csi---4-D complex data
%%output:remove the multiple path csi---4-D complex data
function removedCSIInformation=RemoveMultiplePath(csi)
warning('off');
[length,sender,receiver,channel] = size(csi);
removedCSIInformation=zeros(length,sender,receiver,channel);
interval = 20/30;%%Frequency interval
Sf=2433;%%starting frequency
Ef=2453;%%Ending frequency
for i=1:1:length
    for j=1:1:sender
        for k=1:1:receiver
            a=csi(i,j,k,:);
            b=a(:,:);
%figure
%plot(abs(csi));
%hold on
% approximate interval of subcarriers
            
%freq: 2431-2453 MHz 
%number of zeros before CSI
            numZeros = ceil(Sf/interval);
%make up carrier frequency response
            cfr = [zeros(1,numZeros),b];
%slot of ifft
            N = numZeros + channel;
%get approximate channel impluse response
            cir = ifft(cfr,N);
            t = 0:1/(Ef*2):1;
            [~,tm]=size(t);
%%delay=0.5ms
            RemovedCir=cir(1:round(tm/2));
            RemovedCSI=fft(RemovedCir);
            RemovedCSI=RemovedCSI((Sf+interval):interval:Ef);
            removedCSIInformation(i,j,k,:)=RemovedCSI;
        end
    end
end