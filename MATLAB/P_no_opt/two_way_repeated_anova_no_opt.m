clear,clc
load_path = 'C:\Users\sp_tamatsu\Documents\MATLAB\analysis\behavior\full_data\no_opt';
cd (load_path)
fixed2 = load("fixed2_n6.mat");
fixed2C = load("fixed2C_n7.mat");
fixed3 = load("fixed3_n6.mat");
fixed3C = load("fixed3C_n7.mat");

w1 = {'C','C','C','C','C','A','A','A','A','A'}';
w2 = {'d1','d2','d3','d4','d5','d1','d2','d3','d4','d5'}';
within1=table(w1,w2,'VariableNames',{'Condition','day'});
%% Injury
I_fpCR = [fixed2.t_pCR fixed3.t_pCR];
T_I_fpCR = table(I_fpCR(:,1),I_fpCR(:,2),I_fpCR(:,3),I_fpCR(:,4),I_fpCR(:,5), ...
    I_fpCR(:,6),I_fpCR(:,7),I_fpCR(:,8),I_fpCR(:,9),I_fpCR(:,10), ...
    'VariableNames',{'C_1','C_2','C_3','C_4','C_5','A_1','A_2','A_3','A_4','A_5'});
rm_I_fpCR = fitrm(T_I_fpCR,'C_1-A_5~1','WithinDesign',within1);
[ranovatbl_I_fpCR] = ranova(rm_I_fpCR,'WithinModel','Condition*day');
I_fpCR_mult1 = multcompare(rm_I_fpCR,'Condition');
I_fpCR_mult2 = multcompare(rm_I_fpCR,'day');
I_fpCR_mult3 = multcompare(rm_I_fpCR,'Condition','By','day');
%%
C_fpCR = [fixed2C.t_pCR fixed3C.t_pCR];
T_C_fpCR = table(C_fpCR(:,1),C_fpCR(:,2),C_fpCR(:,3),C_fpCR(:,4),C_fpCR(:,5), ...
    C_fpCR(:,6),C_fpCR(:,7),C_fpCR(:,8),C_fpCR(:,9),C_fpCR(:,10), ...
    'VariableNames',{'C_1','C_2','C_3','C_4','C_5','A_1','A_2','A_3','A_4','A_5'});
rm_C_fpCR = fitrm(T_C_fpCR,'C_1-A_5~1','WithinDesign',within1);
[ranovatbl_C_fpCR] = ranova(rm_C_fpCR,'WithinModel','Condition*day');
C_fpCR_mult1 = multcompare(rm_C_fpCR,'Condition');
C_fpCR_mult2 = multcompare(rm_C_fpCR,'day');
C_fpCR_mult3 = multcompare(rm_C_fpCR,'Condition','By','day');