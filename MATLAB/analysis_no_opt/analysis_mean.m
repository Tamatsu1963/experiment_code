%no opt analysis average ,day and session
clear
clc

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
[rule_all_data, frule_all_data, porking_all_data, laps_all_data, CR_all_data, pCR_all_data]=fl_1(file,path);


rule_size =size(rule_all_data(:,1),1);

% session→day
rule_day_data=NaN(rule_size*4,5);
frule_day_data = NaN(rule_size*4,5);
porking_day_data = NaN(rule_size*4,5);
laps_day_data=NaN(rule_size*4,5);
CR_day_data = NaN(rule_size*4,5);
pCR_day_data = NaN(rule_size*4,5);
for k=1:5
    for l=1:4
        rule_day_data((l-1)*rule_size+1:l*rule_size,k)=rule_all_data(1:rule_size,l+4*(k-1)); %SDに利用
        frule_day_data((l-1)*rule_size+1:l*rule_size,k)=frule_all_data(1:rule_size,l+4*(k-1));
        porking_day_data((l-1)*rule_size+1:l*rule_size,k)=porking_all_data(1:rule_size,l+4*(k-1));
        laps_day_data((l-1)*rule_size+1:l*rule_size,k)=laps_all_data(1:rule_size,l+4*(k-1));
        CR_day_data((l-1)*rule_size+1:l*rule_size,k)=CR_all_data(1:rule_size,l+4*(k-1));
        pCR_day_data((l-1)*rule_size+1:l*rule_size,k)=pCR_all_data(1:rule_size,l+4*(k-1));
    end
end
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
laps_day_ave=mean(laps_day_data,'omitnan');
laps_day_SD=std(laps_day_data,'omitnan');
laps_session_ave = mean(laps_all_data,'omitnan');
laps_session_SD = std(laps_all_data,'omitnan');
CR_day_ave=mean(CR_day_data,'omitnan');
CR_day_SD=std(CR_day_data,'omitnan');
CR_session_ave = mean(CR_all_data,'omitnan');
CR_session_SD = std(CR_all_data,'omitnan');
pCR_day_ave=mean(pCR_day_data,'omitnan');
pCR_day_SD=std(pCR_day_data,'omitnan');
pCR_session_ave = mean(pCR_all_data,'omitnan');
pCR_session_SD = std(pCR_all_data,'omitnan');
%data save
cd C:\Users\sp_tamatsu\Documents\MATLAB\analysis\behavior\full_data
save(savename)


%function
function [rule_all_data, frule_all_data, porking_all_data, laps_all_data, CR_all_data, pCR_all_data] =fl_1(file,path)
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
    laps_all_data = filename{1,1}.laps;
    CR_all_data = filename{1,1}.CR;
    pCR_all_data = filename{1,1}.pCR;
    for k=2:n
        rule_all_data2 = filename{1,k}.rule;
        frule_all_data2 =filename{1,k}.frule;
        porking_all_data2 = filename{1,k}.porking;
        laps_all_data2 = filename{1,k}.laps;
        CR_all_data2 = filename{1,k}.CR;
        pCR_all_data2 = filename{1,k}.pCR;
        rule_all_data =vertcat(rule_all_data,rule_all_data2);
        frule_all_data =vertcat(frule_all_data,frule_all_data2);
        porking_all_data =vertcat(porking_all_data,porking_all_data2);
        laps_all_data =vertcat(laps_all_data,laps_all_data2);
        CR_all_data =vertcat(CR_all_data,CR_all_data2);
        pCR_all_data =vertcat(pCR_all_data,pCR_all_data2);
    end
end
