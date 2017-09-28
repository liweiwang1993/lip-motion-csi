%%get the raw CSI(not clean)
%file='csi-lip-6-23-train//6-23-all-train//6-23-all-1.dat';
%%input:filename,length:the collect csi data filename,csi length you need
%%output:raw csi data---4-D complex data
function csi=GetRawCSI(file,sender,receiver)
    csi_trace=read_bf_file(file);%%read_csi
    [length,~]=size(csi_trace);
    channel=30;%%channel
    csi=zeros(length,sender,receiver,channel);%%initialize the raw csi
    for i=1:1:length
        csi_entry=csi_trace{i};
        a=get_scaled_csi(csi_entry);%%get the scaled csi
        for k=1:1:sender
            csi(i,k,:,:)=a(k,:,:);
        end
    end
end