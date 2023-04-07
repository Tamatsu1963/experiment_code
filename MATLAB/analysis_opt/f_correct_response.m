%正答率(CR)と完答率(pCR)

function [CR, pCR, fpCR] =f_correct_response (track_data)
    L_track_data = track_data(:,1:2:20);
    Fpattern = "F";
    fpattern = "f";
    F_indx = contains(L_track_data,Fpattern);
    f_indx = contains(L_track_data,fpattern);

    F_session = sum(F_indx);
    f_session = sum(f_indx);
    Ff_session =F_session+f_session;

    CR_session =(4*(F_session)-((f_session).*(F_session)))/4;
    CR =mean(CR_session);
    pCR_session =(F_session==1)&(Ff_session==1);
    pCR =(sum(pCR_session))/numel(pCR_session);
    laps = numel(Ff_session);
    flap = laps;
    for i=1:laps
        if F_session(1,i)==1
            flap = i;
            break
        end
    end
    if flap~=laps
        fpCR = (sum(pCR_session(1,flap:laps)))/(laps-flap+1);
    else
        fpCR = 0;
    end
end