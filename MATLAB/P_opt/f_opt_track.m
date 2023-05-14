%周回数ごとに変換する関数(opt用)

function [track_data, s3n]=f_opt_track(D)
    RData = rmmissing(D); %NaNの削除
    lData = RData(:,1);  
    S3pattern = "s3";
    S3indx = contains(lData,S3pattern,'IgnoreCase',true);
    S3find = find(S3indx);
    s3n=size(S3find,1);
    track_data=strings(8,10*2);
    s3diff =diff(S3find);
    for k=1:s3n-1
        track_data(1:s3diff(k,1),2*k-1:2*k)=RData(S3find(k,1):S3find(k+1,1)-1,:);
    end
end