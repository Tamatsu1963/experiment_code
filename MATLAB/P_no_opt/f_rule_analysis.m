%rule系の解析関数no opt用

function [rule, frule, porking, fcount] = f_rule_analysis (track_data,s3n)
    Fpattern = "F";
    fpattern = "f";
    f1pattern = "f1";
    f2pattern = "f2";
    f3pattern = "f3";
    f4pattern = "f4";
    Spattern = "S";
    Fn = NaN(1,10);
    fn = NaN(1,10);
    f1 = NaN(1,10);
    f2 = NaN(1,10);
    f3 = NaN(1,10);
    f4 = NaN(1,10);
    Sn = NaN(1,10);
if s3n>1
    L_track_data = track_data(:,1:2:20);
    Findx = contains(L_track_data,Fpattern);  %logical
    findx = contains(L_track_data,fpattern);
    f1_indx = contains(L_track_data,f1pattern);
    f2_indx = contains(L_track_data,f2pattern);
    f3_indx = contains(L_track_data,f3pattern);
    f4_indx = contains(L_track_data,f4pattern);
    Sindx = contains(L_track_data,Spattern);
    for ii=1:s3n
        Fn(1,ii)=nnz(Findx(:,ii));
        fn(1,ii)=nnz(findx(:,ii));
        f1(1,ii)=nnz(f1_indx(:,ii));
        f2(1,ii)=nnz(f2_indx(:,ii));
        f3(1,ii)=nnz(f3_indx(:,ii));
        f4(1,ii)=nnz(f4_indx(:,ii));
        Sn(1,ii)=nnz(Sindx(:,ii));
    end
    f1count = sum(f1,'omitnan');
    f2count = sum(f2,'omitnan');
    f3count = sum(f3,'omitnan');
    f4count = sum(f4,'omitnan');
    fcount = [f1count, f2count, f3count, f4count]';
    Ff=rmmissing(Fn+fn);
    Fncount = sum(Fn,'omitnan');
    if Fncount>0
        rule_count=sum(Ff==1);
        laps = s3n;
        rule =rule_count/laps;
        %porking = Fncount/laps;
        porking = Fncount;
        first_lap = laps;
        for m=1:9
            if Fn(1,m)==1
                first_lap = m+1;
                break
            end
        end
        frule_count=sum(Ff(1,first_lap:laps)==1);
        if (first_lap~=laps)&&(frule_count~=0)
            frule = (frule_count-1)/(laps-first_lap);
        else
            frule=0;
        end
    else
        rule = 0;
        frule = 0;
        porking = 0;
    end
elseif s3n==1
    L_track_data = track_data(:,1);
    Findx = contains(L_track_data,Fpattern);  %logical
    findx = contains(L_track_data,fpattern);
    f1_indx = contains(L_track_data,f1pattern);
    f2_indx = contains(L_track_data,f2pattern);
    f3_indx = contains(L_track_data,f3pattern);
    f4_indx = contains(L_track_data,f4pattern);
    Fn = nnz(Findx);
    fn = nnz(findx);
    f1 = nnz(f1_indx);
    f2 = nnz(f2_indx);
    f3 = nnz(f3_indx);
    f4 = nnz(f4_indx);
    Ff=rmmissing(Fn+fn);
    rule_count=sum(Ff==1);
    rule = rule_count;
    frule = rule;
    porking = Fn;
    f1count = sum(f1,'omitnan');
    f2count = sum(f2,'omitnan');
    f3count = sum(f3,'omitnan');
    f4count = sum(f4,'omitnan');
    fcount = [f1count, f2count, f3count, f4count]';
elseif s3n==0
    rule = NaN;
    frule = NaN;
    porking = NaN;
    fcount = [NaN(4,1)];
end

end