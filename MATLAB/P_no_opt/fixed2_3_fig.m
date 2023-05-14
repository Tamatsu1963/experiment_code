%% fixed2, 3 figure
clear, clc, close all
cd C:\Users\sp_tamatsu\Documents\MATLAB\analysis\behavior\full_data\no_opt
fixed2 = load("fixed2_n6.mat");
fixed2C = load("fixed2C_n7.mat");
fixed3 = load("fixed3_n6.mat");
fixed3C = load("fixed3C_n7.mat");
fig_save_path = 'C:\Users\sp_tamatsu\Documents\MATLAB\analysis\behavior\full_data\no_opt\figure';
%% fixed2 vs fixed3 pCR
f1 = figure;
f1.Position = [100 100 1200 800];
f1.Name ="Control fixed2 vs fixed3 pCR";
f1e1 =errorbar(1:5,fixed2C.pCR_day_ave,fixed2C.pCR_day_SD,'-k','LineWidth',2, ...
    'MarkerSize',7,'MarkerEdgeColor','k','MarkerFaceColor','k');
hold on
f1e2 =errorbar(1.05:1:5.05,fixed3C.pCR_day_ave,fixed3C.pCR_day_SD,'-m','LineWidth',2, ...
    'MarkerSize',7,'MarkerEdgeColor','m','MarkerFaceColor','m');
f1_sc = scatter(1:5,fixed2C.t_pCR,'ko','MarkerFaceColor','k');
f1_si = scatter(1.05:1:5.05,fixed3C.t_pCR,'mo','MarkerFaceColor','m');
box off
xlim([0.9 5.1]), ylim([0 1.2])
xlabel('Day','FontSize',25)
ylabel('Correct response rate','FontSize',25)
ax =gca;
ax.FontSize = 25;
xticks([1 2 3 4 5]), yticks([0 0.25 0.5 0.75 1.0])
legend({'fixed2','fixed3'},'Location','best')
f1.Units = 'centimeters';
f1.PaperUnits = f1.Units;
f1.PaperPosition = [0, 0, f1.Position(3:4)];
f1.PaperSize = f1.Position(3:4);
cd (fig_save_path)
print('day_Control_fixed2_vs_fixed3_pCR','-dpdf')
saveas(f1,"day_Control_fixed2_vs_fixed3_pCR.jpg")
%% Control fixed2 vs fixed3 rule
f2 = figure;
f2.Position = [100 100 1200 800];
f2.Name ="Control fixed2 vs fixed3 rule";
f2e1 =errorbar(1:5,fixed2C.pCR_day_ave,fixed2C.rule_day_SD,'-k','LineWidth',2, ...
    'MarkerSize',7,'MarkerEdgeColor','k','MarkerFaceColor','k');
hold on
f2e2 =errorbar(1.05:1:5.05,fixed3C.rule_day_ave,fixed3C.rule_day_SD,'-m','LineWidth',2, ...
    'MarkerSize',7,'MarkerEdgeColor','m','MarkerFaceColor','m');
f2_sc = scatter(1:5,fixed2C.t_rule,'ko','MarkerFaceColor','k');
f2_si = scatter(1.05:1:5.05,fixed3C.t_rule,'mo','MarkerFaceColor','m');
box off
xlim([0.9 5.1]), ylim([0 1.2])
xlabel('Day','FontSize',25), ylabel('Rule Learning rate','FontSize',25)
ax =gca;
ax.FontSize = 25;
xticks([1 2 3 4 5]), yticks([0 0.25 0.5 0.75 1.0])
legend({'fixed2','fixed3'},'Location','best')
f2.Units = 'centimeters';
f2.PaperUnits = f2.Units;
f2.PaperPosition = [0, 0, f2.Position(3:4)];
f2.PaperSize = f2.Position(3:4);
cd (fig_save_path)
print('day_Control_fixed2_vs_fixed3_rule','-dpdf')
saveas(f2,"day_Control_fixed2_vs_fixed3_rule.jpg")
%% Injury fixed2 vs fixed3 pCR
f3 = figure;
f3.Position = [100 100 1200 800];
f3.Name ="Injury fixed2 vs fixed3 pCR";
f3e1 =errorbar(1:5,fixed2.pCR_day_ave,fixed2.pCR_day_SD,'-k','LineWidth',2, ...
    'MarkerSize',7,'MarkerEdgeColor','k','MarkerFaceColor','k');
hold on
f3e2 =errorbar(1.05:1:5.05,fixed3.pCR_day_ave,fixed3.pCR_day_SD,'-m','LineWidth',2, ...
    'MarkerSize',7,'MarkerEdgeColor','m','MarkerFaceColor','m');
f3_sc = scatter(1:5,fixed2.t_pCR,'ko','MarkerFaceColor','k');
f3_si = scatter(1.05:1:5.05,fixed3.t_pCR,'mo','MarkerFaceColor','m');
box off
xlim([0.9 5.1]), ylim([-0.1 1.2])
xlabel('Day','FontSize',25), ylabel('Correct response rate','FontSize',25)
ax =gca;
ax.FontSize = 25;
xticks([1 2 3 4 5]), yticks([0 0.25 0.5 0.75 1.0])
legend({'fixed2','fixed3'},'Location','best')
f3.Units = 'centimeters';
f3.PaperUnits = f3.Units;
f3.PaperPosition = [0, 0, f3.Position(3:4)];
f3.PaperSize = f3.Position(3:4);
cd (fig_save_path)
print('day_Injury_fixed2_vs_fixed3_pCR','-dpdf')
saveas(f3,"day_Injury_fixed2_vs_fixed3_pCR.jpg")
%% Injury fixed2, 3 rule
f4 = figure;
f4.Position = [100 100 1200 800];
f4.Name ="Injury fixed2 vs fixed3 rule";
f4e1 =errorbar(1:5,fixed2.pCR_day_ave,fixed2.rule_day_SD,'-k','LineWidth',2, ...
    'MarkerSize',7,'MarkerEdgeColor','k','MarkerFaceColor','k');
hold on
f4e2 =errorbar(1.05:1:5.05,fixed3.rule_day_ave,fixed3.rule_day_SD,'-m','LineWidth',2, ...
    'MarkerSize',7,'MarkerEdgeColor','m','MarkerFaceColor','m');
f4_sc = scatter(1:5,fixed2.t_rule,'ko','MarkerFaceColor','k');
f4_si = scatter(1.05:1:5.05,fixed3.t_rule,'mo','MarkerFaceColor','m');
box off
xlim([0.9 5.1]), ylim([0 1.2])
xlabel('Day','FontSize',25), ylabel('Rule Learning rate','FontSize',25)
ax =gca;
ax.FontSize = 25;
xticks([1 2 3 4 5]), yticks([0 0.25 0.5 0.75 1.0])
legend({'fixed2','fixed3'},'Location','best')
f4.Units = 'centimeters';
f4.PaperUnits = f4.Units;
f4.PaperPosition = [0, 0, f4.Position(3:4)];
f4.PaperSize = f4.Position(3:4);
cd (fig_save_path)
print('day_Injury_fixed2_vs_fixed3_rule','-dpdf')
saveas(f4,"day_Injury_fixed2_vs_fixed3_rule.jpg")