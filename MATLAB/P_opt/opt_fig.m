clear
cd C:\Users\sp_tamatsu\Documents\MATLAB\analysis\behavior\full_data\opt
hpre = load("high_pre_n6.mat");
hpost =load("high_post_n6.mat");
hc = load("no_light_n6.mat"); 
nr2 = load("no_reward2_n6.mat");
lpost= load("low_post_n5.mat");
lpre = load("low_pre_n5.mat");
lc = load("ln_light_n5.mat");

%% hpost pCR
f1 = figure;
f1.Name = "fpCR vs post";
f1.Position = [100 100 1200 800];
e_cont1 = errorbar(1:5,hc.fpCR_day_ave,hc.fpCR_day_SD,'-k',"LineWidth",1.5,'MarkerSize',5, ...
    'MarkerEdgeColor','k','MarkerFaceColor','k'); 
hold on
e_post1 = errorbar(1.05:1:5.05,hpost.fpCR_day_ave,hpost.fpCR_day_SD,'-m',"LineWidth",1.5,'MarkerSize',5, ...
    'MarkerEdgeColor','m','MarkerFaceColor','m');
s_cont1 = scatter(1:5,hc.t_fpCR,'ko','MarkerFaceColor','k');
s_post1 = scatter(1.05:1:5.05,hpost.t_fpCR,'mo','MarkerFaceColor','m');
box off
xlim([0.7 5.3])
ylim([0 1.2])
xticks([1 2 3 4 5])
yticks([0 0.2 0.4 0.6 0.8 1.0])
xlabel('Day','FontSize',25)
ylabel('Correct Answer','FontSize',25)
ax =gca;
ax.FontSize = 25;
legend({'no light','post'},'Location','best')
f1.Units = 'centimeters';
f1.PaperUnits = f1.Units;
f1.PaperPosition = [0, 0, f1.Position(3:4)];
f1.PaperSize = f1.Position(3:4);
print('high_post_pCR','-dpdf')
saveas(f1,"high_post_pCR.jpg")
%% hpost rule
f2 = figure;
f2.Name = "frule vs post";
f2.Position = [100 100 1200 800];
e_cont2 = errorbar(1:5,hc.frule_ave,hc.frule_SD,'-k',"LineWidth",1.5,'MarkerSize',5, ...
    'MarkerEdgeColor','k','MarkerFaceColor','k'); 
hold on
e_post2 = errorbar(1.05:1:5.05,hpost.frule_ave,hpost.frule_SD,'-m',"LineWidth",1.5,'MarkerSize',5, ...
    'MarkerEdgeColor','m','MarkerFaceColor','m');
s_cont2 = scatter(1:5,hc.t_frule,'ko','MarkerFaceColor','k');
s_post2 = scatter(1.05:1:5.05,hpost.t_frule,'mo','MarkerFaceColor','m');
box off
xlim([0.7 5.3])
ylim([0 1.2])
xticks([1 2 3 4 5])
yticks([0 0.2 0.4 0.6 0.8 1.0])
xlabel('Day','FontSize',25)
ylabel('Rule Learning','FontSize',25)
ax =gca;
ax.FontSize = 25;
legend({'no light','post'},'Location','best')
f2.Units = 'centimeters';
f2.PaperUnits = f2.Units;
f2.PaperPosition = [0, 0, f2.Position(3:4)];
f2.PaperSize = f2.Position(3:4);
print('high_post_rule','-dpdf')
saveas(f2,"high_post_rule.jpg")
%% high pre pCR
f3 = figure;
f3.Name = "pCR vs pre";
f3.Position = [100 100 1200 800];
e_cont3 = errorbar(1:5,hc.pCR_day_ave,hc.pCR_day_SD,'-k',"LineWidth",1.5,'MarkerSize',5, ...
    'MarkerEdgeColor','k','MarkerFaceColor','k'); 
hold on
epre3 =errorbar(1.05:1:5.05,hpre.rule_day_ave,hpre.rule_day_SD,'-b',"LineWidth",2,'MarkerSize',5, ...
    'MarkerEdgeColor','b','MarkerFaceColor','b');
s_cont3 = scatter(1:5,hc.t_pCR,'ko','MarkerFaceColor','k');
s_post3 = scatter(1.05:1:5.05,hpost.t_pCR,'bo','MarkerFaceColor','b');
box off
xlim([0.7 5.3])
ylim([0 1.2])
xticks([1 2 3 4 5])
yticks([0 0.2 0.4 0.6 0.8 1.0])
xlabel('Day','FontSize',25)
ylabel('Correct Answer','FontSize',25)
ax =gca;
ax.FontSize = 25;
legend({'no light','pre'},'Location','best')
f3.Units = 'centimeters';
f3.PaperUnits = f3.Units;
f3.PaperPosition = [0, 0, f3.Position(3:4)];
f3.PaperSize = f3.Position(3:4);
print('high_pre_pCR','-dpdf')
saveas(f3,"high_pre_pCR.jpg")
%% high pre rule
f4 = figure;
f4.Name = "rule vs pre";
f4.Color = 'w';
f4.Position = [100 100 1200 800];
econt4 = errorbar(1:5,hc.rule_day_ave,hc.rule_day_SD,'-k',"LineWidth",2,'MarkerSize',5, ...
    'MarkerEdgeColor','k','MarkerFaceColor','k'); 
hold on
epre4 =errorbar(1.05:1:5.05,hpre.rule_day_ave,hpre.rule_day_SD,'-b',"LineWidth",2,'MarkerSize',5, ...
    'MarkerEdgeColor','b','MarkerFaceColor','b');
s_cont4 = scatter(1:5,hc.t_rule,'ko','MarkerFaceColor','k');
s_post4 = scatter(1.05:1:5.05,hpost.t_rule,'bo','MarkerFaceColor','b');
box off
xlim([0.7 5.3])
ylim([0 1.2])
xticks([1 2 3 4 5])
yticks([0 0.2 0.4 0.6 0.8 1.0])
xlabel('Day','FontSize',25)
ylabel('Rule Learning','FontSize',25)
ax =gca;
ax.FontSize = 25;
legend({'no light','pre'},'Location','best')
f4.Units = 'centimeters';
f4.PaperUnits = f4.Units;
f4.PaperPosition = [0, 0, f4.Position(3:4)];
f4.PaperSize = f4.Position(3:4);
print('high_pre_rulerule','-dpdf')
saveas(f4,"high_pre_rule.jpg")
%% no reward pCR
f5 = figure;
f5.Name = "fpCR vs no reward";
f5.Color = 'w';
f5.Position = [100 100 1200 800];
econt5 = errorbar(1:5,hc.fpCR_day_ave,hc.fpCR_day_SD,'-k',"LineWidth",2,'MarkerSize',5, ...
    'MarkerEdgeColor','k','MarkerFaceColor','k'); 
hold on
enrw5 =errorbar(1.05:1:5.05,nr2.fpCR_day_ave,nr2.fpCR_day_SD,'-g',"LineWidth",2,'MarkerSize',5, ...
    'MarkerEdgeColor','b','MarkerFaceColor','b');
s_cont5 = scatter(1:5,hc.t_fpCR,'ko','MarkerFaceColor','k');
s_nrw5 = scatter(1.05:1:5.05,nr2.t_fpCR,'go','MarkerFaceColor','g');
box off
xlim([0.7 5.3])
ylim([0 1.2])
xticks([1 2 3 4 5])
yticks([0 0.2 0.4 0.6 0.8 1.0])
xlabel('Day','FontSize',25)
ylabel('Correct Answer','FontSize',25)
ax =gca;
ax.FontSize = 25;
legend({'Control','no reward'},'Location','best')
f5.Units = 'centimeters';
f5.PaperUnits = f5.Units;
f5.PaperPosition = [0, 0, f5.Position(3:4)];
f5.PaperSize = f5.Position(3:4);
print('noreward_pCR','-dpdf')
saveas(f5,"noreward_pCR.jpg")
%% no reward rule
f6 = figure;
f6.Name = "frule vs no reward";
f6.Color = 'w';
f6.Position = [100 100 1200 800];
econt6 = errorbar(1:5,hc.frule_ave,hc.frule_SD,'-k',"LineWidth",2,'MarkerSize',5, ...
    'MarkerEdgeColor','k','MarkerFaceColor','k'); 
hold on
enrw6 =errorbar(1.05:1:5.05,nr2.frule_ave,nr2.frule_SD,'-g',"LineWidth",2,'MarkerSize',5, ...
    'MarkerEdgeColor','g','MarkerFaceColor','g');
s_cont6 = scatter(1:5,hc.t_frule,'ko','MarkerFaceColor','k');
s_nrw6 = scatter(1.05:1:5.05,nr2.t_frule,'go','MarkerFaceColor','g');
box off
xlim([0.7 5.3])
ylim([0 1.2])
xticks([1 2 3 4 5])
yticks([0 0.2 0.4 0.6 0.8 1.0])
xlabel('Day','FontSize',25)
ylabel('Rule Learning','FontSize',25)
ax =gca;
ax.FontSize = 25;
legend({'Control','no reward'},'Location','best')
f6.Units = 'centimeters';
f6.PaperUnits = f6.Units;
f6.PaperPosition = [0, 0, f6.Position(3:4)];
f6.PaperSize = f6.Position(3:4);
print('noreward_rule','-dpdf')
saveas(f6,"noreward_rule.jpg")
%% low post pCR
f7 = figure;
f7.Name = "low post pCR";
f7.Position = [100 100 1200 800];
e_cont7 = errorbar(1:5,lc.fpCR_day_ave,lc.fpCR_day_SD,'-k',"LineWidth",1.5,'MarkerSize',5, ...
    'MarkerEdgeColor','k','MarkerFaceColor','k'); 
hold on
e_post7 = errorbar(1.05:1:5.05,lpost.fpCR_day_ave,lpost.fpCR_day_SD,'-m',"LineWidth",1.5,'MarkerSize',5, ...
    'MarkerEdgeColor','m','MarkerFaceColor','m');
s_cont7 = scatter(1:5,lc.t_fpCR','ko','MarkerFaceColor','k');
s_post7 = scatter(1.05:1:5.05,lpost.t_fpCR','mo','MarkerFaceColor','m');
box off
xlim([0.7 5.3])
ylim([0 1.2])
xticks([1 2 3 4 5])
yticks([0 0.2 0.4 0.6 0.8 1.0])
xlabel('Day','FontSize',25)
ylabel('Correct Answer','FontSize',25)
ax =gca;
ax.FontSize = 25;
legend({'no light','post'},'Location','best')
f7.Units = 'centimeters';
f7.PaperUnits = f7.Units;
f7.PaperPosition = [0, 0, f7.Position(3:4)];
f7.PaperSize = f7.Position(3:4);
print('low_post_pCR','-dpdf')
saveas(f7,"low_post_pCR.jpg")
%% low post rule
f8 = figure;
f8.Name = "low post rule";
f8.Position = [100 100 1200 800];
e_cont8 = errorbar(1:5,lc.frule_ave,lc.frule_SD,'-k',"LineWidth",1.5,'MarkerSize',5, ...
    'MarkerEdgeColor','k','MarkerFaceColor','k'); 
hold on
e_post8 = errorbar(1.05:1:5.05,lpost.frule_ave,lpost.frule_SD,'-m',"LineWidth",1.5,'MarkerSize',5, ...
    'MarkerEdgeColor','m','MarkerFaceColor','m');
s_cont8 = scatter(1:5,lc.t_frule','ko','MarkerFaceColor','k');
s_post8 = scatter(1.05:1:5.05,lpost.t_frule','mo','MarkerFaceColor','m');
box off
xlim([0.7 5.3])
ylim([0 1.2])
xticks([1 2 3 4 5])
yticks([0 0.2 0.4 0.6 0.8 1.0])
xlabel('Day','FontSize',25)
ylabel('Rule Learning','FontSize',25)
ax =gca;
ax.FontSize = 25;
legend({'no light','post'},'Location','best')
f8.Units = 'centimeters';
f8.PaperUnits = f8.Units;
f8.PaperPosition = [0, 0, f8.Position(3:4)];
f8.PaperSize = f8.Position(3:4);
print('low_post_rule','-dpdf')
saveas(f8,"low_post_rule.jpg")
%% low pre pCR
f9 = figure;
f9.Name = "low pre pCR";
f9.Position = [100 100 1200 800];
e_cont9 = errorbar(1:5,lc.pCR_day_ave,lc.pCR_day_SD,'-k',"LineWidth",1.5,'MarkerSize',5, ...
    'MarkerEdgeColor','k','MarkerFaceColor','k'); 
hold on
e_post9 = errorbar(1.05:1:5.05,lpre.pCR_day_ave,lpre.pCR_day_SD,'-b',"LineWidth",1.5,'MarkerSize',5, ...
    'MarkerEdgeColor','b','MarkerFaceColor','b');
s_cont9 = scatter(1:5,lc.t_pCR','ko','MarkerFaceColor','k');
s_post9 = scatter(1.05:1:5.05,lpre.t_pCR','bo','MarkerFaceColor','b');
box off
xlim([0.7 5.3])
ylim([0 1.2])
xticks([1 2 3 4 5])
yticks([0 0.2 0.4 0.6 0.8 1.0])
xlabel('Day','FontSize',25)
ylabel('Correct Answer','FontSize',25)
ax =gca;
ax.FontSize = 25;
legend({'no light','post'},'Location','best')
f9.Units = 'centimeters';
f9.PaperUnits = f9.Units;
f9.PaperPosition = [0, 0, f9.Position(3:4)];
f9.PaperSize = f9.Position(3:4);
print('low_pre_pCR','-dpdf')
saveas(f9,"low_pre_pCR.jpg")
%% low pre rule
f10 = figure;
f10.Name = "low pre rule";
f10.Position = [100 100 1200 800];
e_cont10 = errorbar(1:5,lc.rule_day_ave,lc.rule_day_SD,'-k',"LineWidth",1.5,'MarkerSize',5, ...
    'MarkerEdgeColor','k','MarkerFaceColor','k'); 
hold on
e_pre10 = errorbar(1.05:1:5.05,lpre.rule_day_ave,lpre.rule_day_SD,'-b',"LineWidth",1.5,'MarkerSize',5, ...
    'MarkerEdgeColor','b','MarkerFaceColor','b');
s_cont10 = scatter(1:5,lc.t_rule','ko','MarkerFaceColor','k');
s_pre10 = scatter(1.05:1:5.05,lpre.t_rule','bo','MarkerFaceColor','b');
box off
xlim([0.7 5.3])
ylim([0 1.2])
xticks([1 2 3 4 5])
yticks([0 0.2 0.4 0.6 0.8 1.0])
xlabel('Day','FontSize',25)
ylabel('Rule Learning','FontSize',25)
ax =gca;
ax.FontSize = 25;
legend({'no light','post'},'Location','best')
f10.Units = 'centimeters';
f10.PaperUnits = f10.Units;
f10.PaperPosition = [0, 0, f10.Position(3:4)];
f10.PaperSize = f10.Position(3:4);
print('low_pre_rule','-dpdf')
saveas(f10,"low_pre_rule.jpg")