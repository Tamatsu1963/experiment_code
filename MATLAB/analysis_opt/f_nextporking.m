%NP用

function NP = f_nextporking (track_data)
    L_track_data = track_data(:,1:2:20);
    S1pattern = "S1";
    S2pattern = "S2";
    S3pattern = "S3";
    S4pattern = "S4";
    %Fpattern = "F";
    f1pattern = "f1";
    f2pattern = "f2";
    f3pattern = "f3";
    f4pattern = "f4";
    lappattern = "s3";

    S1_indx = contains(L_track_data,S1pattern);
    S2_indx = contains(L_track_data,S2pattern);
    S3_indx = contains(L_track_data,S3pattern);
    S4_indx = contains(L_track_data,S4pattern);
    %F_indx = contains(L_track_data,Fpattern);
    f1_indx = contains(L_track_data,f1pattern);
    f2_indx = contains(L_track_data,f2pattern);
    f3_indx = contains(L_track_data,f3pattern);
    f4_indx = contains(L_track_data,f4pattern);
    lap_indx =contains(L_track_data,lappattern,"IgnoreCase",true);

    %Fn_session = sum(F_indx);
    f1_session = sum(f1_indx);
    f2_session = sum(f2_indx);
    f3_session = sum(f3_indx);
    f4_session = sum(f4_indx);
    s1=nnz(sum(S1_indx));
    s2=nnz(sum(S2_indx));
    s3=nnz(sum(S3_indx));
    s4=nnz(sum(S4_indx));
    laps = nnz(sum(lap_indx));
    if laps>0
        if s1>1
            f4 = sum(f4_session);
            NP = f4/laps;
        elseif s2>1
            f1 = sum(f1_session);
            NP = f1/laps;
        elseif s3>1
            f2 = sum(f2_session);
            NP = f2/laps;
        elseif s4>1
            f3=sum(f3_session);
            NP = f3/laps;
        end
    else
        NP=0;
    end

end