%no opt moved only
clear

cd C:\Users\sp_tamatsu\Documents\MATLAB\program\P_no_opt
%name: task_miceid
savename = input('Name?','s');
if isempty(savename)
    return;
end
%参照するファイルの選択(1個体の５日分のデータ)
cd C:\Users\sp_tamatsu\Documents\MATLAB\edit_data\Injury %data file path
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
%% データ処理 sessionごと
rule =NaN(1,15); %ruleの学習程度
frule = NaN(1,15); %正解の餌箱に頭を入れてからのrule
porking = NaN(1,15); %正しい報酬の位置でポーキングした回数
laps = NaN(1,15); %周回数
CR = NaN(1,15); %正答率
pCR = NaN(1,15); %完答率
fcount = NaN(4,15); %各餌箱に入れた回数
%ここにコード追加
cd C:\Users\sp_tamatsu\Documents\MATLAB\program\P_no_opt
for ii=1:n
    [track_data, s3n] = f_no_opt_track(filename{1,ii}.eData);
    [i_rule, i_frule, i_porking, i_fcount] = f_rule_analysis(track_data,s3n);
    [i_CR, i_pCR] = f_no_opt_correct_response(track_data,s3n);
    rule(1,ii) = i_rule;
    frule(1,ii) = i_frule;
    porking(1,ii) = i_porking;
    CR(1,ii) = i_CR;
    pCR(1,ii) = i_pCR;
    fcount(:,ii) =i_fcount;
    laps(1,ii) = s3n;
end
p_rate = porking./laps;  %周回数に対して、報酬位置に頭を入れた割合
%% speed
speed = NaN(10,15);
for m=1:n
    [s_track_data, s_s3n] = f_no_opt_track(filename{1,m}.eData);
    speed_data = f_no_opt_speed(s_track_data,s_s3n);
    spd_s =size(speed_data);
    for o=1:spd_s(1,1)
        speed(o,m)=speed_data(o,1);
    end
end
s_speed = mean(speed,'omitnan');
%% day
d_rule_ave = [mean(rule(1,1:3),'omitnan'),mean(rule(1,4:6),'omitnan'),mean(rule(1,7:9),'omitnan'),mean(rule(1,10:12),'omitnan'),mean(rule(1,13:15),'omitnan')];
d_frule_ave = [mean(frule(1,1:3),'omitnan'),mean(frule(1,4:6),'omitnan'),mean(frule(1,7:9),'omitnan'),mean(frule(1,10:12),'omitnan'),mean(frule(1,13:15),'omitnan')];
d_pCR_ave = [mean(pCR(1,1:3),'omitnan'),mean(pCR(1,4:6),'omitnan'),mean(pCR(1,7:9),'omitnan'),mean(pCR(1,10:12),'omitnan'),mean(pCR(1,13:15),'omitnan')];
d_laps_ave = [mean(laps(1,1:3),'omitnan'),mean(laps(1,4:6),'omitnan'),mean(laps(1,7:9),'omitnan'),mean(laps(1,10:12),'omitnan'),mean(laps(1,13:15),'omitnan')];
d_p_rate_ave = [mean(p_rate(1,1:3),'omitnan'),mean(p_rate(1,4:6),'omitnan'),mean(p_rate(1,7:9),'omitnan'),mean(p_rate(1,10:12),'omitnan'),mean(p_rate(1,13:15),'omitnan')];
d_speed_ave = [mean(s_speed(1,1:3),'omitnan'),mean(s_speed(1,4:6),'omitnan'),mean(s_speed(1,7:9),'omitnan'),mean(s_speed(1,10:12),'omitnan'),mean(s_speed(1,13:15),'omitnan')];
for k=1:4
    d_fcount(k,:) =[sum(fcount(k,1:3),'omitnan'),sum(fcount(k,4:6),'omitnan'),sum(fcount(k,7:9),'omitnan'),sum(fcount(k,10:12),'omitnan'),sum(fcount(k,13:15),'omitnan'),];
end
%%
%save
cd C:\Users\sp_tamatsu\Documents\MATLAB\analysis\behavior\injury\6-OHDA
save(savename)
