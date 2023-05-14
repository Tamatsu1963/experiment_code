%opt_rule_learningのデータ統合と平均
clear
cd C:\Users\sp_tamatsu\Documents\MATLAB\program
%name: task
savename = input('Name?','s');
if isempty(savename)
    return;
end
%参照するファイルの選択
cd C:\Users\sp_tamatsu\Documents\MATLAB\analysis\behavior %data file path
[file,path] = uigetfile('*.mat','Select One or More Files', 'MultiSelect', 'on');
if isequal(file,0)
   disp('User selected Cancel');
else
   disp(['User selected ', fullfile(path,file)]);
end

[rule_all_data, frule_all_data, porking_all_data, NP_all_data, CR_all_data, pCR_all_data, fpCR_all_data]=fl_1(file,path);

rule_size =size(rule_all_data(:,1),1);

% session→day
rule_day_data=NaN(rule_size*8,5);
frule_day_data = NaN(rule_size*8,5);
porking_day_data = NaN(rule_size*8,5);
NP_day_data=NaN(rule_size*8,5);
CR_day_data = NaN(rule_size*8,5);
pCR_day_data = NaN(rule_size*8,5);
fpCR_day_data = NaN(rule_size*8,5);
for k=1:5
    for l=1:8
        rule_day_data((l-1)*rule_size+1:l*rule_size,k)=rule_all_data(1:rule_size,l+8*(k-1)); %SDに利用
        frule_day_data((l-1)*rule_size+1:l*rule_size,k)=frule_all_data(1:rule_size,l+8*(k-1));
        porking_day_data((l-1)*rule_size+1:l*rule_size,k)=porking_all_data(1:rule_size,l+8*(k-1)); 
        NP_day_data((l-1)*rule_size+1:l*rule_size,k)=NP_all_data(1:rule_size,l+8*(k-1));
        CR_day_data((l-1)*rule_size+1:l*rule_size,k)=CR_all_data(1:rule_size,l+8*(k-1)); 
        pCR_day_data((l-1)*rule_size+1:l*rule_size,k)=pCR_all_data(1:rule_size,l+8*(k-1));
        fpCR_day_data((l-1)*rule_size+1:l*rule_size,k)=fpCR_all_data(1:rule_size,l+8*(k-1));
    end
end
%}
%計算処理
rule_day_ave=mean(rule_day_data,'omitnan');
rule_day_SD=std(rule_day_data,'omitnan');
rule_session_ave = mean(rule_all_data,'omitnan');
rule_session_SD = std(rule_all_data,'omitnan');
frule_ave =mean(frule_day_data,'omitnan');
frule_SD = std(frule_day_data,'omitnan');
frule_session_ave = mean(frule_all_data,'omitnan');
frule_session_SD = std(frule_all_data,'omitnan');
porking_day_ave=mean(porking_day_data,'omitnan');
porking_day_SD=std(porking_day_data,'omitnan');
porking_session_ave = mean(porking_all_data,'omitnan');
porking_session_SD = std(porking_all_data,'omitnan');
NP_day_ave=mean(NP_day_data,'omitnan');
NP_day_SD=std(NP_day_data,'omitnan');
NP_session_ave = mean(NP_all_data,'omitnan');
NP_session_SD = std(NP_all_data,'omitnan');
CR_day_ave=mean(CR_day_data,'omitnan');
CR_day_SD=std(CR_day_data,'omitnan');
CR_session_ave = mean(CR_all_data,'omitnan');
CR_session_SD = std(CR_all_data,'omitnan');
pCR_day_ave=mean(pCR_day_data,'omitnan');
pCR_day_SD=std(pCR_day_data,'omitnan');
pCR_session_ave = mean(pCR_all_data,'omitnan');
pCR_session_SD = std(pCR_all_data,'omitnan');
fpCR_day_ave=mean(fpCR_day_data,'omitnan');
fpCR_day_SD=std(fpCR_day_data,'omitnan');
fpCR_session_ave = mean(fpCR_all_data,'omitnan');
fpCR_session_SD = std(fpCR_all_data,'omitnan');

%%
%統計用データセット
[t_frule, t_NP, t_pCR, t_rule, t_fpCR, t_porking] = fl_vertcat(file,path);

%%
%data save
cd C:\Users\sp_tamatsu\Documents\MATLAB\analysis\behavior\full_data\opt\
save(savename)

%%
%function

function [rule_all_data, frule_all_data, porking_all_data, NP_all_data, CR_all_data, pCR_all_data, fpCR_all_data] =fl_1(file,path)
    n=numel(file);
    filename = cell(1,n);
    cd (path)
    for i=1:n
        cd (path)
        filename{i} = load(string(file{1,i}));
    end
    rule_all_data = filename{1,1}.rule;
    frule_all_data =filename{1,1}.frule;
    porking_all_data = filename{1,1}.porking;
    NP_all_data = filename{1,1}.NP;
    CR_all_data = filename{1,1}.CR;
    pCR_all_data = filename{1,1}.pCR;
    fpCR_all_data = filename{1,1}.fpCR;
    for k=2:n
        rule_all_data2 = filename{1,k}.rule;
        frule_all_data2 =filename{1,k}.frule;
        porking_all_data2 = filename{1,k}.porking;
        NP_all_data2 = filename{1,k}.NP;
        CR_all_data2 = filename{1,k}.CR;
        pCR_all_data2 = filename{1,k}.pCR;
        fpCR_all_data2 = filename{1,k}.fpCR;
        rule_all_data =vertcat(rule_all_data,rule_all_data2);
        frule_all_data =vertcat(frule_all_data,frule_all_data2);
        porking_all_data =vertcat(porking_all_data,porking_all_data2);
        NP_all_data =vertcat(NP_all_data,NP_all_data2);
        CR_all_data =vertcat(CR_all_data,CR_all_data2);
        pCR_all_data =vertcat(pCR_all_data,pCR_all_data2);
        fpCR_all_data =vertcat(fpCR_all_data,fpCR_all_data2);
    end
end

%%
function [t_frule, t_NP, t_pCR, t_rule, t_fpCR, t_porking] = fl_vertcat(file,path)
    n=numel(file);
    filename = cell(1,n);
    cd (path)
    for i=1:n
        cd (path)
        filename{i} = load(string(file{1,i}));
    end
    t_frule = filename{1,1}.d_frule_ave;
    t_NP = filename{1,1}.d_NP_ave;
    t_pCR = filename{1,1}.d_pCR_ave;
    t_rule = filename{1,1}.d_rule_ave;
    t_fpCR = filename{1,1}.d_fpCR_ave;
    t_porking = filename{1,1}.d_porking_ave;
    for k=2:n
        t_frule2 = filename{1,k}.d_frule_ave;
        t_NP2 = filename{1,k}.d_NP_ave;
        t_pCR2 = filename{1,k}.d_pCR_ave;
        t_rule2 = filename{1,k}.d_rule_ave;
        t_fpCR2 = filename{1,k}.d_fpCR_ave;
        t_porking2 = filename{1,k}.d_porking_ave;
        t_frule =vertcat(t_frule,t_frule2);
        t_NP =vertcat(t_NP,t_NP2);
        t_pCR =vertcat(t_pCR,t_pCR2);
        t_rule =vertcat(t_rule,t_rule2);
        t_fpCR =vertcat(t_fpCR,t_fpCR2);
        t_porking =vertcat(t_porking,t_porking2);
    end
end
