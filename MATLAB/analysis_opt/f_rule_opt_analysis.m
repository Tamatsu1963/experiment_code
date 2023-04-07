function [rule, frule, porking] = f_rule_opt_analysis (track_data,s3n)

    L_track_data = track_data(:,1:2:20);
    Fpattern = "F";
    fpattern = "f";
    f1pattern = "f1";
    f2pattern = "f2";
    f3pattern = "f3";
    f4pattern = "f4";
    Findx = contains(L_track_data,Fpattern);  %logical
    findx = contains(L_track_data,fpattern);
    f1_indx = contains(L_track_data,f1pattern);
    f2_indx = contains(L_track_data,f2pattern);
    f3_indx = contains(L_track_data,f3pattern);
    f4_indx = contains(L_track_data,f4pattern);
    
    Fn = NaN(1,10);
    fn = NaN(1,10);
    f1 = NaN(1,10);
    f2 = NaN(1,10);
    f3 = NaN(1,10);
    f4 = NaN(1,10);

    for ii=1:s3n-1
        Fn(1,ii)=nnz(Findx(:,ii));
        fn(1,ii)=nnz(findx(:,ii));
        f1(1,ii)=nnz(f1_indx(:,ii));
        f2(1,ii)=nnz(f2_indx(:,ii));
        f3(1,ii)=nnz(f3_indx(:,ii));
        f4(1,ii)=nnz(f4_indx(:,ii));
        
    end
    Ff=rmmissing(Fn+fn);
    Fncount = sum(Fn,'omitnan');
    rule_count=sum(Ff==1);
    laps = nnz(Ff);
    rule =rule_count/laps;
    porking = Fncount/laps;
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

