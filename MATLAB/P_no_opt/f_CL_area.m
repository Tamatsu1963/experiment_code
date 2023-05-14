function [Max, min] =f_CL_area(CL1,CL2,CL3,CL4,CL5)
    s_CL1 = sort(CL1,'descend');
    s_CL2 = sort(CL2,'descend');
    s_CL3 = sort(CL3,'descend');
    s_CL4 = sort(CL4,'descend');
    s_CL5 = sort(CL5,'descend');
    all_CL =[s_CL1;s_CL2;s_CL3;s_CL4;s_CL5];
    Max = all_CL(:,1);
    min = all_CL(:,100);
end