clear
cd C:\Users\sp_tamatsu\Documents\MATLAB\edit_data\Injury\Control\moved\all\
foldername1 = "Day1";
foldername2 = "Day2";
foldername3 = "Day3";
foldername4 = "Day4";
foldername5 = "Day5";
im_list1=dir(foldername1);
im_list2=dir(foldername2);
im_list3=dir(foldername3);
im_list4=dir(foldername4);
im_list5=dir(foldername5);
file_name1={im_list1.name};
file_name1 = file_name1(~ismember(file_name1, {'.', '..'}));
n1=numel(file_name1);
file_name2={im_list2.name};
file_name2 = file_name2(~ismember(file_name2, {'.', '..'}));
n2=numel(file_name2);
file_name3={im_list3.name};
file_name3 = file_name3(~ismember(file_name3, {'.', '..'}));
n3=numel(file_name3);
file_name4={im_list4.name};
file_name4 = file_name4(~ismember(file_name4, {'.', '..'}));
n4=numel(file_name4);
file_name5={im_list5.name};
file_name5 = file_name5(~ismember(file_name5, {'.', '..'}));
n5=numel(file_name5);
cd Day1
for i1=1:n1
    file_name1{i1} = load(string(file_name1{1,i1}));
end
cd ..\Day2
for i2=1:n2
    file_name2{i2} = load(string(file_name2{1,i2}));
end
cd ..\Day3
for i3=1:n3
    file_name3{i3} = load(string(file_name3{1,i3}));
end
cd ..\Day4
for i4=1:n4
    file_name4{i4} = load(string(file_name4{1,i4}));
end
cd ..\Day5
for i5=1:n5
    file_name5{i5} = load(string(file_name5{1,i5}));
end
cd ..\
d1_rule=zeros(1,n1);
d2_rule=zeros(1,n2);
d3_rule=zeros(1,n3);
d4_rule=zeros(1,n4);
d5_rule=zeros(1,n5);
d1_CL_rule = zeros(1,100);
d2_CL_rule = zeros(1,100);
d3_CL_rule = zeros(1,100);
d4_CL_rule = zeros(1,100);
d5_CL_rule = zeros(1,100);
for ss=1:100
    for i1=1:n1
        data=rmmissing(file_name1{1,i1}.eData);
        [track_data1, s3n1] = fl_track(data);
        d1_rule(1,i1) = fl_rule_analysis(track_data1,s3n1);
    end
    for i2=1:n2
        data=rmmissing(file_name1{1,i2}.eData);
        [track_data2, s3n2] = fl_track(data);
        d2_rule(1,i2) = fl_rule_analysis(track_data2,s3n2);
    end
    for i3=1:n3
        data=rmmissing(file_name1{1,i3}.eData);
        [track_data3, s3n3] = fl_track(data);
        d3_rule(1,i3) = fl_rule_analysis(track_data3,s3n3);
    end
    for i4=1:n4
        data=rmmissing(file_name1{1,i4}.eData);
        [track_data4, s3n4] = fl_track(data);
        d4_rule(1,i4) = fl_rule_analysis(track_data4,s3n4);
    end
    for i5=1:n2
        data=rmmissing(file_name1{1,i5}.eData);
        [track_data5, s3n5] = fl_track(data);
        d5_rule(1,i5) = fl_rule_analysis(track_data5,s3n5);
    end
    d1_CL_rule(1,ss) = sum(d1_rule,2)/n1;
    d2_CL_rule(1,ss) = sum(d2_rule,2)/n2;
    d3_CL_rule(1,ss) = sum(d3_rule,2)/n3;
    d4_CL_rule(1,ss) = sum(d4_rule,2)/n4;
    d5_CL_rule(1,ss) = sum(d5_rule,2)/n5;
end


%% function
function [track_data, s3n]=fl_track(data)
    s3pattern = 's3';
    s3_indx = contains(data(:,1),s3pattern,"IgnoreCase",true);
    s3find = find(s3_indx);
    find_size =size(s3find,1);
    rand_p = randperm(s3find(find_size,1)-2)';
    r_data = data(2:s3find(find_size,1)-1,1);
    r_data = r_data(rand_p);
    r_data = [data(1,1); r_data; data(s3find(find_size,1),1)];
    r_s3_indx = contains(r_data(:,1),s3pattern,"IgnoreCase",true);
    r_s3find = find(r_s3_indx);
    r_s3diff = diff(r_s3find);
    for k=1:find_size-1
        track_data(1:r_s3diff(k,1),k)=r_data(r_s3find(k,1):r_s3find(k+1,1)-1,1);
    end
    s3n = find_size-1;
end

function rule = fl_rule_analysis (track_data,s3n)
    Fpattern = "F";
    fpattern = "f";
    f1pattern = "f1";
    f2pattern = "f2";
    f3pattern = "f3";
    f4pattern = "f4";
    Spattern = "S";
    Fn = NaN(1,10);
    fn = NaN(1,10);
    f1 = NaN(1,10);
    f2 = NaN(1,10);
    f3 = NaN(1,10);
    f4 = NaN(1,10);
    Sn = NaN(1,10);
    L_track_data = rmmissing(track_data);
    Findx = contains(L_track_data,Fpattern);  %logical
    findx = contains(L_track_data,fpattern);
    f1_indx = contains(L_track_data,f1pattern);
    f2_indx = contains(L_track_data,f2pattern);
    f3_indx = contains(L_track_data,f3pattern);
    f4_indx = contains(L_track_data,f4pattern);
    Sindx = contains(L_track_data,Spattern);
    for ii=1:s3n
        Fn(1,ii)=nnz(Findx(:,ii));
        fn(1,ii)=nnz(findx(:,ii));
        f1(1,ii)=nnz(f1_indx(:,ii));
        f2(1,ii)=nnz(f2_indx(:,ii));
        f3(1,ii)=nnz(f3_indx(:,ii));
        f4(1,ii)=nnz(f4_indx(:,ii));
        Sn(1,ii)=nnz(Sindx(:,ii));
    end
    Ff=rmmissing(Fn+fn);
    Fncount = sum(Fn,'omitnan');
    if Fncount>0
        rule_count=sum(Ff==1);
        laps = s3n;
        rule =rule_count/laps;
    else
        rule = 0;
    end
end