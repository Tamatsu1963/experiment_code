%周回数ごとに変換する関数(no opt用)

function [track_data, s3n]=f_no_opt_track(D)
    RData = rmmissing(D); %NaNの削除
    if (RData(1,1)=="s3")||(RData(1,1)=="S3")
        lData = RData(:,1);  
        S3pattern = "s3";
        S3indx = contains(lData,S3pattern,'IgnoreCase',true);
        S3find = find(S3indx);
        s3n=size(S3find,1);
        track_data=strings(8,20);
        s3diff =diff(S3find);
        TF = isempty(s3diff);
        if TF==0
            for k=1:s3n-1
                track_data(1:s3diff(k,1),2*k-1:2*k)=RData(S3find(k,1):S3find(k+1,1)-1,:);
            end
        else
            track_data = RData;
        end
        s3n=s3n-1;
    else
        track_data = RData;
        s3n=NaN;
    end
end