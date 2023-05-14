%no opt analysis average ,day and session
%moved only(15 session)
clear

cd C:\Users\sp_tamatsu\Documents\MATLAB\analysis\behavior\injury
I =load("moved_only_n7.mat");
C =load("movedC_only_n7.mat");

frule = vertcat(I.t_frule,C.t_frule);
laps = vertcat(I.t_laps,C.t_laps);
pCR = vertcat(I.t_pCR,C.t_pCR);
rule = vertcat(I.t_rule,C.t_rule);

Injury = ['y','y','y','y','y','y','y','n','n','n','n','n','n','n']';

Tfrule = table(Injury,frule(:,1),frule(:,2),frule(:,3),frule(:,4),frule(:,5),...
'VariableNames',{'Injury','day1','day2','day3','day4','day5'});

Time = [1 2 3 4 5]';

rm_frule = fitrm(Tfrule,'day1-day5 ~ Injury','WithinDesign',Time);

ranovatbl_frule = ranova(rm_frule,'WithinModel',Time);