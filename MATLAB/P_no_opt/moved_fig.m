%% moved figure
% data load
clear
cd C:\Users\sp_tamatsu\Documents\MATLAB\analysis\behavior\full_data\no_opt
MO = load('moved_only_n6.mat');
MCO = load('movedC_only_n7.mat');
moved_path = 'C:\Users\sp_tamatsu\Documents\MATLAB\edit_data\Injury\Control\moved';
[M_CL1_pCR, M_CL2_pCR, M_CL3_pCR, M_CL4_pCR, M_CL5_pCR] = f_Chance_Level_pCR(moved_path,"M_CL_pCR.mat");
[M_CL1_rule, M_CL2_rule, M_CL3_rule, M_CL4_rule, M_CL5_rule] = f_Chance_Level_rule(moved_path,"M_CL_rule.mat");
[Max_pCR, min_pCR] = f_CL_area(M_CL1_pCR, M_CL2_pCR, M_CL3_pCR, M_CL4_pCR, M_CL5_pCR);
[Max_rule, min_rule] = f_CL_area(M_CL1_rule, M_CL2_rule, M_CL3_rule, M_CL4_rule, M_CL5_rule);
fig_save_path = 'C:\Users\sp_tamatsu\Documents\MATLAB\analysis\behavior\full_data\no_opt\figure';
%% day movedC only pCR 
f1 = figure;
f1.Position = [100 100 1200 800];
f1.Name = "movedC pCR";
f1e1 =errorbar(1:5,MCO.pCR_day_ave,MCO.pCR_day_SD,'-k','LineWidth',2, ...
    'MarkerSize',7,'MarkerEdgeColor','k','MarkerFaceColor','k');
hold on
CL_pCR =area(1:5,[Max_pCR min_pCR]);
set(CL_pCR(1),'FaceColor','None','LineStyle',':','EdgeColor',"#797979")
set(CL_pCR(2),'FaceColor',"#797979",'FaceAlpha',0.2,'LineStyle',':','EdgeColor',"#797979")
f1_sc = scatter(1:5,MCO.t_pCR,'ko','MarkerFaceColor','k');
box off
xlim([0.9 5.1])
ylim([-0.1 1.0])
xlabel('Day','FontSize',25)
ylabel('Correct Answer','FontSize',25)
ax =gca;
ax.FontSize = 25;
xticks([1 2 3 4 5])
f1.Units = 'centimeters';
f1.PaperUnits = f1.Units;
f1.PaperPosition = [0, 0, f1.Position(3:4)];
f1.PaperSize = f1.Position(3:4);
cd (fig_save_path)
print('day_moved_Control_pCR','-dpdf')
saveas(f1,"day_moved_Control_pCR.jpg")
%% day movedC only rule 
f2 = figure;
f2.Position = [100 100 1200 800];
f2.Name = "movedC rule";
f2e1 =errorbar(1:5,MCO.rule_day_ave,MCO.rule_day_SD,'-k','LineWidth',2, ...
    'MarkerSize',7,'MarkerEdgeColor','k','MarkerFaceColor','k');
hold on
CL_rule =area(1:5,[Max_rule min_rule]);
set(CL_rule(1),'FaceColor','None','LineStyle',':','EdgeColor',"#797979")
set(CL_rule(2),'FaceColor',"#797979",'FaceAlpha',0.2,'LineStyle',':','EdgeColor',"#797979")
f2_sc = scatter(1:5,MCO.t_rule,'ko','MarkerFaceColor','k');
box off
xlim([0.9 5.1])
ylim([-0.1 1.0])
xlabel('Day','FontSize',25)
ylabel('Rule Learning','FontSize',25)
ax =gca;
ax.FontSize = 25;
xticks([1 2 3 4 5])
f2.Units = 'centimeters';
f2.PaperUnits = f2.Units;
f2.PaperPosition = [0, 0, f2.Position(3:4)];
f2.PaperSize = f2.Position(3:4);
cd (fig_save_path)
print('day_moved_Control_rule','-dpdf')
saveas(f2,"day_moved_Control_rule.jpg")
%% moved vs Control pCR
f3 = figure;
f3.Position = [100 100 1200 800];
f3.Name = "moved vs Control pCR";
f3e1 =errorbar(1:5,MCO.pCR_day_ave,MCO.pCR_day_SD,'-k','LineWidth',2, ...
    'MarkerSize',7,'MarkerEdgeColor','k','MarkerFaceColor','k');
hold on
f3e2 =errorbar(1.05:1:5.05,MO.pCR_day_ave,MO.pCR_day_SD,'-m','LineWidth',2, ...
    'MarkerSize',7,'MarkerEdgeColor','m','MarkerFaceColor','m');
f3_sc = scatter(1:5,MCO.t_pCR,'ko','MarkerFaceColor','k');
f3_si = scatter(1.05:1:5.05,MO.t_pCR,'mo','MarkerFaceColor','m');
box off
xlim([0.9 5.1])
ylim([-0.1 1.0])
xlabel('Day','FontSize',25)
ylabel('Correct Answer','FontSize',25)
ax =gca;
ax.FontSize = 25;
xticks([1 2 3 4 5])
legend({'Control','Injury'},'Location','best')
f3.Units = 'centimeters';
f3.PaperUnits = f3.Units;
f3.PaperPosition = [0, 0, f3.Position(3:4)];
f3.PaperSize = f3.Position(3:4);
cd (fig_save_path)
print('day_moved_vs_Control_pCR','-dpdf')
saveas(f3,"day_moved_vs_Control_pCR.jpg")
%% moved vs Control rule
f4 = figure;
f4.Position = [100 100 1200 800];
f4.Name = "moved vs Control rule";
f4e1 =errorbar(1:5,MCO.rule_day_ave,MCO.rule_day_SD,'-k','LineWidth',2, ...
    'MarkerSize',7,'MarkerEdgeColor','k','MarkerFaceColor','k');
hold on
f4e2 =errorbar(1.05:1:5.05,MO.rule_day_ave,MO.rule_day_SD,'-m','LineWidth',2, ...
    'MarkerSize',7,'MarkerEdgeColor','m','MarkerFaceColor','m');
f4_sc = scatter(1:5,MCO.t_rule,'ko','MarkerFaceColor','k');
f4_si = scatter(1.05:1:5.05,MO.t_rule,'mo','MarkerFaceColor','m');
box off
xlim([0.9 5.1])
ylim([-0.2 1.0])
xlabel('Day','FontSize',25)
ylabel('Rule Learning','FontSize',25)
ax =gca;
ax.FontSize = 25;
xticks([1 2 3 4 5])
legend({'Control','Injury'},'Location','best')
f4.Units = 'centimeters';
f4.PaperUnits = f4.Units;
f4.PaperPosition = [0, 0, f4.Position(3:4)];
f4.PaperSize = f4.Position(3:4);
cd (fig_save_path)
print('day_moved_vs_Control_rule','-dpdf')
saveas(f4,"day_moved_vs_Control_rule.jpg")
%% moved vs Control laps
f5 = figure;
f5.Position = [100 100 1200 800];
f5.Name ="moved laps";
f5e1 =errorbar(1:5,MCO.laps_day_ave,MCO.laps_day_SD,'-k','LineWidth',2, ...
    'MarkerSize',7,'MarkerEdgeColor','k','MarkerFaceColor','k');
hold on
f5e2 =errorbar(1.05:1:5.05,MO.laps_day_ave,MO.laps_day_SD,'-m','LineWidth',2, ...
    'MarkerSize',7,'MarkerEdgeColor','m','MarkerFaceColor','m');
f5_sc = scatter(1:5,MCO.t_laps,'ko','MarkerFaceColor','k');
f5_si = scatter(1.05:1:5.05,MO.t_laps,'mo','MarkerFaceColor','m');
box off
xlim([0.8 5.1])
ylim([0 11])
xlabel('Day','FontSize',25)
ylabel('Laps','FontSize',25)
ax =gca;
ax.FontSize = 25;
xticks([1 2 3 4 5])
legend({'Control','Injury'},'Location','best')
f5.Units = 'centimeters';
f5.PaperUnits = f5.Units;
f5.PaperPosition = [0, 0, f5.Position(3:4)];
f5.PaperSize = f5.Position(3:4);
cd (fig_save_path)
print('day_moved_vs_Control_laps','-dpdf')
saveas(f5,"day_moved_vs_Control_laps.jpg")
%% day moved vs Control speed
f6 = figure;
f6.Position = [100 100 1200 800];
f6.Name ="day_moved_speed";
f6e21 =errorbar(1:1:5,MCO.speed_day_ave,MCO.speed_day_SD,'-k','LineWidth',2, ...
    'MarkerSize',7,'MarkerEdgeColor','k','MarkerFaceColor','k');
hold on
f6e2 =errorbar(1.05:1:5.05,MO.speed_day_ave,MO.speed_day_SD,'-m','LineWidth',2, ...
    'MarkerSize',7,'MarkerEdgeColor','m','MarkerFaceColor','m');
f6_sc = scatter(1:5,MCO.t_speed,'ko','MarkerFaceColor','k');
f6_si = scatter(1.05:1:5.05,MO.t_speed,'mo','MarkerFaceColor','m');
box off
xlim([0.8 5.1])
%ylim([-0.2 1.2])
xlabel('day','FontSize',25)
ylabel('speed [cm/s]','FontSize',25)
xticks([1 2 3 4 5])
ax =gca;
ax.FontSize = 25;
legend({'Control','Injury'},'Location','best')
f6.Units = 'centimeters';
f6.PaperUnits = f6.Units;
f6.PaperPosition = [0, 0, f6.Position(3:4)];
f6.PaperSize = f6.Position(3:4);
cd (fig_save_path)
print('day_moved_vs_Control_speed','-dpdf')
saveas(f6,"day_moved_vs_Control_speed.jpg")