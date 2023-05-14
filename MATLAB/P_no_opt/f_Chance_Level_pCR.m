function [CL_pCR1, CL_pCR2, CL_pCR3, CL_pCR4, CL_pCR5]=f_Chance_Level_pCR(load_path,name)
    cd (load_path)  %load_path=~MATLAB\
    cd all\;
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
    %%
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
    %%
    [d1_track, ~] = f_no_opt_track(file_name1{1,1}.eData);
    L_d1_track = d1_track(:,1:2:20);
    for k1=2:n1
        [d1_track2, ~] = f_no_opt_track(file_name1{1,k1}.eData);
        L_d1_track2 =d1_track2(:,1:2:20);
        L_d1_track = horzcat(L_d1_track,L_d1_track2);
    end
    [d2_track, ~] = f_no_opt_track(file_name2{1,1}.eData);
    L_d2_track = d2_track(:,1:2:20);
    for k2=2:n2
        [d2_track2, ~] = f_no_opt_track(file_name2{1,k2}.eData);
        L_d2_track2 =d2_track2(:,1:2:20);
        L_d2_track = horzcat(L_d2_track,L_d2_track2);
    end
    [d3_track, ~] = f_no_opt_track(file_name3{1,1}.eData);
    L_d3_track = d3_track(:,1:2:20);
    for k3=2:n3
        [d3_track2, ~] = f_no_opt_track(file_name3{1,k3}.eData);
        L_d3_track2 =d3_track2(:,1:2:20);
        L_d3_track = horzcat(L_d3_track,L_d3_track2);
    end
    [d4_track, ~] = f_no_opt_track(file_name4{1,1}.eData);
    L_d4_track = d4_track(:,1:2:20);
    for k4=2:n4
        [d4_track2, ~] = f_no_opt_track(file_name4{1,k4}.eData);
        L_d4_track2 =d4_track2(:,1:2:20);
        L_d4_track = horzcat(L_d4_track,L_d4_track2);
    end
    [d5_track, ~] = f_no_opt_track(file_name5{1,1}.eData);
    L_d5_track = d5_track(:,1:2:20);
    for k5=2:n5
        [d5_track2, ~] = f_no_opt_track(file_name5{1,k5}.eData);
        L_d5_track2 =d5_track2(:,1:2:20);
        L_d5_track = horzcat(L_d5_track,L_d5_track2);
    end
    %%
    f1pattern = 'f1';
    f2pattern = 'f2';
    f3pattern = 'f3';
    f4pattern = 'f4';
    CL_pCR1 = zeros(1,1000);
    CL_pCR2 = zeros(1,1000);
    CL_pCR3 = zeros(1,1000);
    CL_pCR4 = zeros(1,1000);
    CL_pCR5 = zeros(1,1000);
    for ss=1:1000
        CA =[ones(1,70),2*ones(1,70),3*ones(1,70),4*ones(1,70)];
        rCA = randperm(280);
        CAn = CA(rCA); %正解位置の設定
        r_session = randperm(280);
    %% day1
        r_track1 = L_d1_track(:,(r_session));
        f1indx1 = contains(r_track1,f1pattern,"IgnoreCase",true);  %logical
        f2indx1 = contains(r_track1,f2pattern,"IgnoreCase",true);
        f3indx1 = contains(r_track1,f3pattern,"IgnoreCase",true);  
        f4indx1 = contains(r_track1,f4pattern,"IgnoreCase",true);
        findx1 = f1indx1+f2indx1+f3indx1+f4indx1;
        f1count1 = sum(f1indx1);
        f2count1 = sum(f2indx1);
        f3count1 = sum(f3indx1);
        f4count1 = sum(f4indx1);
        fcount1 = sum(findx1);
        cc_pCR1 = zeros(1,280);
        for l1=1:280
            if CAn(1,l1)==1
                if (f1count1(1,l1)==1)&&(fcount1(1,l1)==1)
                    cc_pCR1(1,l1)=1;
                end
            elseif CAn(1,l1)==2
                if (f2count1(1,l1)==1)&&(fcount1(1,l1)==1)
                    cc_pCR1(1,l1)=1;
                end
            elseif CAn(1,l1)==3
                if (f3count1(1,l1)==1)&&(fcount1(1,l1)==1)
                    cc_pCR1(1,l1)=1;
                end
            elseif CAn(1,l1)==4
                if (f4count1(1,l1)==1)&&(fcount1(1,l1)==1)
                    cc_pCR1(1,l1)=1;
                end
            end
        end
    %% day2
        r_track2 = L_d2_track(:,(r_session));
        f1indx2 = contains(r_track2,f1pattern,"IgnoreCase",true);  %logical
        f2indx2 = contains(r_track2,f2pattern,"IgnoreCase",true);
        f3indx2 = contains(r_track2,f3pattern,"IgnoreCase",true);  
        f4indx2 = contains(r_track2,f4pattern,"IgnoreCase",true);
        findx2 = f1indx2+f2indx2+f3indx2+f4indx2;
        f1count2 = sum(f1indx2);
        f2count2 = sum(f2indx2);
        f3count2 = sum(f3indx2);
        f4count2 = sum(f4indx2);
        fcount2 = sum(findx2);
        cc_pCR2 = zeros(1,280);
        for l2=1:280
            if CAn(1,l2)==1
                if (f1count2(1,l2)==1)&&(fcount2(1,l2)==1)
                    cc_pCR2(1,l2)=1;
                end
            elseif CAn(1,l2)==2
                if (f2count2(1,l2)==1)&&(fcount2(1,l2)==1)
                    cc_pCR2(1,l2)=1;
                end
            elseif CAn(1,l2)==3
                if (f3count2(1,l2)==1)&&(fcount2(1,l2)==1)
                    cc_pCR2(1,l2)=1;
                end
            elseif CAn(1,l2)==4
                if (f4count2(1,l2)==1)&&(fcount2(1,l2)==1)
                    cc_pCR2(1,l2)=1;
                end
            end
        end
    %% day3
        r_track3 = L_d3_track(:,(r_session));
        f1indx3 = contains(r_track3,f1pattern,"IgnoreCase",true);  %logical
        f2indx3 = contains(r_track3,f2pattern,"IgnoreCase",true);
        f3indx3 = contains(r_track3,f3pattern,"IgnoreCase",true);  
        f4indx3 = contains(r_track3,f4pattern,"IgnoreCase",true);
        findx3 = f1indx3+f2indx3+f3indx3+f4indx3;
        f1count3 = sum(f1indx3);
        f2count3 = sum(f2indx3);
        f3count3 = sum(f3indx3);
        f4count3 = sum(f4indx3);
        fcount3 = sum(findx3);
        cc_pCR3 = zeros(1,280);
        for l3=1:280
            if CAn(1,l3)==1
                if (f1count3(1,l3)==1)&&(fcount3(1,l3)==1)
                    cc_pCR3(1,l3)=1;
                end
            elseif CAn(1,l3)==2
                if (f2count3(1,l3)==1)&&(fcount3(1,l3)==1)
                    cc_pCR3(1,l3)=1;
                end
            elseif CAn(1,l3)==3
                if (f3count3(1,l3)==1)&&(fcount3(1,l3)==1)
                    cc_pCR3(1,l3)=1;
                end
            elseif CAn(1,l3)==4
                if (f4count3(1,l3)==1)&&(fcount3(1,l3)==1)
                    cc_pCR3(1,l3)=1;
                end
            end
        end
    %% day4
        r_track4 = L_d4_track(:,(r_session));
        f1indx4 = contains(r_track4,f1pattern,"IgnoreCase",true);  %logical
        f2indx4 = contains(r_track4,f2pattern,"IgnoreCase",true);
        f3indx4 = contains(r_track4,f3pattern,"IgnoreCase",true);  
        f4indx4 = contains(r_track4,f4pattern,"IgnoreCase",true);
        findx4 = f1indx4+f2indx4+f3indx4+f4indx4;
        f1count4 = sum(f1indx4);
        f2count4 = sum(f2indx4);
        f3count4 = sum(f3indx4);
        f4count4 = sum(f4indx4);
        fcount4 = sum(findx4);
        cc_pCR4 = zeros(1,280);
        for l4=1:280
            if CAn(1,l4)==1
                if (f1count4(1,l4)==1)&&(fcount4(1,l4)==1)
                    cc_pCR4(1,l4)=1;
                end
            elseif CAn(1,l4)==2
                if (f2count4(1,l4)==1)&&(fcount4(1,l4)==1)
                    cc_pCR4(1,l4)=1;
                end
            elseif CAn(1,l4)==3
                if (f3count4(1,l4)==1)&&(fcount4(1,l4)==1)
                    cc_pCR4(1,l4)=1;
                end
            elseif CAn(1,l4)==4
                if (f4count4(1,l4)==1)&&(fcount4(1,l4)==1)
                    cc_pCR4(1,l4)=1;
                end
            end
        end
    %% day5
        r_track5 = L_d5_track(:,(r_session));
        f1indx5 = contains(r_track5,f1pattern,"IgnoreCase",true);  %logical
        f2indx5 = contains(r_track5,f2pattern,"IgnoreCase",true);
        f3indx5 = contains(r_track5,f3pattern,"IgnoreCase",true);  
        f4indx5 = contains(r_track5,f4pattern,"IgnoreCase",true);
        findx5 = f1indx5+f2indx5+f3indx5+f4indx5;
        f1count5 =sum(f1indx5);
        f2count5 =sum(f2indx5);
        f3count5 =sum(f3indx5);
        f4count5 =sum(f4indx5);
        fcount5 = sum(findx5);
        cc_pCR5 = zeros(1,280);
        for l5=1:280
            if CAn(1,l5)==1
                if (f1count5(1,l5)==1)&&(fcount5(1,l5)==1)
                    cc_pCR5(1,l5)=1;
                end
            elseif CAn(1,l5)==2
                if (f2count5(1,l5)==1)&&(fcount5(1,l5)==1)
                    cc_pCR5(1,l5)=1;
                end
            elseif CAn(1,l5)==3
                if (f3count5(1,l5)==1)&&(fcount5(1,l5)==1)
                    cc_pCR5(1,l5)=1;
                end
            elseif CAn(1,l5)==4
                if (f4count5(1,l5)==1)&&(fcount5(1,l5)==1)
                    cc_pCR5(1,l5)=1;
                end
            end
        end
        CL_pCR1(1,ss) = sum(cc_pCR1,2)/280;
        CL_pCR2(1,ss) = sum(cc_pCR2,2)/280;
        CL_pCR3(1,ss) = sum(cc_pCR3,2)/280;
        CL_pCR4(1,ss) = sum(cc_pCR4,2)/280;
        CL_pCR5(1,ss) = sum(cc_pCR5,2)/280;
    end
    %%
    cd C:\Users\sp_tamatsu\Documents\MATLAB\analysis\behavior\full_data
    save(name,'-mat')
end