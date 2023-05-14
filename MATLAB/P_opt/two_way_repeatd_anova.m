%% two-way repeatd anova opt
clear,clc
cd C:\Users\sp_tamatsu\Documents\MATLAB\analysis\behavior\full_data\opt
hn_light = load('no_light_n6.mat');
hpost = load('high_post_n6.mat');
hpre = load('high_pre_n6.mat');
noreward = load("no_reward2_n6.mat");
ln_light = load("ln_light_n5.mat");
lpost = load("low_post_n5.mat");
lpre = load("low_pre_n5.mat");

w1 = {'C','C','C','C','C','A','A','A','A','A'}';
w2 = {'d1','d2','d3','d4','d5','d1','d2','d3','d4','d5'}';
within1=table(w1,w2,'VariableNames',{'Condition','day'});
%% hpost pCR
post_fpCR = [hn_light.t_fpCR hpost.t_fpCR];
T_post_fpCR = table(post_fpCR(:,1),post_fpCR(:,2),post_fpCR(:,3),post_fpCR(:,4),post_fpCR(:,5), ...
    post_fpCR(:,6),post_fpCR(:,7),post_fpCR(:,8),post_fpCR(:,9),post_fpCR(:,10), ...
    'VariableNames',{'C_1','C_2','C_3','C_4','C_5','A_1','A_2','A_3','A_4','A_5'});
rm_post_fpCR = fitrm(T_post_fpCR,'C_1-A_5~1','WithinDesign',within1);
[ranovatbl_post_fpCR] = ranova(rm_post_fpCR,'WithinModel','Condition*day');
post_fpCR_mult1 = multcompare(rm_post_fpCR,'Condition');
post_fpCR_mult2 = multcompare(rm_post_fpCR,'day');
post_fpCR_mult3 = multcompare(rm_post_fpCR,'Condition','By','day');

% fig = uifigure('Name','test','Position',[100 100 750 550]);
% uit=uitable(fig,'Data',post_fpCR_mult1,'Position',[20 20 700 500]);
% exportapp(fig,'testm1.pdf')
%% hpost rule
post_frule = [hn_light.t_frule hpost.t_frule];
T_post_frule = table(post_frule(:,1),post_frule(:,2),post_frule(:,3),post_frule(:,4),post_frule(:,5), ...
    post_frule(:,6),post_frule(:,7),post_frule(:,8),post_frule(:,9),post_frule(:,10), ...
    'VariableNames',{'C_1','C_2','C_3','C_4','C_5','A_1','A_2','A_3','A_4','A_5'});
rm_post_frule = fitrm(T_post_frule,'C_1-A_5~1','WithinDesign',within1);
[ranovatbl_post_frule] = ranova(rm_post_frule,'WithinModel','Condition*day');
post_frule_mult1 = multcompare(rm_post_frule,'Condition');
post_frule_mult2 = multcompare(rm_post_frule,'day');
post_frule_mult3 = multcompare(rm_post_frule,'Condition','By','day');
%% hpre pCR
pre_pCR = [hn_light.t_pCR hpre.t_pCR];
T_pre_pCR = table(pre_pCR(:,1),pre_pCR(:,2),pre_pCR(:,3),pre_pCR(:,4),pre_pCR(:,5), ...
    pre_pCR(:,6),pre_pCR(:,7),pre_pCR(:,8),pre_pCR(:,9),pre_pCR(:,10), ...
    'VariableNames',{'C_1','C_2','C_3','C_4','C_5','A_1','A_2','A_3','A_4','A_5'});
rm_pre_pCR = fitrm(T_pre_pCR,'C_1-A_5~1','WithinDesign',within1);
[ranovatbl_pre_pCR] = ranova(rm_pre_pCR,'WithinModel','Condition*day');
pre_pCR_mult1 = multcompare(rm_pre_pCR,'Condition');
pre_pCR_mult2 = multcompare(rm_pre_pCR,'day');
pre_pCR_mult3 = multcompare(rm_pre_pCR,'Condition','By','day');
%% hpre rule
pre_rule = [hn_light.t_rule hpre.t_rule];
T_pre_rule = table(pre_rule(:,1),pre_rule(:,2),pre_rule(:,3),pre_rule(:,4),pre_rule(:,5), ...
    pre_rule(:,6),pre_rule(:,7),pre_rule(:,8),pre_rule(:,9),pre_rule(:,10), ...
    'VariableNames',{'C_1','C_2','C_3','C_4','C_5','A_1','A_2','A_3','A_4','A_5'});
rm_pre_rule = fitrm(T_pre_rule,'C_1-A_5~1','WithinDesign',within1);
[ranovatbl_pre_ruel] = ranova(rm_pre_rule,'WithinModel','Condition*day');
pre_rule_mult1 = multcompare(rm_pre_rule,'Condition');
pre_rule_mult2 = multcompare(rm_pre_rule,'day');
pre_rule_mult3 = multcompare(rm_pre_rule,'Condition','By','day');
%% no reward pCR
nrew_fpCR = [hn_light.t_fpCR noreward.t_fpCR];
T_nrew_fpCR = table(nrew_fpCR(:,1),nrew_fpCR(:,2),nrew_fpCR(:,3),nrew_fpCR(:,4),nrew_fpCR(:,5), ...
    nrew_fpCR(:,6),nrew_fpCR(:,7),nrew_fpCR(:,8),nrew_fpCR(:,9),nrew_fpCR(:,10), ...
    'VariableNames',{'C_1','C_2','C_3','C_4','C_5','A_1','A_2','A_3','A_4','A_5'});
rm_nrew_fpCR = fitrm(T_nrew_fpCR,'C_1-A_5~1','WithinDesign',within1);
[ranovatbl_nrew_fpCR] = ranova(rm_nrew_fpCR,'WithinModel','Condition*day');
nrew_fpCR_mult1 = multcompare(rm_nrew_fpCR,'Condition');
nrew_fpCR_mult2 = multcompare(rm_nrew_fpCR,'day');
nrew_fpCR_mult3 = multcompare(rm_nrew_fpCR,'Condition','By','day');
%% no reward rule
nrew_frule = [hn_light.t_frule noreward.t_frule];
T_nrew_frule = table(nrew_frule(:,1),nrew_frule(:,2),nrew_frule(:,3),nrew_frule(:,4),nrew_frule(:,5), ...
    nrew_frule(:,6),nrew_frule(:,7),nrew_frule(:,8),nrew_frule(:,9),nrew_frule(:,10), ...
    'VariableNames',{'C_1','C_2','C_3','C_4','C_5','A_1','A_2','A_3','A_4','A_5'});
rm_nrew_frule = fitrm(T_nrew_frule,'C_1-A_5~1','WithinDesign',within1);
[ranovatbl_nrew_frule] = ranova(rm_nrew_frule,'WithinModel','Condition*day');
nrew_frule_mult1 = multcompare(rm_nrew_frule,'Condition');
nrew_frule_mult2 = multcompare(rm_nrew_frule,'day');
nrew_frule_mult3 = multcompare(rm_nrew_frule,'Condition','By','day');
%% lpost pCR
lpost_fpCR = [ln_light.t_fpCR lpost.t_fpCR];
T_lpost_fpCR = table(lpost_fpCR(:,1),lpost_fpCR(:,2),lpost_fpCR(:,3),lpost_fpCR(:,4),lpost_fpCR(:,5), ...
    lpost_fpCR(:,6),lpost_fpCR(:,7),lpost_fpCR(:,8),lpost_fpCR(:,9),lpost_fpCR(:,10), ...
    'VariableNames',{'C_1','C_2','C_3','C_4','C_5','A_1','A_2','A_3','A_4','A_5'});
rm_lpost_fpCR = fitrm(T_lpost_fpCR,'C_1-A_5~1','WithinDesign',within1);
[ranovatbl_lpost_fpCR] = ranova(rm_lpost_fpCR,'WithinModel','Condition*day');
lpost_fpCR_mult1 = multcompare(rm_lpost_fpCR,'Condition');
lpost_fpCR_mult2 = multcompare(rm_lpost_fpCR,'day');
lpost_fpCR_mult3 = multcompare(rm_lpost_fpCR,'Condition','By','day');
%% lpost rule
lpost_frule = [ln_light.t_frule lpost.t_frule];
T_lpost_frule = table(lpost_frule(:,1),lpost_frule(:,2),lpost_frule(:,3),lpost_frule(:,4),lpost_frule(:,5), ...
    lpost_frule(:,6),lpost_frule(:,7),lpost_frule(:,8),lpost_frule(:,9),lpost_frule(:,10), ...
    'VariableNames',{'C_1','C_2','C_3','C_4','C_5','A_1','A_2','A_3','A_4','A_5'});
rm_lpost_frule = fitrm(T_lpost_frule,'C_1-A_5~1','WithinDesign',within1);
[ranovatbl_lpost_frule] = ranova(rm_lpost_frule,'WithinModel','Condition*day');
lpost_frule_mult1 = multcompare(rm_lpost_frule,'Condition');
lpost_frule_mult2 = multcompare(rm_lpost_frule,'day');
lpost_frule_mult3 = multcompare(rm_lpost_frule,'Condition','By','day');
%% lpre pCR
lpre_pCR = [ln_light.t_pCR lpre.t_pCR];
T_lpre_pCR = table(lpre_pCR(:,1),lpre_pCR(:,2),lpre_pCR(:,3),lpre_pCR(:,4),lpre_pCR(:,5), ...
    lpre_pCR(:,6),lpre_pCR(:,7),lpre_pCR(:,8),lpre_pCR(:,9),lpre_pCR(:,10), ...
    'VariableNames',{'C_1','C_2','C_3','C_4','C_5','A_1','A_2','A_3','A_4','A_5'});
rm_lpre_pCR = fitrm(T_lpre_pCR,'C_1-A_5~1','WithinDesign',within1);
[ranovatbl_lpre_pCR] = ranova(rm_lpre_pCR,'WithinModel','Condition*day');
lpre_pCR_mult1 = multcompare(rm_lpre_pCR,'Condition');
lpre_pCR_mult2 = multcompare(rm_lpre_pCR,'day');
lpre_pCR_mult3 = multcompare(rm_lpre_pCR,'Condition','By','day');
%% lpre rule
lpre_rule = [ln_light.t_rule lpre.t_rule];
T_lpre_rule = table(lpre_rule(:,1),lpre_rule(:,2),lpre_rule(:,3),lpre_rule(:,4),lpre_rule(:,5), ...
    lpre_rule(:,6),lpre_rule(:,7),lpre_rule(:,8),lpre_rule(:,9),lpre_rule(:,10), ...
    'VariableNames',{'C_1','C_2','C_3','C_4','C_5','A_1','A_2','A_3','A_4','A_5'});
rm_lpre_rule = fitrm(T_lpre_rule,'C_1-A_5~1','WithinDesign',within1);
[ranovatbl_lpre_rule] = ranova(rm_lpre_rule,'WithinModel','Condition*day');
lpre_rule_mult1 = multcompare(rm_lpre_rule,'Condition');
lpre_rule_mult2 = multcompare(rm_lpre_rule,'day');
lpre_rule_mult3 = multcompare(rm_lpre_rule,'Condition','By','day');
%%
cd C:\Users\sp_tamatsu\Documents\MATLAB\analysis\behavior\full_data\opt
save("two_way_repeated_anova.mat")
%%
% [hpost_pCR_ra, hpost_pCR_m1, hpost_pCR_m2, hpost_pCR_m3] = fl_test(hn_light.t_fpCR,hpost.t_fpCR,"test");
% f1 = uifigure;
% f1.Position = [100 100 750 550];
% uit = uitable('Parent',f1,'Position',[25 30 700 500]);
% uit.Data = hpost_pCR_m3;
% exportapp(f1,'testm3.pdf')
% %% function
% function [ranovatbl, mult1, mult2, mult3] =fl_test(data1,data2,savename)
%     w1 = {'C','C','C','C','C','A','A','A','A','A'}';
%     w2 = {'d1','d2','d3','d4','d5','d1','d2','d3','d4','d5'}';
%     within1=table(w1,w2,'VariableNames',{'Condition','day'});
%     dataset = [data1 data2];
%     T_dataset = table(dataset(:,1),dataset(:,2),dataset(:,3),dataset(:,4),dataset(:,5), ...
%        dataset(:,6),dataset(:,7),dataset(:,8),dataset(:,9),dataset(:,10), ...
%         'VariableNames',{'C_1','C_2','C_3','C_4','C_5','A_1','A_2','A_3','A_4','A_5'});
%     rm = fitrm(T_dataset,'C_1-A_5~1','WithinDesign',within1);
%     [ranovatbl] = ranova(rm,'WithinModel','Condition*day');
%     mult1 = multcompare(rm,'Condition');
%     mult2 = multcompare(rm,'day');
%     mult3 = multcompare(rm,'Condition','By','day');
% %     fl_pdf(mult1,"mult1",savename)
% %     fl_pdf(mult2,"mult2",savename)
% %     fl_pdf(mult3,"mult3",savename)
% end
% 
% function [f, uit] = fl_pdf(table)
%     f = uifigure;
%     f.Position = [100 100 750 550];
%     uit = uitable('Parent',f,'Position',[25 30 700 500]);
%     uit.Data = table;
% %     exportapp(f,name+'.pdf')
% end