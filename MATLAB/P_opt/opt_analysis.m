%opt analysis
%1個体の５日分のデータ解析(40 session)
clear
cd C:\Users\sp_tamatsu\Documents\MATLAB\program\P_opt
%name: task_miceid
savename = input('Name?','s');
if isempty(savename)
    return;
end
%参照するファイルの選択(1個体の５日分のデータ)
cd C:\Users\sp_tamatsu\Documents\MATLAB\edit_data\Opt %data file path
[file,path] = uigetfile('*.mat','Select One or More Files', 'MultiSelect', 'on');
if isequal(file,0)
   disp('User selected Cancel');
else
   disp(['User selected ', fullfile(path,file)]);
end

n=numel(file);
filename = cell(1,n);
cd (path)
for i=1:n
    cd (path)
    filename{i} = load(string(file{1,i}));
end

%データ処理
% all data
rule =NaN(1,40); %ruleの学習程度
frule = NaN(1,40); %正解の餌箱に頭を入れてからのrule
porking = NaN(1,40); %正しい報酬の位置でポーキングした割合
NP =NaN(1,40); %次の報酬位置にporkingしている割合
CR = NaN(1,40); %正答率
pCR = NaN(1,40); %完答率
pre_laps = NaN(1,40);
post_lap = NaN(1,40);
fpCR = NaN(1,40);
cd C:\Users\sp_tamatsu\Documents\MATLAB\program\P_opt
for ii=1:n
    [track_data, s3n] = f_opt_track(filename{1,ii}.eData);
    [i_rule, i_frule, i_porking] = f_rule_opt_analysis(track_data,s3n);
    i_NP = f_nextporking(track_data);
    [i_CR, i_pCR, i_fpCR] = f_correct_response(track_data);
    rule(1,ii) = i_rule;
    frule(1,ii) = i_frule;
    porking(1,ii) = i_porking;
    NP(1,ii) = i_NP;
    CR(1,ii) = i_CR;
    pCR(1,ii) = i_pCR;
    fpCR(1,ii) = i_fpCR;
end
%%
%session→day
rule_day=[rule(1,1:8)' rule(1,9:16)' rule(1,17:24)' rule(1,25:32)' rule(1,33:40)'];
frule_day = [frule(1,1:8)' frule(1,9:16)' frule(1,17:24)' frule(1,25:32)' frule(1,33:40)'];
porking_day = [porking(1,1:8)' porking(1,9:16)' porking(1,17:24)' porking(1,25:32)' porking(1,33:40)'];
NP_day=[NP(1,1:8)' NP(1,9:16)' NP(1,17:24)' NP(1,25:32)' NP(1,33:40)'];
CR_day = [CR(1,1:8)' CR(1,9:16)' CR(1,17:24)' CR(1,25:32)' CR(1,33:40)'];
pCR_day = [pCR(1,1:8)' pCR(1,9:16)' pCR(1,17:24)' pCR(1,25:32)' pCR(1,33:40)'];
fpCR_day = [fpCR(1,1:8)' fpCR(1,9:16)' fpCR(1,17:24)' fpCR(1,25:32)' fpCR(1,33:40)'];
%%
%session
rule_s=[rule(1,1:8); rule(1,9:16); rule(1,17:24); rule(1,25:32); rule(1,33:40)];
frule_s = [frule(1,1:8); frule(1,9:16); frule(1,17:24); frule(1,25:32); frule(1,33:40)];
porking_s = [porking(1,1:8); porking(1,9:16); porking(1,17:24); porking(1,25:32); porking(1,33:40)];
NP_s=[NP(1,1:8); NP(1,9:16); NP(1,17:24); NP(1,25:32); NP(1,33:40)];
CR_s = [CR(1,1:8); CR(1,9:16); CR(1,17:24); CR(1,25:32); CR(1,33:40)];
pCR_s = [pCR(1,1:8); pCR(1,9:16); pCR(1,17:24); pCR(1,25:32); pCR(1,33:40)];
fpCR_s = [fpCR(1,1:8); fpCR(1,9:16); fpCR(1,17:24); fpCR(1,25:32); fpCR(1,33:40)];
%%
%day average
d_frule_ave = mean(frule_day);
d_rule_ave = mean(rule_day);
d_porking_ave = mean(porking_day);
d_NP_ave = mean(NP_day);
d_pCR_ave = mean(pCR_day);
d_fpCR_ave = mean(fpCR_day);
%%
%save
cd C:\Users\sp_tamatsu\Documents\MATLAB\analysis\behavior\Opt
save(savename)
