%no opt not moved_only
clear,clc

cd C:\Users\sp_tamatsu\Documents\MATLAB\program
%name: task_miceid
savename = input('Name?','s');
if isempty(savename)
    return;
end
%参照するファイルの選択(1個体の５日分のデータ)
cd C:\Users\sp_tamatsu\Documents\MATLAB\edit_data\fixed\%data file path
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
rule =NaN(1,20); %ruleの学習程度
frule = NaN(1,20); %正解の餌箱に頭を入れてからのrule
porking = NaN(1,20); %正しい報酬の位置にポーキングした割合
laps = NaN(1,20); %周回数
CR = NaN(1,20); %正答率
pCR = NaN(1,20); %完答率
%ここにコード追加
cd C:\Users\sp_tamatsu\Documents\MATLAB\program\P_no_opt
for ii=1:n
    [track_data, s3n] = f_no_opt_track(filename{1,ii}.eData);
    [i_rule, i_frule, i_porking] = f_rule_analysis(track_data,s3n);
    %i_NP = f_nextporking(track_data);
    [i_CR, i_pCR] = f_nopt_correct_response(track_data,s3n);
    rule(1,ii) = i_rule;
    frule(1,ii) = i_frule;
    porking(1,ii) = i_porking;
    CR(1,ii) = i_CR;
    pCR(1,ii) = i_pCR;
    laps(1,ii) = s3n;
end

%save
cd C:\Users\sp_tamatsu\Documents\MATLAB\analysis\behavior\fixed\
save(savename)
