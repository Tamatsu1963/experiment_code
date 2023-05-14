function [CR, pCR] =f_no_opt_correct_response (track_data,s3n)
    Fpattern = "F";
    fpattern = "f";    
    if s3n>1
        L_track_data = track_data(:,1:2:20);
        F_indx = contains(L_track_data,Fpattern);
        f_indx = contains(L_track_data,fpattern);
    
        F_session = sum(F_indx);
        f_session = sum(f_indx);
        Ff_session =F_session+f_session;
    
        CR_session =(4*(F_session)-((f_session).*(F_session)))/4;
        CR =mean(CR_session,'omitnan');
        pCR_session =(F_session==1)&(Ff_session==1);
        pCR =(sum(pCR_session))/numel(pCR_session);
    elseif s3n==1
        L_track_data = track_data(:,1);
        F_indx = contains(L_track_data,Fpattern);
        f_indx = contains(L_track_data,fpattern);
    
        F_session = sum(F_indx);
        f_session = sum(f_indx);
        Ff_session =F_session+f_session;
    
        CR_session =(4*(F_session)-((f_session).*(F_session)))/4;
        CR =mean(CR_session);
        pCR_session =(F_session==1)&(Ff_session==1);
        pCR =(sum(pCR_session))/numel(pCR_session);
    else
        CR = NaN;
        pCR = NaN;
    end
end