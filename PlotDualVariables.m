function [alpha1_star, alpha1, alpha2_star, alpha2, alpha3_star, alpha3, alpha4_star, alpha4, alpha5_star, alpha5, alpha6_star, alpha6, alpha7_star, alpha7, alpha8_star, alpha8] = PlotDualVariables(h1, history1, history2, history3, history4, history5, history6, history7, history8, m)

%% Find number of iterations for each 8 different optimization problem
iter1 = size(history1.fval,1);
iter2 = size(history2.fval,1);
iter3 = size(history3.fval,1);
iter4 = size(history4.fval,1);
iter5 = size(history5.fval,1);
iter6 = size(history6.fval,1);
iter7 = size(history7.fval,1);
iter8 = size(history8.fval,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Extract the dual variables for each 8 different optimization problem
alpha1_star = history1.x((2*m*(iter1-1) + 1):(2*m*(iter1-1) + m));
alpha1 = history1.x((2*m*(iter1-1) + m + 1):(2*m*iter1));

alpha2_star = history2.x((2*m*(iter2-1) + 1):(2*m*(iter2-1) + m));
alpha2 = history2.x((2*m*(iter2-1) + m + 1):(2*m*iter2));

alpha3_star = history3.x((2*m*(iter3-1) + 1):(2*m*(iter3-1) + m));
alpha3 = history3.x((2*m*(iter3-1) + m + 1):(2*m*iter3));

alpha4_star = history4.x((2*m*(iter4-1) + 1):(2*m*(iter4-1) + m));
alpha4 = history4.x((2*m*(iter4-1) + m + 1):(2*m*iter4));

alpha5_star = history5.x((2*m*(iter5-1) + 1):(2*m*(iter5-1) + m));
alpha5 = history5.x((2*m*(iter5-1) + m + 1):(2*m*iter5));

alpha6_star = history6.x((2*m*(iter6-1) + 1):(2*m*(iter6-1) + m));
alpha6 = history6.x((2*m*(iter6-1) + m + 1):(2*m*iter6));

alpha7_star = history7.x((2*m*(iter7-1) + 1):(2*m*(iter7-1) + m));
alpha7 = history7.x((2*m*(iter7-1) + m + 1):(2*m*iter7));

alpha8_star = history8.x((2*m*(iter8-1) + 1):(2*m*(iter8-1) + m));
alpha8 = history8.x((2*m*(iter8-1) + m + 1):(2*m*iter8));

figure(h1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot dual variables Alpha and alpha-star for each 8 different optimization problem
%Plot Cost function per iteration for each 8 optimization problem
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% w1
subplot(3,8,1);
plot(alpha1_star, '-*', 'color' , 'blue')
xlabel('')
ylabel('')
title('alpha1-star')

subplot(3,8,9); 
plot(alpha1, '-*', 'color' , 'red')
xlabel('')
ylabel('')
title('alpha1')

subplot(3,8,17);
plot(history1.fval, '-*', 'color' , 'green')
xlabel('# iterations')
ylabel('Cost')
title('w1 = [alpha1-star alpha1]')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% w2
subplot(3,8,2);
plot(alpha2_star, '-*', 'color' , 'blue')
xlabel('')
ylabel('')
title('alpha2-star')

subplot(3,8,10); 
plot(alpha2, '-*', 'color' , 'red')
xlabel('')
ylabel('')
title('alpha2')

subplot(3,8,18);
plot(history2.fval, '-*', 'color' , 'green')
xlabel('# iterations')
ylabel('Cost')
title('w2 = [alpha2-star alpha2]')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% w3
subplot(3,8,3);
plot(alpha3_star, '-*', 'color' , 'blue')
xlabel('')
ylabel('')
title('alpha3-star')

subplot(3,8,11); 
plot(alpha3, '-*', 'color' , 'red')
xlabel('')
ylabel('')
title('alpha3')

subplot(3,8,19);
plot(history3.fval, '-*', 'color' , 'green')
xlabel('# iterations')
ylabel('Cost')
title('w3 = [alpha3-star alpha3]')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% w4
subplot(3,8,4);
plot(alpha4_star, '-*', 'color' , 'blue')
xlabel('')
ylabel('')
title('alpha4-star')

subplot(3,8,12); 
plot(alpha4, '-*', 'color' , 'red')
xlabel('')
ylabel('')
title('alpha4')

subplot(3,8,20);
plot(history4.fval, '-*', 'color' , 'green')
xlabel('# iterations')
ylabel('Cost')
title('w4 = [alpha4-star alpha4]')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% w5
subplot(3,8,5);
plot(alpha5_star, '-*', 'color' , 'blue')
xlabel('')
ylabel('')
title('alpha5-star')

subplot(3,8,13); 
plot(alpha5, '-*', 'color' , 'red')
xlabel('')
ylabel('')
title('alpha5')

subplot(3,8,21);
plot(history5.fval, '-*', 'color' , 'green')
xlabel('# iterations')
ylabel('Cost')
title('w5 = [alpha5-star alpha5]')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% w6
subplot(3,8,6);
plot(alpha6_star, '-*', 'color' , 'blue')
xlabel('')
ylabel('')
title('alpha6-star')

subplot(3,8,14); 
plot(alpha6, '-*', 'color' , 'red')
xlabel('')
ylabel('')
title('alpha6')

subplot(3,8,22);
plot(history6.fval, '-*', 'color' , 'green')
xlabel('# iterations')
ylabel('Cost')
title('w6 = [alpha6-star alpha6]')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% w7
subplot(3,8,7);
plot(alpha7_star, '-*', 'color' , 'blue')
xlabel('')
ylabel('')
title('alpha7-star')

subplot(3,8,15); 
plot(alpha7, '-*', 'color' , 'red')
xlabel('')
ylabel('')
title('alpha7')

subplot(3,8,23);
plot(history7.fval, '-*', 'color' , 'green')
xlabel('# iterations')
ylabel('Cost')
title('w7 = [alpha7-star alpha7]')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% w8
subplot(3,8,8);
plot(alpha8_star, '-*', 'color' , 'blue')
xlabel('')
ylabel('')
title('alpha8-star')

subplot(3,8,16); 
plot(alpha8, '-*', 'color' , 'red')
xlabel('')
ylabel('')
title('alpha8')

subplot(3,8,24);
plot(history8.fval, '-*', 'color' , 'green')
xlabel('# iterations')
ylabel('Cost')
title('w8 = [alpha8-star alpha8]')

end