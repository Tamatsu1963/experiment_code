%repeated measure anova not opt ver
clear,clc
cd C:\Users\sp_tamatsu\Documents\MATLAB\analysis\behavior\full_data\no_opt
MO = load("moved_only_n6.mat");
MCO = load("movedC_only_n7.mat");
fixed2 = load("fixed2_n6.mat");
fixed2C = load("fixed2C_n7.mat");
M = load("moved_n6.mat");
MC = load("movedC_n7.mat");
fixed3 = ("fixed3_n6.mat");
fixed3C = ("fixed3C_n7.mat");

w1 ={'I','I','I','I','I','I','C','C','C','C','C','C','C',}';
w2 = {'d1','d2','d3','d4','d5'}';
within=table(w2,'VariableNames',{'day'});
%% moved pCR
mo_pCR = [MO.t_pCR;MCO.t_pCR];
T_mo_pCR = table(mo_pCR(:,1),mo_pCR(:,2),mo_pCR(:,3),mo_pCR(:,4),mo_pCR(:,5),w1, ...
    'VariableNames',{'d1','d2','d3','d4','d5','Condition'});
rm_mo_pCR=fitrm(T_mo_pCR,'d1-d5~Condition','WithinDesign',within);
[ranovatbl_mo_pCR]=ranova(rm_mo_pCR,'WithinModel','day');
mult1_mo_pCR=multcompare(rm_mo_pCR,'Condition');
mult2_mo_pCR=multcompare(rm_mo_pCR,'day');
mult3_mo_pCR=multcompare(rm_mo_pCR,'Condition','By','day');
%% moved rule
mo_rule = [MO.t_rule;MCO.t_rule];
T_mo_rule = table(mo_rule(:,1),mo_rule(:,2),mo_rule(:,3),mo_rule(:,4),mo_rule(:,5),w1, ...
    'VariableNames',{'d1','d2','d3','d4','d5','Condition'});
rm_mo_rule=fitrm(T_mo_rule,'d1-d5~Condition','WithinDesign',within);
[ranovatbl_mo_rule]=ranova(rm_mo_rule,'WithinModel','day');
mult1_mo__rule =multcompare(rm_mo_rule,'Condition');
mult2_mo_rule =multcompare(rm_mo_rule,'day');
mult3_mo_rule =multcompare(rm_mo_rule,'Condition','By','day');
%% moved laps
laps = [MO.t_laps;MCO.t_laps];
Tlaps = table(laps(:,1),laps(:,2),laps(:,3),laps(:,4),laps(:,5),w1, ...
    'VariableNames',{'d1','d2','d3','d4','d5','Condition'});
rm_laps=fitrm(Tlaps,'d1-d5~Condition','WithinDesign',within);
[ranovatbl_laps]=ranova(rm_laps,'WithinModel','day');
mult1_m_laps=multcompare(rm_laps,'Condition');
mult2_m_laps=multcompare(rm_laps,'day');
mult3_m_laps=multcompare(rm_laps,'Condition','By','day');
%% moced speed
m_speed = [MO.t_speed;MCO.t_speed];
T_m_speed = table(m_speed(:,1),m_speed(:,2),m_speed(:,3),m_speed(:,4),m_speed(:,5),w1, ...
    'VariableNames',{'d1','d2','d3','d4','d5','Condition'});
rm_m_speed=fitrm(T_m_speed,'d1-d5~Condition','WithinDesign',within);
[ranovatbl_m_speed]=ranova(rm_m_speed,'WithinModel','day');
mult1_m_speed=multcompare(rm_m_speed,'Condition');
mult2_m_speed=multcompare(rm_m_speed,'day');
mult3_m_speed=multcompare(rm_m_speed,'Condition','By','day');
%% fixed pCR
% f_pCR = [fixed2.t_pCR;fixed2C.t_pCR];
% T_f_pCR = table(f_pCR(:,1),f_pCR(:,2),f_pCR(:,3),f_pCR(:,4),f_pCR(:,5),w1, ...
%     'VariableNames',{'d1','d2','d3','d4','d5','Condition'});
% rm_f_pCR=fitrm(T_f_pCR,'d1-d5~Condition','WithinDesign',within);
% [ranovatbl_f_pCR]=ranova(rm_f_pCR,'WithinModel','day');
% mult1_f_pCR=multcompare(rm_f_pCR,'Condition');
% mult2_f_pCR=multcompare(rm_f_pCR,'day');
% mult3_f_pCR=multcompare(rm_f_pCR,'Condition','By','day');
% %% fixed rule
% f_rule = [fixed2.t_rule;fixed2C.t_rule];
% T_f_rule = table(f_rule(:,1),f_rule(:,2),f_rule(:,3),f_rule(:,4),f_rule(:,5),w1, ...
%     'VariableNames',{'d1','d2','d3','d4','d5','Condition'});
% rm_f_rule=fitrm(T_f_rule,'d1-d5~Condition','WithinDesign',within);
% [ranovatbl_f_rule]=ranova(rm_f_rule,'WithinModel','day');
% mult1_f_rule=multcompare(rm_f_rule,'Condition');
% mult2_f_rule=multcompare(rm_f_rule,'day');
% mult3_f_rule=multcompare(rm_f_rule,'Condition','By','day');
%% fixed laps
f_laps = [fixed2.t_laps;fixed2C.t_laps];
T_f_laps = table(f_laps(:,1),f_laps(:,2),f_laps(:,3),f_laps(:,4),f_laps(:,5),w1, ...
    'VariableNames',{'d1','d2','d3','d4','d5','Condition'});
rm_f_laps=fitrm(T_f_laps,'d1-d5~Condition','WithinDesign',within);
[ranovatbl_f_laps]=ranova(rm_f_laps,'WithinModel','day');
mult1_f_laps=multcompare(rm_f_laps,'Condition');
mult2_f_laps=multcompare(rm_f_laps,'day');
mult3_f_laps=multcompare(rm_f_laps,'Condition','By','day');
%% fixed speed
f_speed = [fixed2.t_speed;fixed2C.t_speed];
T_f_speed = table(f_speed(:,1),f_speed(:,2),f_speed(:,3),f_speed(:,4),f_speed(:,5),w1, ...
    'VariableNames',{'d1','d2','d3','d4','d5','Condition'});
rm_f_speed=fitrm(T_f_speed,'d1-d5~Condition','WithinDesign',within);
[ranovatbl_f_speed]=ranova(rm_f_speed,'WithinModel','day');
mult1_f_speed=multcompare(rm_f_speed,'Condition');
mult2_f_speed=multcompare(rm_f_speed,'day');
mult3_f_speed=multcompare(rm_f_speed,'Condition','By','day');
%%
m_pCR = [M.t_pCR;MC.t_pCR];
T_m_pCR = table(m_pCR(:,1),m_pCR(:,2),m_pCR(:,3),m_pCR(:,4),m_pCR(:,5),w1, ...
    'VariableNames',{'d1','d2','d3','d4','d5','Condition'});
rm_m_pCR=fitrm(T_m_pCR,'d1-d5~Condition','WithinDesign',within);
[ranovatbl_mpCR]=ranova(rm_m_pCR,'WithinModel','day');
m_pCR_mult1 = multcompare(rm_m_pCR,'Condition');
m_pCR_mult2 = multcompare(rm_m_pCR,'day');
m_pCR_mult3 = multcompare(rm_m_pCR,'Condition','By','day');
%%
m_rule = [M.t_rule;MC.t_rule];
T_m_rule = table(m_rule(:,1),m_rule(:,2),m_rule(:,3),m_rule(:,4),m_rule(:,5),w1, ...
    'VariableNames',{'d1','d2','d3','d4','d5','Condition'});
rm_m_rule = fitrm(T_m_rule,'d1-d5~Condition','WithinDesign',within);
[ranovatbl_m_rule] = ranova(rm_m_rule,'WithinModel','day');
m_rule_mult1 = multcompare(rm_m_rule,'Condition');
m_rule_mult2 = multcompare(rm_m_rule,'day');
m_rule_mult3 = multcompare(rm_m_rule,'Condition','By','day');
%% fixed3
f3_pCR = [fixed3.t_pCR;fixed3C.t_pCR];
T_f3_pCR = table(f3_pCR(:,1),f3_pCR(:,2),f3_pCR(:,3),f3_pCR(:,4),f3_pCR(:,5),w1, ...
    'VariableNames',{'d1','d2','d3','d4','d5','Condition'});
rm_f3_pCR=fitrm(T_f3_pCR,'d1-d5~Condition','WithinDesign',within);
[ranovatbl_f3_pCR]=ranova(rm_f3_pCR,'WithinModel','day');
mult1_f3_pCR=multcompare(rm_f3_pCR,'Condition');
mult2_f3_pCR=multcompare(rm_f3_pCR,'day');
mult3_f3_pCR=multcompare(rm_f3_pCR,'Condition','By','day');
%% fixed3 rule
f3_rule = [fixed3.t_rule;fixed3C.t_rule];
T_f3_rule = table(f3_rule(:,1),f3_rule(:,2),f3_rule(:,3),f3_rule(:,4),f3_rule(:,5),w1, ...
    'VariableNames',{'d1','d2','d3','d4','d5','Condition'});
rm_f3_rule=fitrm(T_f3_rule,'d1-d5~Condition','WithinDesign',within);
[ranovatbl_f3_rule]=ranova(rm_f3_rule,'WithinModel','day');
mult1_f3_rule=multcompare(rm_f3_rule,'Condition');
mult2_f3_rule=multcompare(rm_f3_rule,'day');
mult3_f3_rule=multcompare(rm_f3_rule,'Condition','By','day');
%% save
save("repeated_mixed_anova.mat")
%% memo
%{
%%

% fixed_sieze = size(fixed.rule_all_data);
% fixed2_sieze = size(fixed2.rule_all_data);
% fixed2C_sieze = size(fixed2C.rule_all_data);
% moved_sieze = size(moved.rule_all_data);
% movedC_sieze = size(movedC.rule_all_data);
% %tag1
% fixed_id = ones(fixed_sieze(1,1),1);
% fixed2_id = 2*ones(fixed2_sieze(1,1),1);
% fixed2C_id = 3*ones(fixed2C_sieze(1,1),1);
% moved_id = 4*ones(moved_sieze(1,1),1);
% movedC_id = 5*ones(movedC_sieze(1,1),1);
% %tag2
% Time = [1 2 3 4 5]';

%%
%fixed
for i=1:fixed_sieze(1,1)
    fixed_rule_day(i,:)=mean(fixed.rule_day_data(4*(i-1)+1:4*i,:),"omitnan") ;
    fixed_pCR_day(i,:)=mean(fixed.pCR_day_data(4*(i-1)+1:4*i,:),"omitnan");
    fixed_laps_day(i,:)=mean(fixed.laps_day_data(4*(i-1)+1:4*i,:),"omitnan");
end

%fixed2
for i2=1:fixed2_sieze(1,1)
    fixed2_rule_day(i2,:)=mean(fixed2.rule_day_data(4*(i2-1)+1:4*i2,:),"omitnan");
    fixed2_pCR_day(i2,:)=mean(fixed2.pCR_day_data(4*(i2-1)+1:4*i2,:),"omitnan");
    fixed2_laps_day(i2,:)=mean(fixed2.laps_day_data(4*(i2-1)+1:4*i2,:),"omitnan");
end

%fixed2C
for i3=1:fixed2C_sieze(1,1)
    fixed2C_rule_day(i3,:)=mean(fixed2C.rule_day_data(4*(i3-1)+1:4*i3,:),"omitnan");
    fixed2C_pCR_day(i3,:)=mean(fixed2C.pCR_day_data(4*(i3-1)+1:4*i3,:),"omitnan");
    fixed2C_laps_day(i3,:)=mean(fixed2C.laps_day_data(4*(i3-1)+1:4*i3,:),"omitnan");
end

%moved
for i4=1:moved_sieze(1,1)
    moved_rule_day(i4,:)=mean(moved.rule_day_data(3*(i4-1)+1:3*i4,:),"omitnan");
    moved_pCR_day(i4,:)=mean(moved.pCR_day_data(3*(i4-1)+1:3*i4,:),"omitnan");
    moved_laps_day(i4,:)=mean(moved.laps_day_data(3*(i4-1)+1:3*i4,:),"omitnan");
end

%movedC
for i5=1:movedC_sieze(1,1)
    movedC_rule_day(i5,:)=mean(movedC.rule_day_data(3*(i5-1)+1:3*i5,:),"omitnan");
    movedC_pCR_day(i5,:)=mean(movedC.pCR_day_data(3*(i5-1)+1:3*i5,:),"omitnan");
    movedC_laps_day(i5,:)=mean(movedC.laps_day_data(3*(i5-1)+1:3*i5,:),"omitnan");
end

%%
% test
% t_fixed_rule = table(fixed_id,fixed_rule_day(:,1),fixed_rule_day(:,2), ...
%     fixed_rule_day(:,3),fixed_rule_day(:,4),fixed_rule_day(:,5),...
%     'VariableNames',{'fixed_id','day1','day2','day3','day4','day5'});

%%
%fixed2 vs fixedC
test1_rule = vertcat(fixed2_rule_day,fixed2C_rule_day);
test1_pCR = vertcat(fixed2_pCR_day,fixed2C_pCR_day);
test1_laps = vertcat(fixed2_laps_day,fixed2C_laps_day);
test1_id =vertcat(fixed2_id,fixed2C_id);

T_test1_rule = table(test1_id,test1_rule(:,1),test1_rule(:,2), ...
    test1_rule(:,3),test1_rule(:,4),test1_rule(:,5),...
    'VariableNames',{'test1_id','day1','day2','day3','day4','day5'});
test1_rule_rm = fitrm(T_test1_rule,'day1-day5 ~ test1_id','WithinDesign',Time);
t1_rule_ranova = ranova(test1_rule_rm,'WithinModel','Time');

T_test1_pCR = table(test1_id,test1_pCR(:,1),test1_pCR(:,2), ...
    test1_pCR(:,3),test1_pCR(:,4),test1_pCR(:,5),...
    'VariableNames',{'test1_id','day1','day2','day3','day4','day5'});
test1_pCR_rm = fitrm(T_test1_pCR,'day1-day5 ~ test1_id','WithinDesign',Time);
t1_pCR_ranova = ranova(test1_pCR_rm,'WithinModel','Time');

T_test1_laps = table(test1_id,test1_laps(:,1),test1_laps(:,2), ...
    test1_laps(:,3),test1_laps(:,4),test1_laps(:,5),...
    'VariableNames',{'test1_id','day1','day2','day3','day4','day5'});
test1_laps_rm = fitrm(T_test1_laps,'day1-day5 ~ test1_id','WithinDesign',Time);
t1_laps_ranova = ranova(test1_laps_rm,'WithinModel','Time');

%%
%moved vs movedC
test2_rule = vertcat(moved_rule_day,movedC_rule_day);
test2_pCR = vertcat(moved_pCR_day,movedC_pCR_day);
test2_laps = vertcat(moved_laps_day,movedC_laps_day);
test2_id =vertcat(moved_id,movedC_id);

T_test2_rule = table(test2_id,test2_rule(:,1),test2_rule(:,2), ...
    test2_rule(:,3),test2_rule(:,4),test2_rule(:,5),...
    'VariableNames',{'test_id2','day1','day2','day3','day4','day5'});
test2_rule_rm = fitrm(T_test2_rule,'day1-day5 ~ test_id2','WithinDesign',Time);
t2_rule_ranova = ranova(test2_rule_rm,'WithinModel','Time');

T_test2_pCR = table(test2_id,test2_pCR(:,1),test2_pCR(:,2), ...
    test2_pCR(:,3),test2_pCR(:,4),test2_pCR(:,5),...
    'VariableNames',{'test_id2','day1','day2','day3','day4','day5'});
test2_pCR_rm = fitrm(T_test2_pCR,'day1-day5 ~ test_id2','WithinDesign',Time);
t2_pCR_ranova = ranova(test2_pCR_rm,'WithinModel','Time');

T_test2_laps = table(test2_id,test2_laps(:,1),test2_laps(:,2), ...
    test2_laps(:,3),test2_laps(:,4),test2_laps(:,5),...
    'VariableNames',{'test_id2','day1','day2','day3','day4','day5'});
test2_laps_rm = fitrm(T_test2_laps,'day1-day5 ~ test_id2','WithinDesign',Time);
t2_laps_ranova = ranova(test2_laps_rm,'WithinModel','Time');
%}