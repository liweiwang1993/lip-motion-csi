%%DWT the maincomponents
%%input:maincomponents
%%output:Dwtcomponents
function Dwtcomponents=DWTCSI(maincomponents,dwtnum)
   if (nargin<2)
       dwtnum=3;%%select the component num
   end
   warning('off');
 [~,sender,receiver,num]=size(maincomponents);
 [C,L] = wavedec(maincomponents(:,1,1,1),dwtnum,'db4');%%DWT3
  tmp = appcoef(C,L,'db4',3);
  [m,~]=size(tmp);
  dwtcomponents=zeros(m,sender,receiver,num);
for i=1:1:sender
    for j=1:1:receiver
        for k=1:1:num
        [C,L] = wavedec(maincomponents(:,i,j,k),dwtnum,'db4');
        cA3 = appcoef(C,L,'db4',dwtnum);
        dwtcomponents(:,i,j,k)=cA3;
        end
    end
end
Dwtcomponents=zeros(m,sender*receiver*num);
x=1;
for i=1:1:sender
    for j=1:1:receiver
        for k=1:1:num
            Dwtcomponents(:,x)=squeeze(dwtcomponents(:,i,j,k));
            x=x+1;
        end
    end
end
end